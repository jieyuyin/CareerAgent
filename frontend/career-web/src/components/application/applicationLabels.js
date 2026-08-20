export const statusLabels={APPLIED:'简历已投递',SCREENING:'筛选中',ASSESSMENT:'测评',INTERVIEW:'面试中',OFFER:'Offer',REJECTED:'拒绝'}
export const statusStyles={APPLIED:'bg-stone-200 text-stone-700',SCREENING:'bg-[#dce7ee] text-[#31566b]',ASSESSMENT:'bg-[#eee7d7] text-[#705b31]',INTERVIEW:'bg-[#e2e4f0] text-[#4d5174]',OFFER:'bg-[#dcecdf] text-[#315d3b]',REJECTED:'bg-red-50 text-red-700'}
export const interviewStageLabels={TECH_ONE:'业务一面',TECH_TWO:'业务二面',TECH_THREE:'业务三面',HR:'HR 面'}
export const progressLabel=item=>item?.status==='INTERVIEW'?(interviewStageLabels[item.interviewStage]||'面试中'):(statusLabels[item?.status]||item?.status)
