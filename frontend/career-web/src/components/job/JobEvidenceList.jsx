import { useState } from 'react'
export default function JobEvidenceList({ evidence = [] }) {
  const [open, setOpen] = useState(false)
  if (!evidence.length) return null
  return <div className="border-t border-black/10 pt-5"><button onClick={() => setOpen(!open)} className="flex w-full items-center justify-between text-left text-sm font-semibold"><span>匹配依据 <span className="ml-1 font-normal text-stone-400">{evidence.length}</span></span><span>{open ? '−' : '+'}</span></button>{open && <div className="mt-4 space-y-4">{evidence.map((item, index) => <div key={`${item.jobRequirement}-${index}`} className="border-l-2 border-[#c9dce3] pl-3 text-xs leading-5"><p><span className="text-stone-400">JD：</span>{item.jobRequirement}</p><p className="mt-1"><span className="text-stone-400">简历：</span>{item.resumeEvidence || '未找到直接证据'}</p><p className="mt-1"><span className="text-stone-400">判断：</span><b className={item.result === 'MATCHED' ? 'text-[#39714a]' : item.result === 'PARTIAL' ? 'text-amber-700' : 'text-stone-500'}>{item.result}</b></p></div>)}</div>}</div>
}
