import { http } from './http.js'

export async function getHealth() {
  const { data } = await http.get('/health')
  return data
}
