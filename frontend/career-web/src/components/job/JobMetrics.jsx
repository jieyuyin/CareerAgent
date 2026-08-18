export default function JobMetrics({ jobs, matches, preferences }) {
  const values = [jobs.length, matches.filter((m) => m?.matchScore >= 80).length, preferences.size, matches.filter((m) => !m).length]
  return <div className="mt-10 grid grid-cols-4 border-y border-black/10">{['今日新发现', '优先处理', '值得投', '待确认'].map((label, index) => <div key={label} className={`py-5 ${index ? 'border-l border-black/10 pl-7' : ''}`}><p className="text-xs text-stone-400">{label}</p><p className="mt-1 font-serif text-3xl">{values[index]}</p></div>)}</div>
}
