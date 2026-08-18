import { http } from './http.js'

export const createResume = (payload) => http.post('/resumes', payload).then(({ data }) => data.data)
export const getResumes = () => http.get('/resumes').then(({ data }) => data.data)
export const getResume = (id) => http.get(`/resumes/${id}`).then(({ data }) => data.data)
export const getCurrentResume = () => http.get('/resumes/current').then(({ data }) => data.data)
export const updateResume = (id, payload) => http.put(`/resumes/${id}`, payload).then(({ data }) => data.data)
export const setDefaultResume = (id) => http.put(`/resumes/${id}/default`).then(({ data }) => data.data)
export const deleteResume = (id) => http.delete(`/resumes/${id}`).then(({ data }) => data)
export const uploadResume = (file) => {
  const form = new FormData()
  form.append('file', file)
  return http.post('/resumes/upload', form).then(({ data }) => data.data)
}
export const parseResumeText = (text) => http.post('/resumes/parse', { text }).then(({ data }) => data.data)
export const diagnoseResume = (id) => http.post(`/resumes/${id}/diagnosis`).then(({ data }) => data.data)

export const createResumeVersion = (payload) => http.post('/resume-versions', payload).then(({ data }) => data.data)
export const getResumeVersions = (params) => http.get('/resume-versions', { params }).then(({ data }) => data.data)
export const getResumeVersion = (id) => http.get(`/resume-versions/${id}`).then(({ data }) => data.data)
