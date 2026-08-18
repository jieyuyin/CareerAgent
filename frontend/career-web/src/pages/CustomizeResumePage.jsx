import { useSearchParams } from 'react-router-dom'
import AppShell from '../components/layout/AppShell.jsx'
import { useDefaultResume, useJobDetail, useLatestJobMatch } from '../hooks/useJobRadar.js'
export default function CustomizeResumePage() {
 const [params]=useSearchParams();const jobId=Number(params.get('jobId'));const job=useJobDetail(jobId);const resume=useDefaultResume();const match=useLatestJobMatch(jobId,resume.data?.id)
 return <AppShell><div className="mx-auto max-w-4xl px-12 py-16"><p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">下一阶段预览</p><h1 className="mt-4 font-serif text-4xl">岗位专属简历编辑器将在下一阶段实现</h1><p className="mt-4 max-w-2xl leading-7 text-stone-500">这里已经带入当前岗位、默认基础简历和最新匹配报告，为后续生成 ResumeVersion 做准备。</p><div className="mt-12 grid grid-cols-3 border-y border-black/10 py-7"><div><p className="text-xs text-stone-400">当前岗位</p><p className="mt-2 font-semibold">{job.data ? `${job.data.company} · ${job.data.jobName}` : '加载中…'}</p></div><div className="border-l border-black/10 pl-6"><p className="text-xs text-stone-400">基础简历</p><p className="mt-2 font-semibold">{resume.data?.name || '暂无默认简历'}</p></div><div className="border-l border-black/10 pl-6"><p className="text-xs text-stone-400">最新匹配参考</p><p className="mt-2 font-serif text-2xl">{match.data ? `${match.data.matchScore}%` : '等待匹配'}</p></div></div></div></AppShell>
}
