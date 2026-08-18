import { http } from './http.js'

export async function sendAgentMessage(message, conversationId) {
  const { data } = await http.post('/agent/chat', { message, conversationId })
  return data.data
}

export async function confirmAgentAction(actionId) {
  const { data } = await http.post(`/agent/actions/${actionId}/confirm`)
  return data.data
}

export async function rejectAgentAction(actionId) {
  const { data } = await http.post(`/agent/actions/${actionId}/reject`)
  return data.data
}

export async function getAgentMessages(conversationId) {
  const { data } = await http.get(`/agent/conversations/${conversationId}/messages`)
  return data.data
}

export async function getToolExecutions(conversationId) {
  const { data } = await http.get(`/agent/conversations/${conversationId}/tool-executions`)
  return data.data
}

export async function getRewriteSuggestion(id) {
  const { data } = await http.get(`/rewrite-suggestions/${id}`)
  return data.data
}

export async function reviewRewriteSuggestion(id, action) {
  const { data } = await http.post(`/rewrite-suggestions/${id}/${action}`)
  return data.data
}

export async function streamAgentMessage({ message, conversationId, onEvent }) {
  const response = await fetch(`${http.defaults.baseURL}/agent/chat/stream`, {
    method: 'POST', headers: { 'Content-Type': 'application/json', Accept: 'text/event-stream' },
    body: JSON.stringify({ message, conversationId }),
  })
  if (!response.ok || !response.body) throw new Error(`SSE 请求失败：${response.status}`)
  const reader = response.body.getReader()
  const decoder = new TextDecoder()
  let buffer = ''
  while (true) {
    const { done, value } = await reader.read()
    if (done) break
    buffer += decoder.decode(value, { stream: true })
    const chunks = buffer.split('\n\n'); buffer = chunks.pop() || ''
    chunks.forEach((chunk) => {
      const event = chunk.split('\n').find((line) => line.startsWith('event:'))?.slice(6).trim()
      const raw = chunk.split('\n').filter((line) => line.startsWith('data:')).map((line) => line.slice(5).trim()).join('')
      if (raw) onEvent?.(event, JSON.parse(raw))
    })
  }
}
