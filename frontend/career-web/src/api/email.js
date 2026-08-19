import { http } from './http.js'
export const getEmailAccount = () => http.get('/email/account').then(({data})=>data.data)
export const testEmailAccount = (payload) => http.post('/email/test',payload).then(({data})=>data)
export const bindEmailAccount = (payload) => http.post('/email/account',payload).then(({data})=>data.data)
export const syncRecruitmentEmails = () => http.post('/email/sync').then(({data})=>data.data)
export const getRecruitmentEmails = () => http.get('/email/recruitment-emails').then(({data})=>data.data)
export const reanalyzeRecruitmentEmail = (id) => http.post(`/email/recruitment-emails/${id}/reanalyze`).then(({data})=>data.data)
export const linkRecruitmentEmail = (id,applicationId) => http.put(`/email/recruitment-emails/${id}/application/${applicationId}`).then(({data})=>data.data)
