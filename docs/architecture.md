# CareerAgent 架构说明

当前阶段采用前后端分离结构。React 应用通过 `/api` 访问 Spring Boot；开发环境由 Vite 将请求代理到 `http://localhost:8080`。Spring Boot 使用 PostgreSQL 作为持久化数据库、Redis 作为缓存及后续任务状态存储。

Agent 层通过 `LLMAdapter` 隔离模型供应商。`RoutingLLMAdapter` 在每次调用时读取当前用户配置，并在确定性的 `MockLLMAdapter` 与 OpenAI-compatible 实现之间路由，因此前端保存模型配置后无需重启。API Key 由后端 AES-GCM 加密保存，环境变量配置作为未创建用户配置时的兜底。`ToolRegistry` 自动发现 Spring Bean 形式的 `AgentTool`，编排器不通过 if/else 绑定工具。

读工具经参数 Schema 校验后直接调用已有 Service，并保存 `tool_execution` 审计记录。写工具只生成 `pending_action`，不会在对话请求中修改业务数据；用户调用 confirm 后才在数据库事务与行锁保护下执行，重复 confirm 返回 409，reject 会取消对应执行。所有工具复用现有 Service 的用户归属校验。

普通 HTTP 与 SSE 共用同一编排结果。SSE 使用统一 JSON 事件模型，当前事件包括 `conversation`、`tool_start`、`tool_result`、`confirmation_required`、`message_delta`、`message`、`done` 和 `error`。前端 `/dev/agent` 提供最小调试界面。

第四阶段为 `LLMAdapter` 增加泛型 Structured Output，响应直接反序列化到明确 DTO，解析失败最多重试两次（共三次尝试），不通过正则截取 JSON。Prompt 集中在 `agent/prompt`，并明确把 JD/Resume 视为数据、禁止编造事实。

编排器支持最多 8 步 Tool Loop。新增 `analyze_job_description`、`match_resume_to_job`、`rewrite_experience` 三个无需确认的分析工具；每次调用仍写入 ToolExecution。SSE 仅发送“正在分析 JD”等进度状态，不暴露模型推理过程。
