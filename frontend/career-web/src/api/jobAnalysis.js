import { http } from './http.js'
export const analyzeJob = (jobId) => http.post(`/jobs/${jobId}/analyze`).then(({ data }) => data.data)
