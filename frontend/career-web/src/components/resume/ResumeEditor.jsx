const schemas = {
  education: [['school','学校'],['major','专业'],['degree','学历'],['period','时间'],['description','解析原文']],
  experiences: [['company','公司'],['position','职位'],['period','时间'],['description','描述']],
  projects: [['name','项目名称'],['role','角色'],['techStack','技术栈'],['description','项目描述']],
}
const labels = { education: '教育经历', experiences: '实习经历', projects: '项目经历' }
export default function ResumeEditor({ value, onChange }) {
  const field = (key, next) => onChange({ ...value, [key]: next })
  const updateItem = (section, index, key, next) => field(section, value[section].map((item, i) => i === index ? { ...item, [key]: next } : item))
  const move = (section, index, delta) => { const items=[...value[section]], target=index+delta; if(target<0||target>=items.length)return; [items[index],items[target]]=[items[target],items[index]]; field(section,items) }
  return <div className="space-y-10">
    <Section title="基本信息"><div className="grid grid-cols-2 gap-4">{[['fullName','姓名'],['phone','手机号'],['email','邮箱'],['targetRole','求职方向'],['location','所在城市'],['name','档案名称']].map(([key,label])=><label key={key}><span className="text-xs text-stone-500">{label}</span><input className="input mt-1" value={value[key] || ''} onChange={(e)=>field(key,e.target.value)}/></label>)}</div></Section>
    {Object.entries(schemas).map(([section, schema])=><Section key={section} title={labels[section]} action={<button type="button" onClick={()=>field(section,[...(value[section]||[]),{}])} className="text-sm font-semibold">＋ 新增</button>}><div className="space-y-4">{(value[section]||[]).map((item,index)=><div key={index} className="relative grid grid-cols-2 gap-3 border-l-2 border-[#cadbd0] pl-5"><div className="absolute right-0 top-0 flex gap-2 text-xs text-stone-400"><button type="button" onClick={()=>move(section,index,-1)}>上移</button><button type="button" onClick={()=>move(section,index,1)}>下移</button><button type="button" onClick={()=>field(section,value[section].filter((_,i)=>i!==index))} className="text-red-600">删除</button></div>{schema.map(([key,label])=><label key={key} className={key==='description'?'col-span-2':''}><span className="text-xs text-stone-500">{label}</span>{key==='description'?<textarea rows="3" className="input mt-1 resize-y" value={item[key]||''} onChange={(e)=>updateItem(section,index,key,e.target.value)}/>:<input className="input mt-1" value={item[key]||''} onChange={(e)=>updateItem(section,index,key,e.target.value)}/>}</label>)}</div>)}{!value[section]?.length&&<p className="text-sm text-stone-400">暂未填写</p>}</div></Section>)}
    <Section title="技能"><input className="input" value={(value.skills||[]).join('，')} onChange={(e)=>field('skills',e.target.value.split(/[，,]/).map(v=>v.trim()).filter(Boolean))} placeholder="Java，React，AI Agent，PostgreSQL"/><p className="mt-2 text-xs text-stone-400">使用逗号分隔</p></Section>
  </div>
}
function Section({ title, action, children }) { return <section><div className="mb-5 flex items-center justify-between border-b border-black/10 pb-3"><h3 className="font-serif text-xl">{title}</h3>{action}</div>{children}</section> }
