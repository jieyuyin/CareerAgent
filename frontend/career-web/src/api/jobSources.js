import { http } from './http.js'

export const getJobSources = () => http.get('/job-sources').then(({ data }) => data.data)
export const createJobSource = (payload) => http.post('/job-sources', payload).then(({ data }) => data.data)
export const updateJobSource = ({ id, payload }) => http.put(`/job-sources/${id}`, payload).then(({ data }) => data.data)
export const deleteJobSource = (id) => http.delete(`/job-sources/${id}`).then(({ data }) => data.data)
export const syncJobSource = (id) => http.post(`/job-sources/${id}/sync`).then(({ data }) => data.data)
export const searchByteDanceJobs = (payload) => http.post('/job-sources/bytedance/search', payload).then(({ data }) => data.data)
export const searchByteDanceCampusJobs = (payload) => http.post('/job-sources/bytedance/campus/search', payload).then(({ data }) => data.data)
