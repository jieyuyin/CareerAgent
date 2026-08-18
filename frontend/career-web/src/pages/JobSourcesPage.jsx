import { useEffect, useState } from 'react'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import AppShell from '../components/layout/AppShell.jsx'
import SourceCard from '../components/source/SourceCard.jsx'
import { createJobSource, deleteJobSource, getJobSources, syncJobSource, updateJobSource } from '../api/jobSources.js'

const emptyForm = { company: '', sourceType: 'GREENHOUSE', apiUrl: '', careerUrl: '', enabled: true }
const examples = {
  GREENHOUSE: 'https://boards-api.greenhouse.io/v1/boards/{boardToken}/jobs?content=true',
  LEVER: 'https://api.lever.co/v0/postings/{site}?mode=json',
}

export default function JobSourcesPage() {
  const queryClient = useQueryClient()
  const sources = useQuery({ queryKey: ['job-sources'], queryFn: getJobSources, retry: false })
  const [editing, setEditing] = useState(null); const [form, setForm] = useState(emptyForm); const [notice, setNotice] = useState(null)
  useEffect(() => { if (!editing) setForm(emptyForm) }, [editing])
  const refresh = () => queryClient.invalidateQueries({ queryKey: ['job-sources'] })
  const save = useMutation({ mutationFn: (payload) => editing ? updateJobSource({ id: editing.id, payload }) : createJobSource(payload), onSuccess: () => { refresh(); setEditing(null); setForm(emptyForm); setNotice({ ok: true, text: '官网源已保存。' }) }, onError: fail(setNotice) })
  const sync = useMutation({ mutationFn: syncJobSource, onSuccess: (result) => { refresh(); queryClient.invalidateQueries({ queryKey: ['jobs'] }); setNotice({ ok: true, text: `同步完成：读取 ${result.fetched}，新增 ${result.created}，更新 ${result.updated}。岗位已进入雷达。` }) }, onError: (error) => { refresh(); fail(setNotice)(error) } })
  const remove = useMutation({ mutationFn: deleteJobSource, onSuccess: () => { refresh(); setNotice({ ok: true, text: '官网源已删除，已同步岗位会保留。' }) }, onError: fail(setNotice) })
  const edit = (source) => { setEditing(source); setForm({ company: source.company, sourceType: source.sourceType, apiUrl: source.apiUrl, careerUrl: source.careerUrl || '', enabled: source.enabled }); window.scrollTo({ top: 0, behavior: 'smooth' }) }
  const submit = (event) => { event.preventDefault(); setNotice(null); save.mutate(form) }
  const confirmDelete = (source) => { if (window.confirm(`删除 ${source.company} 的官网源？已同步岗位不会被删除。`)) remove.mutate(source.id) }
  return <AppShell><div className="mx-auto max-w-6xl px-12 py-12">
    <div className="flex items-end justify-between"><div><p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">Official sources</p><h1 className="mt-4 font-serif text-4xl tracking-tight">官网源管理</h1><p className="mt-3 max-w-2xl text-sm leading-7 text-stone-500">连接公司的公开招聘 API。同步后的岗位会标准化、去重，并自动出现在岗位雷达。</p></div><div className="text-right"><p className="text-3xl font-semibold">{sources.data?.length || 0}</p><p className="mt-1 text-xs text-stone-400">已配置官网源</p></div></div>
    <form onSubmit={submit} className="mt-10 rounded-2xl border border-black/10 bg-white/45 p-6"><div className="flex items-center justify-between"><div><h2 className="text-lg font-semibold">{editing ? `编辑 · ${editing.company}` : '添加官网源'}</h2><p className="mt-1 text-xs text-stone-400">首版支持无需登录的 Greenhouse 和 Lever 公开岗位接口。</p></div>{editing && <button type="button" onClick={() => setEditing(null)} className="text-xs text-stone-500 underline">取消编辑</button>}</div>
      <div className="mt-6 grid grid-cols-2 gap-5"><Field label="公司"><input required maxLength="200" className="input" value={form.company} onChange={change(setForm, form, 'company')} placeholder="例如 OpenAI"/></Field><Field label="来源类型"><select className="input" value={form.sourceType} onChange={(event) => setForm({ ...form, sourceType: event.target.value, apiUrl: '' })}><option value="GREENHOUSE">Greenhouse</option><option value="LEVER">Lever</option></select></Field><Field label="公开 API URL" help="仅允许对应平台的 HTTPS 域名"><input required className="input" value={form.apiUrl} onChange={change(setForm, form, 'apiUrl')} placeholder={examples[form.sourceType]}/></Field><Field label="招聘官网 URL" help="可选，用于用户访问官网"><input type="url" className="input" value={form.careerUrl} onChange={change(setForm, form, 'careerUrl')} placeholder="https://company.com/careers"/></Field></div>
      <div className="mt-6 flex items-center justify-between border-t border-black/10 pt-5"><label className="flex items-center gap-2 text-sm"><input type="checkbox" checked={form.enabled} onChange={(event) => setForm({ ...form, enabled: event.target.checked })}/>启用该官网源</label><button disabled={save.isPending} className="rounded-xl bg-[#191917] px-6 py-3 text-sm font-semibold text-white disabled:opacity-40">{save.isPending ? '保存中…' : editing ? '保存修改' : '添加官网源'}</button></div>
    </form>
    {notice && <div className={`mt-5 rounded-xl px-4 py-3 text-sm ${notice.ok ? 'bg-[#dcecdf] text-[#315d3b]' : 'bg-red-50 text-red-700'}`}>{notice.text}</div>}
    <section className="mt-10"><div className="flex items-center justify-between border-b border-black/10 pb-4"><h2 className="text-lg font-semibold">已连接的官网</h2><button onClick={() => sources.refetch()} className="text-xs text-stone-500 underline">刷新状态</button></div>{sources.isLoading && <div className="h-48 animate-pulse bg-black/[.03]"/>}{sources.isError && <p className="py-12 text-sm text-red-700">官网源加载失败，请确认后端和数据库已启动。</p>}{sources.data?.map((source) => <SourceCard key={source.id} source={source} syncing={sync.isPending && sync.variables === source.id} onSync={(id) => { setNotice(null); sync.mutate(id) }} onEdit={edit} onDelete={confirmDelete}/>)}{sources.data?.length === 0 && <div className="py-16 text-center"><p className="font-serif text-2xl">还没有连接招聘官网</p><p className="mt-3 text-sm text-stone-400">在上方添加 Greenhouse 或 Lever 公开接口，开始发现岗位。</p></div>}</section>
  </div></AppShell>
}

function Field({ label, help, children }) { return <label><span className="text-sm font-semibold">{label}</span>{help && <span className="ml-2 text-xs text-stone-400">{help}</span>}<div className="mt-2">{children}</div></label> }
function change(setForm, form, key) { return (event) => setForm({ ...form, [key]: event.target.value }) }
function fail(setNotice) { return (error) => setNotice({ ok: false, text: error.message || '操作失败，请稍后重试。' }) }
