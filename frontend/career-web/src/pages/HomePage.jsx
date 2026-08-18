import { useQuery } from '@tanstack/react-query'
import { getHealth } from '../api/health.js'

export default function HomePage() {
  const health = useQuery({ queryKey: ['health'], queryFn: getHealth, retry: false })
  const status = health.isPending ? '检测中' : health.isSuccess ? '已连接' : '后端未连接'

  return (
    <main className="mx-auto flex min-h-screen max-w-5xl items-center px-6 py-16">
      <section className="w-full rounded-3xl border border-slate-200 bg-white p-10 shadow-sm">
        <p className="mb-3 text-sm font-semibold uppercase tracking-[0.2em] text-indigo-600">CareerAgent</p>
        <h1 className="text-4xl font-bold tracking-tight text-slate-950">智能体驱动的个人求职管理平台</h1>
        <p className="mt-5 max-w-2xl text-lg leading-8 text-slate-600">
          第一阶段工程骨架已就绪。岗位、简历、投递与 Agent 能力将在后续阶段逐步接入。
        </p>
        <div className="mt-8 inline-flex items-center gap-3 rounded-full bg-slate-100 px-4 py-2 text-sm">
          <span className={`h-2.5 w-2.5 rounded-full ${health.isSuccess ? 'bg-emerald-500' : 'bg-amber-500'}`} />
          后端状态：{status}
        </div>
      </section>
    </main>
  )
}
