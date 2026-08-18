import { http } from './http.js'

export const createJob = (payload) => http.post('/jobs', payload).then(({ data }) => data.data)
export const getJobs = (params) => http.get('/jobs', { params }).then(({ data }) => data.data)
export const getJob = (id) => http.get(`/jobs/${id}`).then(({ data }) => data.data)
export const updateJob = (id, payload) => http.put(`/jobs/${id}`, payload).then(({ data }) => data.data)
export const deleteJob = (id) => http.delete(`/jobs/${id}`).then(({ data }) => data)
