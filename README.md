# CareerAgent

CareerAgent 是一个智能体驱动的个人求职管理平台，围绕岗位发现、JD 分析、简历匹配与优化、投递管理、模拟面试等流程，帮助用户完成从岗位搜索到面试复盘的完整求职闭环。

## Features

- 岗位搜索与管理
- Greenhouse、Lever 等招聘源接入
- JD 智能分析
- 简历上传、解析与诊断
- 简历与岗位匹配
- AI 简历优化建议
- 投递状态跟踪
- AI 模拟面试
- Agent 智能助手


## Tech Stack

### Frontend

- React
- Vite
- React Router
- Zustand
- TanStack Query
- Tailwind CSS


### Backend

- Java 17
- Spring Boot
- Spring Security
- MyBatis-Plus
- PostgreSQL
- Redis


### Infrastructure

- Docker
- Docker Compose
- Nginx



## Project Structure

```

CareerAgent/

├── frontend/
│   └── career-web/       # React 前端

├── backend/
│   └── career-server/    # Spring Boot 后端

├── docs/                # 项目文档

├── docker-compose.yml

├── career-agent         # 一键启动脚本

└── README.md

````


# Quick Start

## Requirements

安装：

- Docker Desktop


无需额外安装：

- Java
- Maven
- Node.js
- PostgreSQL
- Redis


## Start


在项目根目录执行：

```bash
./career-agent up
````

启动后会自动：

* 构建前端和后端镜像
* 启动 PostgreSQL
* 启动 Redis
* 启动 Spring Boot 服务
* 启动 Nginx

## Access

Frontend:

```
http://localhost:5173
```

Backend:

```
http://localhost:8080
```

Health Check:

```
http://localhost:8080/api/health
```

## Common Commands

查看服务状态：

```bash
./career-agent status
```

查看日志：

```bash
./career-agent logs
```

重启：

```bash
./career-agent restart
```

停止：

```bash
./career-agent down
```

更新：

```bash
./career-agent update
```

## Configuration

复制环境变量：

```bash
cp .env.example .env
```

根据需要修改：

* 数据库配置
* Redis 配置
* AI 模型配置

## Development

Frontend:

```bash
cd frontend/career-web

npm install

npm run dev
```

Backend:

```bash
cd backend/career-server

mvn spring-boot:run
```
