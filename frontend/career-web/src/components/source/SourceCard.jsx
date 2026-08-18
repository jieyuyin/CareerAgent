const typeLabels = { GREENHOUSE: 'Greenhouse', LEVER: 'Lever' }
const statusStyles = {
  NEVER: 'bg-stone-200 text-stone-600', RUNNING: 'bg-[#dfe9ef] text-[#315669]',
  SUCCESS: 'bg-[#dcecdf] text-[#315d3b]', FAILED: 'bg-red-100 text-red-700',
}
const statusLabels = { NEVER: '尚未同步', RUNNING: '同步中', SUCCESS: '同步成功', FAILED: '同步失败' }

export default function SourceCard({ source, syncing, onSync, onEdit, onDelete }) {
  return <article className="border-t border-black/10 py-7 first:border-t-0">
    <div className="flex items-start justify-between gap-8">
      <div className="min-w-0"><div className="flex items-center gap-2"><h3 className="text-xl font-semibold tracking-tight">{source.company}</h3><span className={`rounded-full px-2.5 py-1 text-[11px] font-semibold ${statusStyles[source.lastSyncStatus]}`}>{syncing ? '同步中' : statusLabels[source.lastSyncStatus]}</span>{!source.enabled && <span className="rounded-full bg-stone-200 px-2 py-1 text-[11px] text-stone-500">已停用</span>}</div><p className="mt-2 text-sm text-stone-500">{typeLabels[source.sourceType]} · 最近发现 {source.lastDiscoveredCount || 0} 个岗位</p><p className="mt-2 truncate text-xs text-stone-400">{source.apiUrl}</p></div>
      <div className="flex shrink-0 gap-2"><button onClick={() => onSync(source.id)} disabled={syncing || !source.enabled} className="rounded-xl bg-[#191917] px-4 py-2.5 text-xs font-semibold text-white disabled:opacity-35">{syncing ? '正在同步…' : '立即同步'}</button><button onClick={() => onEdit(source)} className="rounded-xl border border-black/10 px-3 py-2.5 text-xs">编辑</button><button onClick={() => onDelete(source)} className="rounded-xl border border-black/10 px-3 py-2.5 text-xs text-stone-500">删除</button></div>
    </div>
    <div className="mt-5 grid grid-cols-3 gap-5 text-xs"><Meta label="最近同步" value={formatTime(source.lastSyncAt)}/><Meta label="最近成功" value={formatTime(source.lastSuccessAt)}/><Meta label="官网入口" value={source.careerUrl ? '已配置' : '未配置'}/></div>
    {source.lastError && <p className="mt-4 rounded-xl bg-red-50 px-4 py-3 text-xs leading-5 text-red-700">{source.lastError}</p>}
  </article>
}

function Meta({ label, value }) { return <p><span className="block text-stone-400">{label}</span><b className="mt-1 block font-medium text-stone-700">{value}</b></p> }
function formatTime(value) { return value ? new Date(value).toLocaleString('zh-CN', { hour12: false }) : '—' }
