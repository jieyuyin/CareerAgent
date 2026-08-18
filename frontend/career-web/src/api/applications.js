import { http } from './http.js'

export const createApplication = (payload) => http.post('/applications', payload).then(({ data }) => data.data)
export const getApplications = (params) => http.get('/applications', { params }).then(({ data }) => data.data)
export const getApplication = (id) => http.get(`/applications/${id}`).then(({ data }) => data.data)
export const updateApplication = (id, payload) => http.put(`/applications/${id}`, payload).then(({ data }) => data.data)
export const updateApplicationStatus = (id, payload) => http.put(`/applications/${id}/status`, payload).then(({ data }) => data.data)
export const getApplicationEvents = (id) => http.get(`/applications/${id}/events`).then(({ data }) => data.data)
