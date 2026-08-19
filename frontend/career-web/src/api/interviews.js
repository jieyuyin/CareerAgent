import { http } from './http.js'
export const createInterview = (payload)=>http.post('/interviews',payload).then(({data})=>data.data)
export const getInterviews = ()=>http.get('/interviews').then(({data})=>data.data)
export const getInterview = (id)=>http.get(`/interviews/${id}`).then(({data})=>data.data)
export const getInterviewMessages = (id)=>http.get(`/interviews/${id}/messages`).then(({data})=>data.data)
export const sendInterviewMessage = ({id,content,model})=>http.post(`/interviews/${id}/message`,{content,model}).then(({data})=>data.data)
export const finishInterview = (id)=>http.post(`/interviews/${id}/finish`).then(({data})=>data.data)
