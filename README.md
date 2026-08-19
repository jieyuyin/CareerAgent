# CareerAgent

CareerAgent 是一个智能体驱动的个人求职管理平台，计划串联岗位发现、JD 分析、简历匹配与优化、投递管理、面试准备和复盘。

当前已完成 PC 岗位雷达及官网源 MVP：可以连接 Greenhouse、Lever 公开招聘 API，也可以从岗位雷达按关键词、城市和页码搜索字节跳动公开社招岗位。外部岗位统一标准化、去重后进入现有 JD 分析和简历匹配链路。

## 技术栈

- 前端：React、Vite、React Router、Zustand、TanStack Query、Axios、Tailwind CSS（JavaScript）
- 后端：Java 17、Spring Boot、Spring Security、MyBatis-Plus、PostgreSQL、Redis、Maven
- 基础设施：Docker Compose

## 目录

```text
CareerAgent/
├── frontend/career-web/     # React 前端
├── backend/career-server/   # Spring Boot 后端
├── docs/                    # 项目文档
├── docker-compose.yml
├── .env.example
├── .gitignore
└── README.md
```

## 环境要求

- Node.js 20.19+（或 22.12+）与 npm
- Java 17 与 Maven 3.9+
- Docker 与 Docker Compose

## 快速启动

1. 创建本地环境变量文件：

   ```bash
   cp .env.example .env
   ```

2. 启动 PostgreSQL 和 Redis：

   ```bash
   docker compose up -d
   ```

3. 启动后端（新终端）：

   ```bash
   cd backend/career-server
   set -a
   source ../../.env
   set +a
   mvn spring-boot:run -Dspring-boot.run.profiles=dev
   ```

4. 启动前端（新终端）：

   ```bash
   cd frontend/career-web
   npm install
   npm run dev
   ```

访问前端 <http://localhost:5173>，后端健康接口为 <http://localhost:8080/api/health>，Actuator 健康接口为 <http://localhost:8080/actuator/health>。
Agent 调试页为 <http://localhost:5173/dev/agent>。没有真实 LLM Key 时默认启用 `MockLLMAdapter`；也可以在左侧“系统 → 模型配置”中填写 OpenAI-compatible 服务，保存后动态生效。
默认首页即 PC 岗位雷达；基础简历页为 `/resume`，编辑页为 `/resume/edit/{id}`，岗位专属简历占位页为 `/resumes/customize?jobId={id}`。

## 配置说明

数据库密码等部署凭据通过环境变量注入。模型配置既支持 `CAREER_AI_*` 环境变量兜底，也支持登录后在前端配置；用户 API Key 由后端使用 AES-GCM 加密保存，查询接口不返回明文。生产环境必须提供独立且稳定的 `CAREER_CONFIG_ENCRYPTION_KEY`。`.env` 不会提交到 Git；可提交的示例配置见 `.env.example`。

## 构建检查

```bash
cd frontend/career-web && npm run build
cd backend/career-server && mvn -DforkCount=0 clean verify
docker compose config
```

更多说明见 [docs/architecture.md](docs/architecture.md)。

## 数据库与测试账号

- PostgreSQL：`localhost:15432`，数据库名默认 `career_agent`
- Redis：`localhost:16379`
- Flyway：应用启动时自动执行 `backend/career-server/src/main/resources/db/migration`
- 开发用户：`id=1`，用户名 `demo`

开发环境通过 `CurrentUserProvider` 统一提供测试用户 ID，业务 Service 不直接硬编码。数据关系和 JSONB 设计见 [docs/database.md](docs/database.md)。

## 核心 API

- 岗位：`POST/GET /api/jobs`，`GET/PUT/DELETE /api/jobs/{id}`
- 简历：`POST/GET /api/resumes`，`GET /api/resumes/current`，`GET/PUT/DELETE /api/resumes/{id}`，`PUT /api/resumes/{id}/default`
- 简历智能处理：`POST /api/resumes/upload`（PDF/DOCX 草稿）、`POST /api/resumes/parse`、`POST /api/resumes/{id}/diagnosis`
- 邮箱：`GET/POST /api/email/account`、`POST /api/email/test`、`POST /api/email/sync`、`GET /api/email/recruitment-emails`
- 模拟面试：`POST/GET /api/interviews`、`GET /api/interviews/{id}/messages`、`POST /api/interviews/{id}/message`、`POST /api/interviews/{id}/finish`
- 简历版本：`POST/GET /api/resume-versions`，`GET /api/resume-versions/{id}`
- 投递：`POST/GET /api/applications`，`GET/PUT /api/applications/{id}`
- 状态流转：`PUT /api/applications/{id}/status`
- 状态历史：`GET /api/applications/{id}/events`
- Agent 对话：`POST /api/agent/chat`，SSE：`POST /api/agent/chat/stream`
- 人工确认：`POST /api/agent/actions/{id}/confirm|reject`
- Agent 查询：`GET /api/agent/conversations`、`/{id}/messages`、`/{id}/tool-executions`
- 改写建议：`GET /api/rewrite-suggestions/{id}`，`POST /api/rewrite-suggestions/{id}/accept|reject|regenerate`
- 页面直连接口：`POST /api/jobs/{id}/analyze`，`GET /api/job-matches/latest`，`POST /api/job-matches`
- 模型配置：`GET/PUT /api/system/ai-config`，连接测试：`POST /api/system/ai-config/test`
- 官网源：`POST/GET /api/job-sources`，`GET/PUT/DELETE /api/job-sources/{id}`，手动同步：`POST /api/job-sources/{id}/sync`
- 字节岗位搜索并导入：`POST /api/job-sources/bytedance/search`
- 字节 2027 校招搜索并导入：`POST /api/job-sources/bytedance/campus/search`

字节公开接口目前会拒绝非浏览器类型的默认 Java User-Agent。项目只配置标准 `User-Agent` 以通过公开接口网关，不使用 Cookie、设备标识、CSRF Token 或签名；可通过 `BYTEDANCE_JOB_USER_AGENT` 覆盖。
校招默认使用字节公开筛选配置中的 `2027届校园招聘` 项目 ID，可通过 `BYTEDANCE_CAMPUS_SUBJECT_ID` 覆盖。

所有 API 使用统一响应格式：`{"code":0,"message":"success","data":...}`。

## 当前进度

- [x] React/Vite 与 Spring Boot 工程
- [x] PostgreSQL、Redis 与 Docker Compose
- [x] User、JobDescription、Resume、ResumeVersion、Application、ApplicationEvent
- [x] Flyway V1、外键、索引和开发数据
- [x] 核心 CRUD、分页、参数校验和统一异常处理
- [x] Application 状态历史事务
- [x] 前端基础 API 模块
- [x] MockLLMAdapter、Tool Registry、Agent Orchestrator、SSE 与人工确认
- [x] JD Structured Output、Resume Match Evidence、RewriteSuggestion 人工审核
- [x] PC 岗位雷达、搜索筛选、证据详情和专属简历入口
- [x] Master Resume 上传解析、确认创建、编辑和 AI 诊断
- [x] 163 邮箱连接、招聘邮件识别和投递状态联动
- [x] 多会话模拟面试、AI 追问、历史恢复和面试总结
- [x] 前端模型配置、加密密钥存储、OpenAI-compatible 动态路由
- [x] Greenhouse/Lever 官网源管理、手动同步、标准化与数据库去重
- [x] JobSourceAdapter、字节公开岗位搜索、城市映射、分页与岗位雷达导入
- [ ] ResumeVersion、RAG 和 PDF


起服务：
doker：docker compose up -d
后端：
cd /Users/edy/Desktop/文档/Intern/CareerAgent/backend/career-server

set -a
source ../../.env
set +a

env -u LC_ALL \
  LANG=en_US.UTF-8 \
  LC_CTYPE=en_US.UTF-8 \
  mvn spring-boot:run -Dspring-boot.run.profiles=dev

前端：npm run dev
