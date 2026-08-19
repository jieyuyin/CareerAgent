import { NavLink, useLocation } from 'react-router-dom'

const groups = [
  ['机会', [['岗位雷达', '/'], ['值得投', '/?view=favorite']]],
  ['简历', [['我的简历', '/resume'], ['匹配分析', '/matches']]],
  ['求职进度', [['求职进展', '/applications'], ['模拟面试', '/interviews']]],
  ['系统', [['邮箱管理', '/settings/email'], ['模型配置', '/settings/model'], ['关注与偏好', '/preferences'], ['官网源管理', '/sources']]],
]

export default function AppShell({ children }) {
  const location = useLocation()
  return <div className="min-h-screen bg-[#f5f2eb] text-[#171714]">
    <aside className="fixed inset-y-0 left-0 z-20 flex w-60 flex-col overflow-hidden border-r border-black/10 bg-[#f8f6f0] px-5 py-7">
      <NavLink to="/" className="flex items-center gap-3 px-2 text-lg font-semibold tracking-tight"><span className="grid h-8 w-8 place-items-center rounded-xl bg-[#181816] text-sm text-white">C</span>CareerAgent</NavLink>
      <nav className="mt-10 min-h-0 flex-1 space-y-7 overflow-y-auto overscroll-contain pr-1">{groups.map(([title, items]) => <div key={title}><p className="px-3 text-[11px] font-semibold uppercase tracking-[.16em] text-stone-400">{title}</p><div className="mt-2 space-y-1">{items.map(([label, to]) => <NavLink key={label} to={to} className={() => `block rounded-xl px-3 py-2.5 text-sm transition ${(to === '/' ? location.pathname === '/' : `${location.pathname}${location.search}` === to || location.pathname === to) ? 'bg-[#e9e4d9] font-semibold text-black' : 'text-stone-600 hover:bg-black/[.04] hover:text-black'}`}>{label}</NavLink>)}</div></div>)}</nav>
      <div className="mt-5 shrink-0 border-t border-black/10 pt-5"><div className="flex items-center gap-3"><span className="grid h-9 w-9 place-items-center rounded-full bg-[#d9e7df] text-xs font-bold">DU</span><div><p className="text-sm font-medium">Demo User</p><p className="text-xs text-stone-400">求职工作台</p></div></div></div>
    </aside>
    <main className="ml-60 min-h-screen">{children}</main>
  </div>
}
