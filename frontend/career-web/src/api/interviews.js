import { http } from './http.js'
export const createInterview = (payload)=>http.post('/interviews',payload).then(({data})=>data.data)
export const getInterviews = ()=>http.get('/interviews').then(({data})=>data.data)
export const getInterview = (id)=>http.get(`/interviews/${id}`).then(({data})=>data.data)
export const getInterviewMessages = (id)=>http.get(`/interviews/${id}/messages`).then(({data})=>data.data)
export const getInterviewEvaluations = (id)=>http.get(`/interviews/${id}/evaluations`).then(({data})=>data.data)
export const sendInterviewMessage = ({id,content,model,signal})=>http.post(`/interviews/${id}/message`,{content,model},{signal}).then(({data})=>data.data)
export const cancelInterviewMessage = (id)=>http.post(`/interviews/${id}/message/cancel`).then(({data})=>data.data)
export async function streamInterviewMessage({id,content,model,signal,onDelta}){const response=await fetch(`${http.defaults.baseURL}/interviews/${id}/message/stream`,{method:'POST',headers:{'Content-Type':'application/json',Accept:'text/event-stream'},body:JSON.stringify({content,model}),signal});if(!response.ok||!response.body)throw new Error(`流式请求失败：${response.status}`);const reader=response.body.getReader(),decoder=new TextDecoder();let buffer='';while(true){const {done,value}=await reader.read();if(done)break;buffer+=decoder.decode(value,{stream:true});const chunks=buffer.split('\n\n');buffer=chunks.pop()||'';for(const chunk of chunks){const event=chunk.split('\n').find(line=>line.startsWith('event:'))?.slice(6).trim();const raw=chunk.split('\n').filter(line=>line.startsWith('data:')).map(line=>line.slice(5).trim()).join('');if(!raw)continue;const data=JSON.parse(raw);if(event==='delta')onDelta?.(data.content);if(event==='error')throw new Error(data.message||'生成失败');}}}
export const finishInterview = (id)=>http.post(`/interviews/${id}/finish`).then(({data})=>data.data)
