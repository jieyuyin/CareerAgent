export const emptyResume = () => ({ name: '我的职业档案', fullName: '', phone: '', email: '', location: '', targetRole: '', source: 'CREATE', status: 'CONFIRMED', basicInfo: {}, education: [], experiences: [], projects: [], skills: [], isDefault: true })

export const parsedToResume = (draft) => {
  const parsed = draft.parsedResume || {}
  const fullName = parsed.fullName?.trim() || '待确认'
  return {
    ...emptyResume(),
    ...parsed,
    fullName,
    targetRole: parsed.targetRole?.trim() || '待确认',
    education: parsed.education || [],
    experiences: parsed.experiences || [],
    projects: parsed.projects || [],
    skills: parsed.skills || [],
    source: 'UPLOAD',
    status: 'CONFIRMED',
    isDefault: true,
    fileUrl: draft.fileUrl,
    fileName: draft.fileName,
    fileType: draft.fileType,
    name: fullName === '待确认' ? '我的职业档案' : `${fullName}的职业档案`,
  }
}
