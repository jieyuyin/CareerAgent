import {useState} from 'react'
import {useMutation,useQuery,useQueryClient} from '@tanstack/react-query'
import {useNavigate} from 'react-router-dom'
import AppShell from '../components/layout/AppShell.jsx'
import ApplicationStats from '../components/application/ApplicationStats.jsx'
import ApplicationTable from '../components/application/ApplicationTable.jsx'
import ApplicationDetailDrawer from '../components/application/ApplicationDetailDrawer.jsx'
import ApplicationEditModal from '../components/application/ApplicationEditModal.jsx'
import ApplicationCreateModal from '../components/application/ApplicationCreateModal.jsx'
import UnlinkedEmailList from '../components/application/UnlinkedEmailList.jsx'
import {createManualApplication,getApplication,getApplications,getApplicationStats,updateApplicationProgress} from '../api/applications.js'
import {getRecruitmentEmails,linkRecruitmentEmail,reanalyzeRecruitmentEmail} from '../api/email.js'

export default function ApplicationsPage(){
 const client=useQueryClient(),navigate=useNavigate(),[selectedId,setSelectedId]=useState(null),[editing,setEditing]=useState(null),[creating,setCreating]=useState(false),[prefill,setPrefill]=useState(null)
 const list=useQuery({queryKey:['applications'],queryFn:()=>getApplications({page:1,size:100}),retry:false})
 const stats=useQuery({queryKey:['application-stats'],queryFn:getApplicationStats,retry:false})
 const emails=useQuery({queryKey:['recruitment-emails'],queryFn:getRecruitmentEmails,retry:false})
 const detail=useQuery({queryKey:['application-detail',selectedId],queryFn:()=>getApplication(selectedId),enabled:!!selectedId,retry:false})
 const refresh=()=>{client.invalidateQueries({queryKey:['applications']});client.invalidateQueries({queryKey:['application-stats']});client.invalidateQueries({queryKey:['recruitment-emails']});if(selectedId)client.invalidateQueries({queryKey:['application-detail',selectedId]})}
 const update=useMutation({mutationFn:payload=>updateApplicationProgress(editing.id,payload),onSuccess:()=>{refresh();setEditing(null)}})
 const create=useMutation({mutationFn:async payload=>{const application=await createManualApplication(payload);if(payload.recruitmentEmailId)await linkRecruitmentEmail(payload.recruitmentEmailId,application.id);return application},onSuccess:data=>{refresh();setCreating(false);setPrefill(null);setSelectedId(data.id)}})
 const link=useMutation({mutationFn:({emailId,applicationId})=>linkRecruitmentEmail(emailId,applicationId),onSuccess:refresh})
 const reanalyze=useMutation({mutationFn:reanalyzeRecruitmentEmail,onSuccess:refresh})
 const openCreate=(value=null)=>{setPrefill(value);setCreating(true);create.reset()}
 const applications=list.data?.items||[],unlinked=(emails.data||[]).filter(email=>!email.applicationId)
 return <AppShell><div className="mx-auto max-w-[1280px] px-10 py-12"><div className="flex items-end justify-between gap-8"><div><p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">Application Dashboard</p><h1 className="mt-4 font-serif text-4xl">求职进展</h1><p className="mt-3 text-sm leading-7 text-stone-500">统一查看投递状态、岗位信息、使用简历、招聘邮件和面试记录。</p></div><button onClick={()=>openCreate()} className="rounded-xl bg-black px-5 py-3 text-sm font-semibold text-white">＋ 新增求职进展</button></div><ApplicationStats data={stats.data} loading={stats.isLoading}/><UnlinkedEmailList emails={unlinked} applications={applications} onCreate={openCreate} onLink={(emailId,applicationId)=>link.mutate({emailId,applicationId})} onReanalyze={id=>reanalyze.mutate(id)} busy={link.isPending||reanalyze.isPending}/><ApplicationTable items={applications} loading={list.isLoading} error={list.error} onSelect={setSelectedId} onEdit={setEditing}/></div><ApplicationDetailDrawer open={!!selectedId} detail={detail.data} loading={detail.isLoading} error={detail.error} onClose={()=>setSelectedId(null)} onEdit={setEditing} onInterview={id=>navigate(`/interviews?applicationId=${id}`)}/><ApplicationEditModal application={editing} onClose={()=>setEditing(null)} onSave={payload=>update.mutate(payload)} saving={update.isPending} error={update.error}/><ApplicationCreateModal open={creating} prefill={prefill} onClose={()=>{setCreating(false);setPrefill(null)}} onSave={payload=>create.mutate(payload)} saving={create.isPending} error={create.error}/></AppShell>
}
