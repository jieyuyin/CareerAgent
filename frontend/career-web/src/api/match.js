import { http } from './http.js'
export const getLatestJobMatch = (jobDescriptionId, resumeId) => http.get('/job-matches/latest', { params: { jobDescriptionId, resumeId } }).then(({ data }) => data.data)
export const matchResumeToJob = (jobDescriptionId, resumeId) => http.post('/job-matches', null, { params: { jobDescriptionId, resumeId } }).then(({ data }) => data.data)
