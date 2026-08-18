import { useEffect, useState } from 'react'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import AppShell from '../components/layout/AppShell.jsx'
import { getAiConfig, saveAiConfig, testAiConfig } from '../api/system.js'

const defaults = { provider: 'mock', model: 'mock-career-agent', baseUrl: '', apiKey: '' }
export default function ModelConfigPage() {
  const client = useQueryClient(); const config = useQuery({ queryKey: ['ai-config'], queryFn: getAiConfig, retry: false })
  const [form, setForm] = useState(defaults); const [showKey, setShowKey] = useState(false); const [notice, setNotice] = useState(null)
  useEffect(() => { if (config.data) setForm({ provider: config.data.provider, model: config.data.model, baseUrl: config.data.baseUrl || '', apiKey: '' }) }, [config.data])
  const save = useMutation({ mutationFn: saveAiConfig, onSuccess: (data) => { client.setQueryData(['ai-config'], data); setForm((value) => ({ ...value, apiKey: '' })); setNotice({ ok: true, text: '配置已保存并动态生效，无需重启后端。' }) }, onError: (error) => setNotice({ ok: false, text: error.message }) })
  const test = useMutation({ mutationFn: testAiConfig, onSuccess: (data) => setNotice({ ok: true, text: `${data.message} · ${data.latencyMs}ms` }), onError: (error) => setNotice({ ok: false, text: error.message }) })
  const update = (key) => (event) => setForm({ ...form, [key]: event.target.value })
  const submit = (event) => { event.preventDefault(); setNotice(null); save.mutate(form) }
  return <AppShell><div className="mx-auto max-w-5xl px-12 py-14">
    <p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">System · AI runtime</p>
    <div className="mt-4 flex items-end justify-between gap-8"><div><h1 className="font-serif text-4xl tracking-tight">模型配置</h1><p className="mt-3 max-w-2xl text-sm leading-7 text-stone-500">在这里配置 CareerAgent 使用的模型。API Key 加密保存在后端，浏览器不会保存或读取密钥明文。</p></div>{config.data && <span className={`rounded-full px-3 py-1.5 text-xs font-semibold ${form.provider === 'mock' ? 'bg-[#eeeae2] text-stone-600' : 'bg-[#dcecdf] text-[#315d3b]'}`}>{form.provider === 'mock' ? 'Mock 模式' : 'OpenAI-compatible'}</span>}</div>
    {config.isLoading && <div className="mt-12 h-80 animate-pulse rounded-2xl bg-black/5"/>}
    {config.isError && <div className="mt-12 border-y border-red-900/20 py-8"><p className="text-sm text-red-700">无法读取模型配置，请确认后端已经启动。</p><button onClick={() => config.refetch()} className="mt-3 text-sm underline">重新尝试</button></div>}
    {config.data && <form onSubmit={submit} className="mt-12"><div className="grid grid-cols-2 gap-x-6 gap-y-6">
      <Field label="Provider"><select value={form.provider} onChange={update('provider')} className="input"><option value="mock">MockLLM（本地演示）</option><option value="openai-compatible">OpenAI-compatible</option></select></Field>
      <Field label="模型名称"><input required value={form.model} onChange={update('model')} className="input" placeholder="例如 gpt-4.1-mini"/></Field>
      <Field label="Base URL" help="填写到 /v1；系统会追加 /chat/completions"><input required={form.provider !== 'mock'} value={form.baseUrl} onChange={update('baseUrl')} disabled={form.provider === 'mock'} className="input disabled:opacity-40" placeholder="https://api.openai.com/v1"/></Field>
      <Field label="API Key" help={config.data.apiKeyConfigured ? `已保存：${config.data.apiKeyMasked}` : '尚未保存密钥'}><div className="relative"><input type={showKey ? 'text' : 'password'} value={form.apiKey} onChange={update('apiKey')} disabled={form.provider === 'mock'} className="input pr-16 disabled:opacity-40" placeholder={config.data.apiKeyConfigured ? '留空则保留现有 Key' : '输入 API Key'}/><button type="button" onClick={() => setShowKey(!showKey)} className="absolute right-3 top-1/2 -translate-y-1/2 text-xs text-stone-400">{showKey ? '隐藏' : '显示'}</button></div></Field>
    </div>
    <div className="mt-8 flex items-center gap-3 border-t border-black/10 pt-6"><button type="submit" disabled={save.isPending} className="rounded-xl bg-[#191917] px-6 py-3 text-sm font-semibold text-white disabled:opacity-50">{save.isPending ? '保存中…' : '保存并应用'}</button><button type="button" onClick={() => { setNotice(null); test.mutate(form) }} disabled={test.isPending} className="rounded-xl border border-black/15 px-6 py-3 text-sm font-semibold disabled:opacity-50">{test.isPending ? '正在测试…' : '测试连接'}</button><span className="ml-auto text-xs text-stone-400">配置修改后立即用于下一次 AI 调用</span></div>
    {notice && <div className={`mt-5 rounded-xl px-4 py-3 text-sm ${notice.ok ? 'bg-[#dcecdf] text-[#315d3b]' : 'bg-red-50 text-red-700'}`}>{notice.text}</div>}
    <div className="mt-10 rounded-xl border border-[#d8d1c3] bg-[#fffcf5] p-4 text-xs leading-6 text-stone-600"><b>密钥安全：</b>API Key 使用 AES-GCM 加密后存入 PostgreSQL，查询接口只返回掩码。生产环境请通过 <code className="rounded bg-black/5 px-1">CAREER_CONFIG_ENCRYPTION_KEY</code> 设置独立且稳定的主密钥。</div>
    </form>}
  </div></AppShell>
}
function Field({ label, help, children }) { return <label className="block"><span className="text-sm font-semibold">{label}</span>{help && <span className="ml-2 text-xs text-stone-400">{help}</span>}<div className="mt-2">{children}</div></label> }
