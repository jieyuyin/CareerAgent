import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { analyzeJob } from '../api/jobAnalysis.js'
import { getJob, getJobs } from '../api/jobs.js'
import { getLatestJobMatch, matchResumeToJob } from '../api/match.js'
import { getResumes } from '../api/resumes.js'

export const useJobs = (filters) => useQuery({ queryKey: ['jobs', filters], queryFn: () => getJobs({ ...filters, page: 1, size: 100 }) })
export const useJobDetail = (jobId) => useQuery({ queryKey: ['job', jobId], queryFn: () => getJob(jobId), enabled: Boolean(jobId) })
export const useDefaultResume = () => useQuery({ queryKey: ['resumes'], queryFn: getResumes, select: (items) => items.find((item) => item.isDefault) || null })
export const useLatestJobMatch = (jobId, resumeId) => useQuery({ queryKey: ['job-match', jobId, resumeId], queryFn: () => getLatestJobMatch(jobId, resumeId), enabled: Boolean(jobId && resumeId) })

export function useAnalyzeJob() {
  const client = useQueryClient()
  return useMutation({ mutationFn: analyzeJob, onSuccess: (_, jobId) => { client.invalidateQueries({ queryKey: ['job', jobId] }); client.invalidateQueries({ queryKey: ['jobs'] }) } })
}

export function useMatchResumeToJob() {
  const client = useQueryClient()
  return useMutation({ mutationFn: ({ jobId, resumeId }) => matchResumeToJob(jobId, resumeId), onSuccess: (_, variables) => client.invalidateQueries({ queryKey: ['job-match', variables.jobId, variables.resumeId] }) })
}
