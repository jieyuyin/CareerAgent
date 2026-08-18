import { useState } from 'react'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import { useNavigate } from 'react-router-dom'
import AppShell from '../components/layout/AppShell.jsx'
import ResumeEmptyState from '../components/resume/ResumeEmptyState.jsx'
import ResumeUploader from '../components/resume/ResumeUploader.jsx'
import ResumeCreateWizard from '../components/resume/ResumeCreateWizard.jsx'
import ResumePreview from '../components/resume/ResumePreview.jsx'
import ResumeDiagnosisPanel from '../components/resume/ResumeDiagnosisPanel.jsx'
import { emptyResume, parsedToResume } from '../components/resume/resumeModel.js'
import { createResume, diagnoseResume, getCurrentResume, uploadResume } from '../api/resumes.js'

export default function ResumePage() {
  const queryClient=useQueryClient(), navigate=useNavigate(); const [mode,setMode]=useState(null); const [draft,setDraft]=useState(null); const [diagnosis,setDiagnosis]=useState(null)
  const current=useQuery({queryKey:['resume','current'],queryFn:getCurrentResume,retry:false})
  const upload=useMutation({mutationFn:uploadResume,onSuccess:(data)=>{setDraft(parsedToResume(data));setMode('confirm')}})
  const create=useMutation({mutationFn:createResume,onSuccess:(data)=>{queryClient.setQueryData(['resume','current'],data);setMode(null);setDraft(null);navigate(`/resume/edit/${data.id}`)}})
  const diagnose=useMutation({mutationFn:diagnoseResume,onSuccess:setDiagnosis})
  const resume=current.data
  return <AppShell><div className="mx-auto max-w-[1280px] px-10 py-12"><div className="flex items-end justify-between"><div><p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">Master Resume</p><h1 className="mt-3 font-serif text-4xl">我的简历</h1><p className="mt-3 text-sm leading-7 text-stone-500">维护一份可信的职业档案，再为每个岗位生成独立版本。</p></div><div className="flex gap-3"><button onClick={()=>{setDraft(null);setMode('upload');upload.reset()}} className="rounded-xl border border-black/15 bg-white/50 px-5 py-3 text-sm font-semibold">上传简历</button>{resume&&<button onClick={()=>navigate(`/resume/edit/${resume.id}`)} className="rounded-xl bg-black px-5 py-3 text-sm font-semibold text-white">编辑基础简历</button>}</div></div>
    {current.isLoading&&<div className="mt-12 h-96 animate-pulse rounded-2xl bg-black/5"/>}
    {current.isError&&<div className="mt-12 border-y border-red-900/20 py-8 text-sm text-red-700">基础简历加载失败。<button onClick={()=>current.refetch()} className="ml-2 underline">重新尝试</button></div>}
    {!current.isLoading&&!current.isError&&!resume&&!mode&&<ResumeEmptyState onUpload={()=>setMode('upload')} onCreate={()=>{setDraft(emptyResume());setMode('create')}}/>}
    {mode==='upload'&&<div className="mt-12"><button onClick={()=>setMode(null)} className="mb-5 text-sm text-stone-500">← 返回当前简历</button><ResumeUploader onFile={(file)=>upload.mutate(file)} pending={upload.isPending} error={upload.error}/></div>}
    {(mode==='confirm'||mode==='create')&&draft&&<div className="mt-12"><button onClick={()=>{setMode(null);setDraft(null)}} className="mb-5 text-sm text-stone-500">← 取消并返回</button><div className="grid grid-cols-[minmax(0,1fr)_330px] gap-8"><main className="rounded-2xl bg-[#fffdf8] p-8"><div className="mb-7 rounded-xl bg-[#e7efe8] p-4 text-sm text-[#315d3b]">{mode==='confirm'?'AI 已生成结构化草稿，请逐项确认。点击保存前不会写入数据库；保存后会成为新的默认基础简历。':'按步骤完善职业数据，保存后成为基础简历。'}</div><ResumeCreateWizard initial={draft} onSave={(value)=>create.mutate(value)} saving={create.isPending} title={mode==='confirm'?'确认解析结果':'从零创建基础简历'}/>{create.error&&<p className="mt-4 text-sm text-red-700">保存失败：{create.error.message}</p>}</main><ResumeDiagnosisPanel disabled/></div></div>}
    {resume&&!mode&&<div className="mt-10 grid grid-cols-[minmax(0,1fr)_340px] items-start gap-8"><ResumePreview resume={resume}/><ResumeDiagnosisPanel diagnosis={diagnosis} loading={diagnose.isPending} error={diagnose.error} onDiagnose={()=>diagnose.mutate(resume.id)}/></div>}
  </div></AppShell>
}
