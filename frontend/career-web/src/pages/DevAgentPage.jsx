import { useState } from 'react'
import { confirmAgentAction, getAgentMessages, getRewriteSuggestion, getToolExecutions, rejectAgentAction, reviewRewriteSuggestion, sendAgentMessage } from '../api/agent.js'

export default function DevAgentPage() {
  const [input, setInput] = useState('帮我看看岗位 1')
  const [conversationId, setConversationId] = useState(null)
  const [messages, setMessages] = useState([])
  const [executions, setExecutions] = useState([])
  const [pending, setPending] = useState(null)
  const [error, setError] = useState('')
  const [loading, setLoading] = useState(false)
  const [suggestionId, setSuggestionId] = useState('')
  const [suggestion, setSuggestion] = useState(null)

  async function refresh(id) {
    const [nextMessages, nextExecutions] = await Promise.all([getAgentMessages(id), getToolExecutions(id)])
    setMessages(nextMessages); setExecutions(nextExecutions)
  }

  async function submit(event) {
    event.preventDefault(); setLoading(true); setError('')
    try {
      const result = await sendAgentMessage(input, conversationId)
      setConversationId(result.conversationId); setPending(result.pendingAction || null)
      await refresh(result.conversationId); setInput('')
    } catch (err) { setError(err.message) } finally { setLoading(false) }
  }

  async function decide(decision) {
    setLoading(true); setError('')
    try {
      const result = decision === 'confirm' ? await confirmAgentAction(pending.id) : await rejectAgentAction(pending.id)
      setPending(null); await refresh(result.conversationId)
    } catch (err) { setError(err.message) } finally { setLoading(false) }
  }

  async function reviewSuggestion(action) {
    setLoading(true); setError('')
    try {
      const result = action === 'load' ? await getRewriteSuggestion(suggestionId) : await reviewRewriteSuggestion(suggestionId, action)
      setSuggestion(result); if (result.id) setSuggestionId(String(result.id))
    } catch (err) { setError(err.message) } finally { setLoading(false) }
  }

  return (
    <main className="mx-auto min-h-screen max-w-6xl px-6 py-10">
      <div className="mb-6 flex items-end justify-between">
        <div><p className="text-sm font-semibold text-indigo-600">CareerAgent / Dev</p><h1 className="text-3xl font-bold">Agent 调试台</h1></div>
        <span className="text-sm text-slate-500">会话 #{conversationId || '未创建'}</span>
      </div>
      <div className="grid gap-6 lg:grid-cols-[2fr_1fr]">
        <section className="rounded-2xl border bg-white p-5 shadow-sm">
          <div className="min-h-80 space-y-3">
            {messages.length === 0 && <p className="text-slate-400">发送消息以创建会话。</p>}
            {messages.map((item) => <div key={item.id} className={`rounded-xl p-3 ${item.role === 'USER' ? 'ml-12 bg-indigo-50' : 'mr-12 bg-slate-100'}`}><b className="text-xs text-slate-500">{item.role}</b><p className="mt-1 whitespace-pre-wrap break-words">{item.content}</p></div>)}
          </div>
          {pending && <div className="my-4 rounded-xl border border-amber-300 bg-amber-50 p-4"><p className="font-semibold">需要人工确认</p><p className="my-2 text-sm">{pending.summary}</p><div className="flex gap-2"><button disabled={loading} onClick={() => decide('confirm')} className="rounded-lg bg-indigo-600 px-4 py-2 text-white">确认执行</button><button disabled={loading} onClick={() => decide('reject')} className="rounded-lg border px-4 py-2">拒绝</button></div></div>}
          <form onSubmit={submit} className="mt-5 flex gap-3"><input required value={input} onChange={(e) => setInput(e.target.value)} className="flex-1 rounded-xl border px-4 py-3" placeholder="例如：帮我看看岗位 1"/><button disabled={loading} className="rounded-xl bg-slate-950 px-5 py-3 text-white">{loading ? '处理中' : '发送'}</button></form>
          {error && <p className="mt-3 text-sm text-red-600">{error}</p>}
        </section>
        <aside className="space-y-6"><section className="rounded-2xl border bg-white p-5 shadow-sm"><h2 className="font-semibold">Tool Executions</h2><div className="mt-4 space-y-3">{executions.map((item) => <div key={item.id} className="rounded-lg bg-slate-50 p-3 text-sm"><p className="font-mono">{item.toolName}</p><p className="mt-1 text-slate-500">#{item.id} · {item.status}</p></div>)}{executions.length === 0 && <p className="text-sm text-slate-400">暂无调用记录</p>}</div></section><section className="rounded-2xl border bg-white p-5 shadow-sm"><h2 className="font-semibold">Rewrite Review</h2><div className="mt-3 flex gap-2"><input value={suggestionId} onChange={(e) => setSuggestionId(e.target.value)} className="min-w-0 flex-1 rounded-lg border px-3 py-2" placeholder="Suggestion ID"/><button onClick={() => reviewSuggestion('load')} className="rounded-lg border px-3">加载</button></div>{suggestion && <div className="mt-3 text-sm"><p className="font-medium">{suggestion.status}</p><p className="mt-2 text-slate-600">{suggestion.suggestedContent}</p>{suggestion.status === 'PENDING' && <div className="mt-3 flex flex-wrap gap-2"><button onClick={() => reviewSuggestion('accept')} className="rounded bg-emerald-600 px-3 py-2 text-white">接受</button><button onClick={() => reviewSuggestion('reject')} className="rounded border px-3 py-2">拒绝</button><button onClick={() => reviewSuggestion('regenerate')} className="rounded border px-3 py-2">重新生成</button></div>}</div>}</section></aside>
      </div>
    </main>
  )
}
