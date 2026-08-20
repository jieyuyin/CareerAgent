import { http } from './http.js'

export const getAiConfig = () => http.get('/system/ai-config').then(({ data }) => data.data)
export const getAiModels = () => http.get('/system/ai-config/models').then(({ data }) => data.data)
export const saveAiConfig = (payload) => http.put('/system/ai-config', payload).then(({ data }) => data.data)
export const testAiConfig = (payload) => http.post('/system/ai-config/test', payload).then(({ data }) => data.data)
