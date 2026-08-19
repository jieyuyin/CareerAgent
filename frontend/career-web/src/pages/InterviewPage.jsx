import { Component, useEffect, useState } from 'react'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { useSearchParams } from 'react-router-dom'
import AppShell from '../components/layout/AppShell.jsx'
import InterviewChat from '../components/interview/InterviewChat.jsx'
import InterviewConfigPanel from '../components/interview/InterviewConfigPanel.jsx'
import InterviewHistory from '../components/interview/InterviewHistory.jsx'
import InterviewInfoPanel from '../components/interview/InterviewInfoPanel.jsx'
import { getApplications } from '../api/applications.js'
import { getAiConfig } from '../api/system.js'
import { createInterview, finishInterview, getInterview, getInterviewMessages, getInterviews, sendInterviewMessage } from '../api/interviews.js'

export default function InterviewPage() { return <InterviewErrorBoundary><InterviewPageContent/></InterviewErrorBoundary> }

function InterviewPageContent() {
  const [searchParams] = useSearchParams()
  const client = useQueryClient(); const [selectedId, setSelectedId] = useState(null); const [panel, setPanel] = useState('config'); const [pendingUser, setPendingUser] = useState(null); const [selectedModel, setSelectedModel] = useState('')
  const applications = useQuery({ queryKey: ['applications', 'interview-options'], queryFn: () => getApplications({ page: 1, size: 100 }), retry: false })
  const aiConfig = useQuery({ queryKey: ['ai-config'], queryFn: getAiConfig, retry: false })
  const history = useQuery({ queryKey: ['interviews'], queryFn: getInterviews, retry: false })
  const session = useQuery({ queryKey: ['interview', selectedId], queryFn: () => getInterview(selectedId), enabled: !!selectedId, retry: false })
  const messages = useQuery({ queryKey: ['interview-messages', selectedId], queryFn: () => getInterviewMessages(selectedId), enabled: !!selectedId, retry: false })
  const configuredModel = aiConfig.data?.model || 'mock-career-agent'
  const modelOptions = [...new Set(aiConfig.data?.provider === 'mock' ? [configuredModel] : [configuredModel, 'gpt-4.1-mini', 'gpt-4.1', 'gpt-4o-mini'])]
  useEffect(() => { if (session.data) setSelectedModel(session.data.model || configuredModel); else if (!selectedModel) setSelectedModel(configuredModel) }, [session.data, configuredModel, selectedModel])
  const create = useMutation({ mutationFn: createInterview, onSuccess: data => { setSelectedId(data.sessionId); setPanel('current'); client.setQueryData(['interview', data.sessionId], data.session); client.setQueryData(['interview-messages', data.sessionId], [data.firstMessage]); client.invalidateQueries({ queryKey: ['interviews'] }) } })
  const send = useMutation({ mutationFn: sendInterviewMessage, onSuccess: () => { setPendingUser(null); client.invalidateQueries({ queryKey: ['interview-messages', selectedId] }); client.setQueryData(['interview', selectedId], old => old ? { ...old, model: selectedModel } : old) }, onError: () => setPendingUser(null) })
  const finish = useMutation({ mutationFn: () => finishInterview(selectedId), onSuccess: report => { client.setQueryData(['interview', selectedId], old => ({ ...old, status: 'FINISHED', score: report.score, report })); client.invalidateQueries({ queryKey: ['interviews'] }) } })
  const startNew = () => { setSelectedId(null); setPanel('config'); setPendingUser(null); setSelectedModel(configuredModel) }
  const onSend = content => { setPendingUser(content); send.mutate({ id: selectedId, content, model: selectedModel || configuredModel }) }
  const current = session.data
  return <AppShell><div className="grid min-h-screen grid-cols-[minmax(0,1fr)_360px]"><InterviewChat session={current} messages={Array.isArray(messages.data) ? messages.data : []} loading={messages.isLoading} sending={send.isPending} pendingUser={pendingUser} onSend={onSend} model={selectedModel || configuredModel} modelOptions={modelOptions} onModelChange={setSelectedModel}/><aside className="h-screen overflow-y-auto border-l border-black/10 bg-[#f0ede6] p-7">{panel === 'history' ? <InterviewHistory items={Array.isArray(history.data) ? history.data : []} loading={history.isLoading} onSelect={id => { setSelectedId(id); setPanel('current') }} onBack={() => setPanel(selectedId ? 'current' : 'config')}/> : current ? <InterviewInfoPanel session={{ ...current, model: selectedModel || current.model || configuredModel }} finishing={finish.isPending} onFinish={() => finish.mutate()} onHistory={() => setPanel('history')} onNew={startNew}/> : <InterviewConfigPanel defaultApplicationId={searchParams.get('applicationId') || ''} applications={applications.data?.items || []} pending={create.isPending} error={create.error} onStart={payload => create.mutate({ ...payload, model: selectedModel || configuredModel })} onHistory={() => setPanel('history')}/>} {session.isError && <p className="mt-5 text-sm text-red-700">会话加载失败：{session.error.message}</p>}{send.error && <p className="mt-5 text-sm text-red-700">回复发送失败：{send.error.message}</p>}{finish.error && <p className="mt-5 text-sm text-red-700">总结生成失败：{finish.error.message}</p>}</aside></div></AppShell>
}

class InterviewErrorBoundary extends Component {
  constructor(props) { super(props); this.state = { error: null } }
  static getDerivedStateFromError(error) { return { error } }
  render() { if (this.state.error) return <AppShell><div className="mx-auto max-w-2xl px-12 py-20"><p className="text-xs font-bold uppercase tracking-[.18em] text-red-500">Interview page error</p><h1 className="mt-4 font-serif text-3xl">模拟面试页面加载失败</h1><p className="mt-4 rounded-xl bg-red-50 p-4 text-sm text-red-700">{this.state.error.message}</p><button onClick={() => this.setState({ error: null })} className="mt-6 rounded-xl bg-black px-5 py-3 text-sm font-semibold text-white">返回模拟面试首页</button></div></AppShell>; return this.props.children }
}
