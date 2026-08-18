import { useRef } from 'react'
export default function ResumeUploader({ onFile, pending, error }) {
  const input = useRef()
  return <section className="rounded-2xl border border-dashed border-black/20 bg-white/40 p-10 text-center"><input ref={input} className="hidden" type="file" accept=".pdf,.docx,application/pdf,application/vnd.openxmlformats-officedocument.wordprocessingml.document" onChange={(event) => event.target.files[0] && onFile(event.target.files[0])}/><h2 className="font-serif text-2xl">上传已有简历</h2><p className="mt-2 text-sm text-stone-500">支持 PDF、DOCX，最大 10MB。解析结果不会自动写入数据库。</p><button disabled={pending} onClick={() => input.current.click()} className="mt-6 rounded-xl bg-black px-6 py-3 text-sm font-semibold text-white disabled:opacity-50">{pending ? '正在提取文字并结构化解析…' : '选择简历文件'}</button>{error && <p className="mt-4 text-sm text-red-700">{error.message}</p>}</section>
}
