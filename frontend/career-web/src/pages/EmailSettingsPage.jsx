import { useState } from 'react'
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query'
import AppShell from '../components/layout/AppShell.jsx'
import { bindEmailAccount, getEmailAccount, syncRecruitmentEmails, testEmailAccount, updateEmailSyncSettings } from '../api/email.js'

const INTERVALS = [1, 2, 4, 6, 12, 24]

export default function EmailSettingsPage() {
  const client = useQueryClient()
  const account = useQuery({ queryKey: ['email-account'], queryFn: getEmailAccount, retry: false })
  const [form, setForm] = useState({ email: '', authorizationCode: '' })
  const [notice, setNotice] = useState(null)
  const test = useMutation({ mutationFn: testEmailAccount, onSuccess: () => setNotice({ ok: true, text: 'IMAP 连接成功，可以保存账号。' }), onError: fail(setNotice) })
  const bind = useMutation({ mutationFn: bindEmailAccount, onSuccess: data => { client.setQueryData(['email-account'], data); setForm({ ...form, authorizationCode: '' }); setNotice({ ok: true, text: '163 邮箱已连接，授权码已加密保存。' }) }, onError: fail(setNotice) })
  const sync = useMutation({ mutationFn: syncRecruitmentEmails, onSuccess: data => { refresh(client); setNotice({ ok: true, text: `同步完成：扫描 ${data.scanned} 封，保存 ${data.recruitmentEmails} 封招聘邮件，关联 ${data.linkedApplications} 条投递，更新 ${data.statusUpdates} 个状态。` }) }, onError: fail(setNotice) })
  const settings = useMutation({ mutationFn: updateEmailSyncSettings, onSuccess: data => { client.setQueryData(['email-account'], data); setNotice({ ok: true, text: data.autoSyncEnabled ? `已开启自动同步，每 ${data.syncIntervalHours} 小时执行一次。` : '已关闭自动同步。' }) }, onError: fail(setNotice) })
  const saveSettings = (enabled, intervalHours) => { setNotice(null); settings.mutate({ enabled, intervalHours }) }
  const submit = event => { event.preventDefault(); setNotice(null); bind.mutate(form) }

  return <AppShell><div className="mx-auto max-w-5xl px-12 py-12">
    <p className="text-xs font-semibold uppercase tracking-[.18em] text-stone-400">Email connection</p><h1 className="mt-4 font-serif text-4xl">邮箱管理</h1>
    <p className="mt-3 max-w-2xl text-sm leading-7 text-stone-500">连接 163 邮箱后，CareerAgent 会读取招聘相关邮件，识别面试、测评、Offer 和拒信，并尝试关联已有投递。</p>
    {account.isLoading && <div className="mt-10 h-64 animate-pulse rounded-2xl bg-black/5" />}
    {account.isError && <p className="mt-10 text-sm text-red-700">邮箱账户加载失败：{account.error.message}</p>}
    {account.data ? <>
      <section className="mt-10 grid grid-cols-[1fr_auto] items-center gap-8 rounded-2xl border border-black/10 bg-[#fffdf8] p-8">
        <div><div className="flex items-center gap-3"><span className="grid h-11 w-11 place-items-center rounded-xl bg-[#dcecdf] font-bold text-[#315d3b]">163</span><div><h2 className="font-semibold">163 邮箱</h2><p className="mt-1 text-sm text-stone-500">{account.data.email}</p></div></div>
          <div className="mt-7 flex gap-10 text-sm"><Meta label="状态" value={account.data.status === 'CONNECTED' ? '已连接' : '连接异常'} error={account.data.status !== 'CONNECTED'} /><Meta label="最近同步" value={formatTime(account.data.lastSyncTime)} /><Meta label="下次同步" value={account.data.autoSyncEnabled ? formatTime(account.data.nextSyncTime) : '未开启'} /></div>
          {account.data.lastSyncError && <p className="mt-4 text-xs text-red-700">上次同步失败：{account.data.lastSyncError}</p>}
        </div><button onClick={() => sync.mutate()} disabled={sync.isPending} className="rounded-xl bg-black px-6 py-3 text-sm font-semibold text-white disabled:opacity-40">{sync.isPending ? '正在同步…' : '立即同步'}</button>
      </section>
      <section className="mt-5 flex items-center justify-between rounded-2xl border border-black/10 bg-white/50 p-6"><div><h2 className="font-semibold">自动同步</h2><p className="mt-1 text-sm text-stone-500">服务运行期间，系统会按设定间隔自动检查新邮件。</p></div><div className="flex items-center gap-3">
        <select className="input w-36" disabled={settings.isPending} value={account.data.syncIntervalHours || 4} onChange={event => saveSettings(account.data.autoSyncEnabled, Number(event.target.value))}>{INTERVALS.map(value => <option key={value} value={value}>每 {value} 小时</option>)}</select>
        <button onClick={() => saveSettings(!account.data.autoSyncEnabled, account.data.syncIntervalHours || 4)} disabled={settings.isPending} className={`min-w-36 rounded-xl px-5 py-3 text-sm font-semibold disabled:opacity-40 ${account.data.autoSyncEnabled ? 'border border-red-200 bg-red-50 text-red-700' : 'bg-[#315d3b] text-white'}`}>{settings.isPending ? '保存中…' : account.data.autoSyncEnabled ? '关闭自动同步' : '开启自动同步'}</button>
      </div></section>
    </> : !account.isLoading && <form onSubmit={submit} className="mt-10 rounded-2xl border border-black/10 bg-white/50 p-8"><h2 className="font-serif text-2xl">绑定 163 邮箱</h2><p className="mt-2 text-sm text-stone-500">请先在 163 邮箱设置中开启 IMAP/SMTP 服务，并生成客户端授权码。不要填写邮箱登录密码。</p><div className="mt-7 grid grid-cols-2 gap-5"><label><span className="text-sm font-semibold">邮箱地址</span><input required type="email" pattern=".+@163\.com" className="input mt-2" value={form.email} onChange={event => setForm({ ...form, email: event.target.value })} placeholder="name@163.com" /></label><label><span className="text-sm font-semibold">IMAP 授权码</span><input required type="password" className="input mt-2" value={form.authorizationCode} onChange={event => setForm({ ...form, authorizationCode: event.target.value })} placeholder="不是邮箱登录密码" /></label></div><div className="mt-6 flex justify-end gap-3"><button type="button" onClick={() => test.mutate(form)} disabled={test.isPending || !form.email || !form.authorizationCode} className="rounded-xl border border-black/15 px-5 py-3 text-sm font-semibold disabled:opacity-40">{test.isPending ? '测试中…' : '测试连接'}</button><button disabled={bind.isPending} className="rounded-xl bg-black px-6 py-3 text-sm font-semibold text-white disabled:opacity-40">{bind.isPending ? '保存中…' : '连接并保存'}</button></div></form>}
    {notice && <div className={`mt-5 rounded-xl px-4 py-3 text-sm ${notice.ok ? 'bg-[#dcecdf] text-[#315d3b]' : 'bg-red-50 text-red-700'}`}>{notice.text}</div>}
    <section className="mt-10 border-t border-black/10 pt-7 text-sm leading-7 text-stone-500"><b className="text-stone-700">隐私与安全</b><p>授权码使用 AES-GCM 加密后存入 PostgreSQL，查询接口不会返回授权码。系统只保存包含招聘关键词的邮件，不支持发送邮件。</p></section>
  </div></AppShell>
}

function Meta({ label, value, error }) { return <div><p className="text-xs text-stone-400">{label}</p><p className={`mt-1 font-semibold ${error ? 'text-red-700' : ''}`}>{value}</p></div> }
function formatTime(value) { if (!value) return '尚未安排'; return new Intl.DateTimeFormat('zh-CN', { dateStyle: 'medium', timeStyle: 'short' }).format(new Date(value)) }
function refresh(client) { client.invalidateQueries({ queryKey: ['email-account'] }); client.invalidateQueries({ queryKey: ['recruitment-emails'] }); client.invalidateQueries({ queryKey: ['applications'] }) }
function fail(setNotice) { return error => setNotice({ ok: false, text: error.message || '操作失败' }) }
