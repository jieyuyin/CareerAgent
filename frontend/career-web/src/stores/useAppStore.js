import { create } from 'zustand'

export const useAppStore = create((set) => ({
  sidebarOpen: false,
  favoredJobs: new Set(),
  dismissedJobs: new Set(),
  toggleSidebar: () => set((state) => ({ sidebarOpen: !state.sidebarOpen })),
  toggleFavored: (id) => set((state) => { const next = new Set(state.favoredJobs); next.has(id) ? next.delete(id) : next.add(id); return { favoredJobs: next } }),
  dismissJob: (id) => set((state) => { const next = new Set(state.dismissedJobs); next.add(id); return { dismissedJobs: next } }),
}))
