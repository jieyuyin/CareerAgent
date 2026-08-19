import {useState} from 'react'
import {useMutation,useQuery,useQueryClient} from '@tanstack/react-query'
import {useNavigate} from 'react-router-dom'
import AppShell from '../components/layout/AppShell.jsx'
import ResumeEmptyState from '../components/resume/ResumeEmptyState.jsx'
import ResumeUploader from '../components/resume/ResumeUploader.jsx'
import ResumeCreateWizard from '../components/resume/ResumeCreateWizard.jsx'
import ResumePreview from '../components/resume/ResumePreview.jsx'
import ResumeDiagnosisPanel from '../components/resume/ResumeDiagnosisPanel.jsx'
import ResumeVersionList from '../components/resume/ResumeVersionList.jsx'
import ResumeAssistant from '../components/resume/ResumeAssistant.jsx'
import ResumeGenerateModal from '../components/resume/ResumeGenerateModal.jsx'
import ResumeMarkdownPreview from '../components/resume/ResumeMarkdownPreview.jsx'
import {emptyResume,parsedToResume} from '../components/resume/resumeModel.js'
import {createResume,diagnoseResume,exportResumePdf,generateResume,getCurrentResume,getProfileVersions,polishResume,uploadResume} from '../api/resumes.js'
import {getJobs} from '../api/jobs.js'

export default function ResumePage(){
  const client=useQueryClient(),navigate=useNavigate(),[mode,setMode]=useState(null),[draft,setDraft]=useState(null),[selected,setSelected]=useState('master'),[generateOpen,setGenerateOpen]=useState(false),[polishResult,setPolishResult]=useState(null),[diagnosis,setDiagnosis]=useState(null),[exporting,setExporting]=useState(null)
  const current=useQuery({queryKey:['resume','current'],queryFn:getCurrentResume,retry:false})
  const versions=useQuery({queryKey:['resume-versions'],queryFn:getProfileVersions,retry:false})
  const jobs=useQuery({queryKey:['jobs','resume-generate'],queryFn:()=>getJobs({page:1,size:100}),retry:false})
  const upload=useMutation({mutationFn:uploadResume,onSuccess:data=>{setDraft(parsedToResume(data));setMode('confirm')}})
  const create=useMutation({mutationFn:createResume,onSuccess:data=>{client.setQueryData(['resume','current'],data);setMode(null);setDraft(null);navigate(`/resume/edit/${data.id}`)}})
  const polish=useMutation({mutationFn:polishResume,onSuccess:setPolishResult})
  const diagnose=useMutation({mutationFn:diagnoseResume,onSuccess:setDiagnosis})
  const generate=useMutation({mutationFn:generateResume,onSuccess:data=>{client.setQueryData(['resume-versions'],old=>[data,...(old||[])]);setSelected(data.id);setGenerateOpen(false)}})
  const exportPdf=async(id,master)=>{try{setExporting(master?'master':id);await exportResumePdf(id,master)}finally{setExporting(null)}}
  const resume=current.data,version=(versions.data||[]).find(item=>item.id===selected)
  if(mode==='upload'||((mode==='confirm'||mode==='create')&&draft)) return <AppShell><div className="mx-auto max-w-[1180px] px-10 py-12"><button onClick={()=>{setMode(null);setDraft(null)}} className="mb-6 text-sm text-stone-500">← 返回我的简历</button>{mode==='upload'?<ResumeUploader onFile={file=>upload.mutate(file)} pending={upload.isPending} error={upload.error}/>:<div className="grid grid-cols-[minmax(0,1fr)_330px] gap-8"><main className="rounded-2xl bg-[#fffdf8] p-8"><div className="mb-7 rounded-xl bg-[#e7efe8] p-4 text-sm text-[#315d3b]">{mode==='confirm'?'AI 已生成结构化草稿，请确认后保存；当前文件不会直接覆盖 Master Resume。':'按步骤建立你的职业档案。'}</div><ResumeCreateWizard initial={draft} onSave={value=>create.mutate(value)} saving={create.isPending} title={mode==='confirm'?'确认解析结果':'从零创建基础简历'}/></main><ResumeDiagnosisPanel disabled/></div>}</div></AppShell>
  return <AppShell><div className="grid min-h-screen grid-cols-[minmax(0,1fr)_340px]"><main className="min-w-0 px-10 py-11"><header className="flex items-end justify-between gap-8"><div><p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">Career Profile Center</p><h1 className="mt-3 font-serif text-4xl">我的简历</h1><p className="mt-3 text-sm leading-7 text-stone-500">维护可信的 Master Resume，并围绕真实 JD 生成独立岗位版本。</p></div><div className="flex shrink-0 gap-2"><button onClick={()=>setMode('upload')} className="rounded-xl border border-black/15 bg-white/50 px-4 py-3 text-sm font-semibold">上传简历</button>{resume&&<><button onClick={()=>navigate(`/resume/edit/${resume.id}`)} className="rounded-xl border border-black/15 bg-white/50 px-4 py-3 text-sm font-semibold">编辑简历</button><button onClick={()=>setGenerateOpen(true)} className="rounded-xl bg-black px-4 py-3 text-sm font-semibold text-white">AI 生成岗位版</button></>}</div></header>
    {current.isLoading&&<div className="mt-12 h-96 animate-pulse rounded-2xl bg-black/5"/>}{current.isError&&<p className="mt-12 text-sm text-red-700">基础简历加载失败：{current.error.message}</p>}
    {!current.isLoading&&!current.isError&&!resume&&<ResumeEmptyState onUpload={()=>setMode('upload')} onCreate={()=>{setDraft(emptyResume());setMode('create')}}/>}
    {resume&&<><div className="mt-10">{selected==='master'?<ResumePreview resume={resume}/>:<ResumeMarkdownPreview version={version}/>}</div><ResumeVersionList resume={resume} versions={versions.data||[]} selected={selected} onSelect={setSelected} onExport={exportPdf} exporting={exporting}/>{diagnosis&&<div className="mt-6 rounded-2xl bg-[#e7efe8] p-5 text-sm text-[#315d3b]">诊断完成：{[...(diagnosis.strengths||[]),...(diagnosis.improvements||[])].slice(0,3).join('；')}</div>}</>}
  </main>{resume?<ResumeAssistant resume={resume} onPolish={payload=>polish.mutate(payload)} onGenerate={()=>setGenerateOpen(true)} onDiagnose={()=>diagnose.mutate(resume.id)} polishing={polish.isPending} diagnosing={diagnose.isPending} polishResult={polishResult} error={polish.error||diagnose.error}/>:<aside className="border-l border-black/10 bg-[#efebe3]"/>}</div><ResumeGenerateModal open={generateOpen} jobs={jobs.data?.items||[]} onClose={()=>setGenerateOpen(false)} onGenerate={payload=>generate.mutate(payload)} pending={generate.isPending} error={generate.error}/></AppShell>
}
