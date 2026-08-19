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
export const getResumeProfile = () => http.get('/resumes/profile').then(({ data }) => data.data)
export const updateResumeProfile = (payload) => http.put('/resumes/profile', payload).then(({ data }) => data.data)
export const polishResume = (payload) => http.post('/resumes/polish', payload).then(({ data }) => data.data)
export const generateResume = (payload) => http.post('/resumes/generate', payload).then(({ data }) => data.data)
export const getProfileVersions = () => http.get('/resumes/versions').then(({ data }) => data.data)
export const exportResumePdf = async (id, master = false) => {
  const path = master ? '/resumes/profile/export/pdf' : `/resumes/${id}/export/pdf`
  const { data } = await http.get(path, { responseType: 'blob' })
  const url = URL.createObjectURL(data), link = document.createElement('a')
  link.href = url; link.download = master ? 'Master-Resume.pdf' : `Resume-Version-${id}.pdf`; link.click()
  URL.revokeObjectURL(url)
}

export const createResumeVersion = (payload) => http.post('/resume-versions', payload).then(({ data }) => data.data)
export const getResumeVersions = (params) => http.get('/resume-versions', { params }).then(({ data }) => data.data)
export const getResumeVersion = (id) => http.get(`/resume-versions/${id}`).then(({ data }) => data.data)
