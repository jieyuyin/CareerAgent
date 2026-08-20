-- Public ByteDance campus positions exported from the official job source.
-- This seed contains job descriptions only: no resumes, applications, email,
-- interview history, model credentials, or other user-owned runtime data.

INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片架构工程师-Data（上海）',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7123140215024503076/detail','岗位名称：AI芯片架构工程师-Data（上海）

岗位职责：
1、负责AI训练、推理芯片架构的探索与设计；
2、负责AI训练、推理系统的软硬件协同设计；
3、负责不同业务场景下AI模型训练流程中的关键任务和典型算子分析；
4、负责芯片架构的SystemC建模。

岗位要求：
1、熟悉计算体系结构，对典型的AI硬件加速器架构或者GPU架构有深入的了解；
2、有AI模型优化相关的经验，对典型的AI模型计算访存行为有较好的理解；
3、熟悉分布式训练流程，熟悉反向传播和参数更新等过程；
4、熟练掌握C/C++，Python等相关编程语言。

以下为加分项：
1、对计算机网络TCP/IP协议栈或者RDMA协议有了解；
2、了解TensorFlow，PyTorch等深度学习框架等；
3、具有ISS、Cycle-Accurate Model及SystemC工程经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.84258+00'::timestamptz,'7123140215024503076') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','策略产品经理（AI大模型效果方向）-抖音',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7438545247574477063/detail','岗位名称：策略产品经理（AI大模型效果方向）-抖音

岗位职责：
1、负责抖音AI分身大模型对话效果的提升，聚焦对话系统底层能力的构建与优化，推动大模型对话系统在抖音不同垂类AI分身上的对话效果迭代与提升；
2、结合AI分身在抖音内的应用场景（直播间AI嘉宾、评论区、群聊等），分析模型效果问题并定义理想态，输出模型效果优化策略，协同评测团队建立效果标准和可量化的评估方法，为模型对话效果负责；
3、协同模型算法和工程技术团队，聚焦LLM对话系统的核心技术环节与原子能力，如预训练模型、PE、RAG、语音交互等技术的应用与优化，持续优化大模型的对话质量；
4、基于对话效果目标，定义评估标准，协同评测团队分析效果问题并归因，能从技术视角协同算法解决问题，提高对话效果。

岗位要求：
1、具备2年及以上AI产品经理工作经验，对大模型技术应用抱有强烈热情；具备直播社交娱乐社区等内容场景的AI产品落地经验优先考虑；
2、对预训练语言模型、精调、PE、RAG等大模型技术有一定理解，有实际应用经验最佳；
3、对用户有较好理解和认知，能够从用户视角分析对话效果的问题并归因，给出针对性优化策略，具备技术视角分析问题的能力；
4、具备良好的跨团队协作能力，能够与算法、工程、评测等多个团队紧密合作，推动产品从技术实现到效果落地的全流程；
5、具备一定产品规划和推动能力，有自驱力，对行业发展有自己的思考，具备相对广泛的技术视野，主动学习大模型领域相关的技术知识；
6、逻辑清晰，能透过现象看本质，系统地思考与解决问题，能全局性的统筹协调复杂业务。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.754713+00'::timestamptz,'7438545247574477063') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片互联软件工程师-Data',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7462210655208212743/detail','岗位名称：AI芯片互联软件工程师-Data

岗位职责：
1、参与AI芯片多卡互联方案的设计与开发，开发和优化多卡互联的软件驱动程序，实现多卡之间的协同工作；
2、参与多卡互联系统的验证与调试，及时发现并解决在测试过程中出现的各种问题；
3、参与AI芯片互联相关软件栈开发，包括Kernel Mode Driver/User Mode Driver/SDK/Tools等；
4、跟踪行业最新技术动态，为公司的AI芯片多卡互联技术发展提供前瞻性的建议和技术储备。

岗位要求：
1、计算机/电子信息工程相关专业本科及以上学历；
2、熟练掌握至少一种编程语言（如C、C++等）及Linux系统编程，具备Linux内核驱动开发经验，熟悉驱动开发流程；
3、至少2年以上AI芯片/GPGPU芯片/RDMA网卡芯片或者相关领域的工作经验；
4、对多卡互联技术有深入理解（包括但不限于NVLink、SUE、RDMA等高速互联接口协议），掌握RDMA网卡驱动开发，熟悉TCP/IP协议及RoCE V2协议；
5、熟悉NCCL等集合通信库的原理以及使用；
6、具有良好的团队合作精神和沟通能力，能够与跨部门团队（如硬件团队、算法团队等）紧密协作。

加分项：
1、理解LLM网络模型结构，熟悉模型部署、分析和优化；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:55.504907+00'::timestamptz,'7462210655208212743') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','芯片架构建模及性能分析工程师-AI芯片',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7470502915539781895/detail','岗位名称：芯片架构建模及性能分析工程师-AI芯片

岗位职责：
1、负责AI芯片架构的探索与建模；
2、负责不同业务场景下的AI芯片架构及微架构的性能分析；
3、进行IP模型测试、RTL校准、性能分析，找出和优化IP微架构的性能瓶颈。

岗位要求：
1、熟练掌握C++/SystemC，熟悉AI Core、Noc、DMA、Memory等硬件IP规格和内部实现；
2、熟悉计算机体系结构，对典型的AI硬件加速器架构有一定了解。

加分项：
1、有性能建模或参考模型开发经验，熟练掌握C++、SystemVerilog等语言；
2、有SystemC/Gem5等仿真工具的开发经验；
3、做过RTL验证或模块设计，IC或FPGA背景均可。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:57.661413+00'::timestamptz,'7470502915539781895') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片系统软件架构师/工程师-NPU',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7473370200642914567/detail','岗位名称：AI芯片系统软件架构师/工程师-NPU

岗位职责：
1、跟踪GPGPU/NPU行业最新动态、产品与技术架构，分析公司内部业务系统需求，结合自研芯片架构，输出系统软硬件协同设计方案；
2、负责自研AI加速芯片系统软件栈的开发交付，包括芯片设备侧Firmware/Host侧驱动/系统管理诊断工具；
3、负责自研AI加速芯片的NPU/CIM存算方向的软硬协同验证，性能分析优化，基于可编程接口进行算子用例开发；
4、负责NPU IP的软件栈移植适配与集成，包括NPU IP的Firmware/驱动/Runtime/SDK。

岗位要求：
1、本科及以上学历，计算机、体系结构等相关专业；
2、熟悉Linux C/C++开发，有扎实的编程基础；
3、有GPGPU/NPU芯片项目研发经验，熟悉Nvidia/AMD或国产厂家GPU计算产品，熟悉CUDA/ROCm等GPU软件栈；
4、熟悉计算机体系架构，对深度学习有深入的理解，对GPGPU/NPU/CIM存算体系结构至少熟悉一种，理解其微架构、主要指令集等；
5、有GPGPU/NPU Firmware/Linux驱动开发经验，对内存管理、Kernel任务调度、RAS等有实际开发调试经验；
6、熟悉第三方NPU IP的软件栈移植集成，结合SoC架构进行性能分析优化。

加分项：
1、有AI相关研发经验，熟悉CUDA编程，熟悉AI框架，对一种或者多种网络模型结构有深入理解；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.773968+00'::timestamptz,'7473370200642914567') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片系统软件架构师/工程师-BSP',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7473374982908807442/detail','岗位名称：AI芯片系统软件架构师/工程师-BSP

岗位职责：
1、跟踪GPGPU/NPU行业最新动态、产品与技术架构，分析公司内部业务系统需求，结合自研芯片架构，输出系统软硬件协同设计方案；
2、负责自研加速芯片系统软件栈的设计开发，包括BootROM/Bootloader，Linux/RTOS系统适配和设备驱动开发；
3、负责自研芯片设备管理/DFX/RAS/温控等功能模块的软件设计开发，负责系统问题分析定位。

岗位要求：
1、本科及以上学历，计算机、体系结构等相关专业；
2、熟悉Linux C/C++开发，有扎实的编程基础；
3、有GPGPU/NPU芯片项目研发经验，熟悉Nvidia/AMD或国产厂家GPU计算产品，熟悉CUDA/ROCm等GPU软件栈；
4、熟悉ARM/RISC-V体系架构，熟悉CPU子系统/安全/温控/电源管理/MMU/Trace/低速接口等硬件模块，熟悉SoC启动/安全启动流程，熟悉ATF/MSCP/U-Boot；
5、熟悉Linux内核，有Linux/RTOS设备驱动开发经验，有丰富的系统问题分析调试经验；
6、有DFX/RAS软件设计开发经验，熟悉系统故障/异常处理策略和处理流程。

加分项：
1、有AI相关研发经验，熟悉CUDA编程，熟悉AI框架，对一种或者多种网络模型结构有深入理解；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.780363+00'::timestamptz,'7473374982908807442') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent产品解决方案负责人-基础设施',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7488990399533615368/detail','岗位名称：AI Agent产品解决方案负责人-基础设施

岗位职责：
1、AI云原生解决方案设计：
1）结合客户AI工作流（如大模型训练/推理、自动驾驶仿真、视频分析等），设计基于IaaS的云原生架构方案，优化模型训练/推理的性能、成本与可靠性；
2）主导AI专用加速方案（如混合精度训练、模型量化、分布式推理）的架构选型与落地，推动框架层与基础设施层的协同优化；
2、客户需求分析与价值传递：
1）深入调研客户AI应用场景，提炼核心痛点（如训练周期长、推理延迟高、资源成本高等）；
2）通过技术白皮书、架构设计图、POC验证等方式，向客户展示IaaS平台在AI场景下的性能优势（如训练速度提升、推理成本降低等）；
3、跨团队协作与生态整合：
1）与研发团队协同定义技术实现路径，推动算子优化、框架适配等需求落地；
2）联合产品经理规划解决方案路标，确保技术方案与商业策略对齐；
3）整合ISV、AI框架社区资源，构建AI云原生解决方案生态；
4、行业趋势与竞争分析：
1）跟踪AI云原生技术发展（如Kubernetes原生AI、推理加速），输出行业洞察报告；
2）对标市场AI云服务，制定差异化竞争策略。

岗位要求：
1、专业背景：
1）本科及以上学历，计算机科学、人工智能、电子信息等相关专业；
2）有AI解决方案交付或云原生架构设计案例；
2、技术技能：
1）熟悉主流深度学习框架（TensorFlow/PyTorch/Dynamo）的技术原理与性能瓶颈；
2）理解云原生技术栈（Kubernetes/Docker/Service Mesh）的架构设计逻辑；
3）掌握AI性能分析工具（如Profiler、TensorBoard等）及优化方法论（如模型压缩、PD分离等）；
3、软技能：
1）具备技术方案产品化能力，能将复杂技术转化为客户可感知的价值（如成本、速度、稳定性）；
2）优秀的管理能力和跨团队沟通能力，能协调研发、产品、客户多方资源推动项目落地。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.744705+00'::timestamptz,'7488990399533615368') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent产品解决方案负责人-基础设施',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7494503784061946120/detail','岗位名称：AI Agent产品解决方案负责人-基础设施

岗位职责：
1、AI云原生解决方案设计：
1）结合客户AI工作流（如大模型训练/推理、自动驾驶仿真、视频分析等），设计基于IaaS的云原生架构方案，优化模型训练/推理的性能、成本与可靠性；
2）主导AI专用加速方案（如混合精度训练、模型量化、分布式推理）的架构选型与落地，推动框架层与基础设施层的协同优化；
2、客户需求分析与价值传递：
1）深入调研客户AI应用场景，提炼核心痛点（如训练周期长、推理延迟高、资源成本高等）；
2）通过技术白皮书、架构设计图、POC验证等方式，向客户展示IaaS平台在AI场景下的性能优势（如训练速度提升、推理成本降低等）；
3、跨团队协作与生态整合：
1）与研发团队协同定义技术实现路径，推动算子优化、框架适配等需求落地；
2）联合产品经理规划解决方案路标，确保技术方案与商业策略对齐；
3）整合ISV、AI框架社区资源，构建AI云原生解决方案生态；
4、行业趋势与竞争分析：
1）跟踪AI云原生技术发展（如Kubernetes原生AI、推理加速），输出行业洞察报告；
2）对标市场AI云服务，制定差异化竞争策略。

岗位要求：
1、专业背景：
1）本科及以上学历，计算机科学、人工智能、电子信息等相关专业；
2）有AI解决方案交付或云原生架构设计案例；
2、技术技能：
1）熟悉主流深度学习框架（TensorFlow/PyTorch/Dynamo）的技术原理与性能瓶颈；
2）理解云原生技术栈（Kubernetes/Docker/Service Mesh）的架构设计逻辑；
3）掌握AI性能分析工具（如Profiler、TensorBoard等）及优化方法论（如模型压缩、PD分离等）；
3、软技能：
1）具备技术方案产品化能力，能将复杂技术转化为客户可感知的价值（如成本、速度、稳定性）；
2）优秀的管理能力和跨团队沟通能力，能协调研发、产品、客户多方资源推动项目落地。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.899439+00'::timestamptz,'7494503784061946120') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','人力数据AI应用专家-集团信息系统',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7495740227756607752/detail','岗位名称：人力数据AI应用专家-集团信息系统

岗位职责：
1、深入了解业务场景，结合业务场景建设稳定、可靠的底层数据，确保数据准确、可用；
2、通过数据分析方法识别、预测组织中的信息效率问题并提出可落地的建议，如如何提升信息传播效率、减少无效信息、解决信息分散问题等，并最终推动实现管理收益；
3、通过挖掘日常管理背后的规律和底层逻辑，建立分析框架和模型，产出高质量的组织与团队诊断报告；
4、探索并落地AI（如大模型、智能体等）在人力分析、文本挖掘等场景中的应用，持续提升数据赋能业务的效率与体验。

岗位要求：
1、具备较强的AI实践与应用能力，能熟练运用大语言模型等智能化工具辅助数据分析与问题诊断；同时掌握SQL、Python等常用数据处理语言，能够使用Tableau/PowerBI等工具搭建数据看板；
2、具备深厚的业务理解力，对数字敏感，有洞察力和框架思维，能准确定义问题、提出假设并设计解决方案；
3、具备优秀的沟通能力与影响力；
4、具备数据安全与隐私保护意识，严格遵守员工数据管理相关规范，防范数据泄露、滥用等风险。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.809295+00'::timestamptz,'7495740227756607752') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent研发工程师-抖音',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7503865965844662546/detail','岗位名称：AI Agent研发工程师-抖音

岗位职责：
1、参与抖音AI创作团队AI Native研发链路、流程建设，推动AI Native基建建设，协同产品、算法等团队提升用户体验；
2、参与多媒体仓库的迭代与业务开发；
3、负责AI Coding方向的工程化落地，推进代码生成、测试辅助、代码评审、研发协同等能力进入真实研发流程，深入参与团队内各个虚拟资产生产流程，推动Harness Engineering等前沿实践沉淀为团队级方法论和工程标准；
4、参与评测、知识库、上下文管理等基础能力建设，对AI Native提效效果进行持续调优，并持续通过数据分析与策略改进；
5、跟踪AI技术趋势，思考AI研发新范式、AI新技术在研发提效中的落地场景。

岗位要求：
1、本科及以上学历，计算机相关专业，深刻理解计算机系统原理，具备扎实的数据结构和算法基础以及编程能力；
2、具备扎实的工程化和架构思维，至少熟悉C++与一项脚本语言，有多媒体内容处理开发技术背景和工程管理维护经验，能够将快速变化的AI能力转化为稳定、可治理、可复制的解决方案；
3、对Agent技术在研发场景落地有兴趣，了解最新Agent运行机制与设计理念，在上下文工程、Skills、Agent编排、评测等有实践经验；并能清晰阐述如何通过Agent解决实际业务问题；
4、优秀的系统设计与问题拆解能力：能够将模糊、复杂的业务问题，拆解为清晰、可执行的技术模块和迭代路径，能够在复杂场景下与业务、研发、QA等角色高效协作；
5、对新技术保持好奇心和执行力，具备良好的沟通协作能力、自驱力，愿意在快速变化的AI领域中持续学习与探索。

加分项
1、有Harness Engineering、Agent平台、企业级AI工作流等相关实践经验；
2、有OpenClaw、Copilot类产品、Code Agent、自动化协同系统等实际落地经验；
3、持续关注并输出AI前沿趋势判断、实践总结或方法论沉淀。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.764613+00'::timestamptz,'7503865965844662546') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI数据策略专家（Memory方向） - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7522671118172948754/detail','岗位名称：AI数据策略专家（Memory方向） - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、协同产品研发团队完成模型迭代与评估需要的自动化生产链路，参与模型效果评估体系搭建，制定基于链路效果的评测指标与验证方案，持续迭代提示词组合效果；
2、深入理解业务场景，将业务需求转化为提示词训练的技术方案，保障自动化链路适配实际应用场景的核心诉求；
3、对文本大模型输出结果、Chatbot用户群体喜好有自己的见解，参与细化理想态规则与数据策略；
4、具备扎实的数据分析能力和文本评估能力，能基于训练数据、模型效果、用户指标等信息定位优化点与问题，为训练策略优化和评估决策提供支撑。

岗位要求：
1、本科及以上学历，新闻传播、社会学、汉语言文学、哲学等相关专业，文字敏感度高，兼具逻辑思维与文本敏感度者优先；
2、熟悉文本大模型训练基本原理与Prompt Engineering方法论，有PE项目实践经验优先；
3、认真细心，有NLP数据视角的文本分析能力，兼具数据统计分析能力优先；
4、结果导向，具备优秀的团队协作、问题解决能力及较高的自驱力；
5、对AI有浓厚的兴趣，关注国内外主流AI产品的最新动向，日常高频使用AI工具。

加分项（需要进行技术面试）：
1、熟练使用Python进行数据处理与Agent工具链开发，有自动化脚本开发经验（Vibe coding也可以）。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.653941+00'::timestamptz,'7522671118172948754') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','软硬件架构探索工程师-AI工具链',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7530588804206971144/detail','岗位名称：软硬件架构探索工程师-AI工具链

岗位职责：
1、参与AI芯片软硬件设计，负责LLM和AIGC等业务模型结构和需求分析，指导硬件参数设计和微架构优化设计；
2、负责根据硬件，设计分布式训练、部署方案，提供硬件硅前验证案例和软件设计方案；参与探索多卡互联拓扑结构和方案，实现多卡之间的协同工作；
3、负责分布式业务模型和Roofline硬件仿真建模系统开发；
4、跟踪行业最新技术动态，为公司的AI芯片多卡互联技术发展提供前瞻性的建议和技术储备。

岗位要求：
1、深入理解深度学习框架和软件栈；
2、熟悉GPGPU、ASIC NPU的硬件架构；
3、熟悉LLM和AIGC分布式部署训练方案，了解多层级卡间互联拓扑结构；
4、有主动学习、快速解决问题的能力和自我驱动力；
5、较强的C++、Python Coding能力。


以下为加分项：
1、有LLM、AIGC类模型的业务对接经验，熟悉多机多卡分布式训练和部署；
2、了解硬件多层次存储层级、同构和异构计算单元原理；
3、了解硬件片上NOC和片间互联通信协议等；
4、有MLI、LLVM或者PyTorch开发经验；
5、有GPU、FPGA或AI芯片相关的开发和评测经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.790446+00'::timestamptz,'7530588804206971144') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI应用平台高级产品经理-AI Platform',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7532121285296867602/detail','岗位名称：AI应用平台高级产品经理-AI Platform

岗位职责：
1、负责大模型应用平台相关的产品规划和设计，包括需求调研、用户场景分析、行业趋势研究、产品设计与优化等；
2、与应用开发者、社区紧密沟通，深入理解用户需求和市场动态，设计具有竞争力的AI产品方案；
3、与研发团队保持紧密合作，协调组织设计、开发、测试资源，推动产品发布和项目落地；
4、跟踪产品关键数据指标，收集用户反馈，优化产品体验，确保产品持续满足市场需求；
5、对产品竞争力和商业价值负责，跟进行业发展动态，推动技术与业务结合的创新落地。

岗位要求：
1、本科及以上学历，计算机、人工智能、软件工程、数据科学等相关专业背景优先；
2、熟悉大语言模型（LLM）、Prompt设计及优化、Agent技术及其核心原理，了解其在代码领域的应用潜力及技术边界者优先；
3、具备优秀的逻辑思维能力、自主学习意识和跨部门沟通协调能力；
4、具有创业精神，价值观正，能够在多变的环境中高效完成工作；
5、对AI技术及其应用场景有浓厚的兴趣、敏锐的洞察力，具备快速理解和掌握新技术的能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.883204+00'::timestamptz,'7532121285296867602') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI数据资源开发与管理运营-AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7532483475552143623/detail','岗位名称：AI数据资源开发与管理运营-AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、AI训练数据市场调研与资源开发：
1）深度对接AI模型训练业务需求，全面梳理模型训练所需数据类型、数据标准及核心需求，开展系统性的行业与数据市场调研，精准把握AI数据行业发展趋势、市场格局、技术迭代及行业动态，获取一手市场信息；
2）依托市场调研结果，开展高质量数据资源开发工作，定向挖掘、拓展初创企业及优质数据供应商，搭建高效的供应商筛选与评估体系，精准对接匹配公司模型训练需求的优质数据资源，完成供应商资源拓展与引入，持续丰富公司优质供应商库，构建完善的AI数据供应商生态；
3）具备强策略性思维，对市场调研信息、供应商资源信息、行业数据进行深度策略性分析，提炼核心行业洞察与数据资源洞察，形成专业的分析报告，为公司AI模型训练、数据采购及业务布局提供决策支撑；
4）持续跟踪市场优质数据资源及潜在合作方，维护市场资源渠道，保持与市场一线的紧密连接，保障公司数据资源的前瞻性与优质性；
2、供应商落地交付与全生命周期管理：
1）负责新开发供应商的项目落地推进，组织开展供应商测试、资质审核及能力验证，确保供应商符合公司项目交付标准，推动供应商顺利接入内部项目，完成从资源开发到项目落地的全流程衔接；
2）主导供应商商务全流程工作，包括合同谈判、条款拟定、成本管控及合规审核，在保障公司利益的前提下，达成高效、合规的商务合作，优化合作条款与合作模式；
3）负责供应商项目交付管理，对接内外部需求方，针对需求清晰/模糊、沟通难度不同的各类需求方，高效完成需求梳理、沟通协调，做好内外部预期管理，推动供应商按项目要求完成数据交付，保障项目交付进度与交付质量，助力公司整体交付目标达成；
4）开展供应商关系日常维护与管理，建立长期稳定的合作关系，定期对供应商履约情况、服务质量、交付能力进行复盘与评估，优化供应商管理体系；同时基于供应商合作数据、交付数据开展数据分析工作，输出供应商管理与项目交付分析报告，持续提升供应商管理效率与合作价值。

岗位要求：
1、本科及以上学历，市场营销、商务管理、数据分析、人工智能、计算机相关专业优先，有AI数据行业相关学习或背景者可放宽；
2、2年及以上AI数据服务、数据资源开发、供应商拓展、商务谈判相关工作经验；熟悉AI模型训练数据市场，了解市场主流数据类型、供应商类型及行业资源分布者优先；有AI数据公司工作经验者优先；
3、具备策略性思维，能独立开展市场调研、行业分析，快速提炼有效洞察，具备优秀的逻辑分析、信息整合与问题解决能力；
4、拥有出色的供应商挖掘、渠道拓展能力，具备丰富的商务拓展经验，能快速对接优质资源，精准匹配公司业务需求，学习能力强，可快速适配新行业、新需求；
5、具备优秀的沟通表达、谈判与人际协调能力，能高效对接内外部多方主体，灵活处理各类沟通场景，做好需求与预期管理，应对复杂沟通与需求对接工作；
6、具备基础的项目管理思维，能合理规划供应商落地、项目交付全流程，把控交付进度、质量与风险，保障项目顺利落地；具备基础的数据整理、分析与报告撰写能力，能通过数据挖掘问题、优化工作流程；头脑灵活、悟性高，具备执行力，做事严谨细致、有责任心，具备良好的团队协作意识与商业敏感度。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.575773+00'::timestamptz,'7532483475552143623') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','硬件加速测试开发工程师-AI工具链',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7533604800278169864/detail','岗位名称：硬件加速测试开发工程师-AI工具链

岗位职责：
1、参与AI芯片编译器工具链测试开发工作；参与编译器工具链测试方法设计、测试系统搭建和测试开发工作；参与编译器性能优化验证工作；
2、协同开发团队建立编译器验证机制和评价标准；
3、参与推理模型性能、精度日常测试执行、问题跟踪工作；
4、参与设计、建立以及推动AI芯片软件质量持续提升流程；
5、参与AI芯片整体软件栈质量流程建设，对软件开发的质量进行监控和追踪；
6、参与开发和运维AI芯片云服务基础设施和分布式系统（包含K8S集群、CI/CD系统、工作流系统、追踪探测系统等），为业务提供高可用、高稳定、高性能、低成本的云服务。

岗位要求：
1、本科及以上学历，计算机科学/电子工程相关专业；1年以上软件开发及测试工作经验，有AI芯片软件栈测试相关经验者优先；
2、熟练掌握汇编，C/C++，Python，Go，Shell等一种或者多种语言；
3、了解主流平台开发技术和体系（React，Vue，Nodejs，Python，Go等）；了解云原生相关技术（K8S，微服务、GitOps、DevOps等）；了解深度学习相关算子和优化技术；
4、了解Tvm或者Mlir等构建第三代深度学习框架的技术；了解图优化和算子融合等优化技术；
5、熟悉AI计算架构以及优化有经验者优先；熟练操作Linux系统，有在Unix/Linux环境下工作经验；
6、工作务实、敬业，有强烈的责任意识，具备较强的领导能力，以及良好的沟通及协调能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:55.48245+00'::timestamptz,'7533604800278169864') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI数据策略专家（视频通话方向）-AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7535909870736066834/detail','岗位名称：AI数据策略专家（视频通话方向）-AI数据与安全

岗位职责：
1、深入理解AI大模型视频通话场景，负责多模态对话、联网、Function Call等方向的数据采集、标注、质检与策略运营工作；
2、与产品研发团队紧密配合，快速沉淀多模态大模型数据理想态和标准，积极为模型后训练（Post-train）提供数据策略和建议；
3、针对模型突出问题进行专项攻坚，通过设计PE策略、Workflow工作流等，探索更高效的数据生产方式。

岗位要求：
1、本科及以上学历，汉语言文学、新闻、戏剧影视文学、心理学等相关语言类专业，有文理跨学科背景优先；
2、共情能力强，有较好的语感、听感和语言把控能力，对视频、图像理解有较好认知；
3、对多模态大模型有基础认知，具备大模型产品、产品运营、AI训练师等相关工作经验优先；
4、具备出色的提示词工程能力，拥有Agent搭建和迭代经验；掌握大模型SFT、RM、RL训练知识，了解Function Call和联网，有Python等代码能力者加分；
5、对AI有高度热情，做事靠谱，有很强的自驱力和学习能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.680629+00'::timestamptz,'7535909870736066834') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理（AI创新产品）（杭州/北京） - 飞书 AI Friendly',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7541286487729113352/detail','岗位名称：AI产品经理（AI创新产品）（杭州/北京） - 飞书 AI Friendly

岗位职责：
团队介绍：飞书 AI Friendly 方向致力于探索和建设面向 AI 时代的新一代协作平台，让飞书不仅是人高效工作的地方，也成为人与 AI Agent 自然协作的工作空间。
我们重点关注两个方向：一方面，让 AI 能够更好地理解和使用飞书。 另一方面，探索人与 AI Agent 共同协作的新范式。 我们希望通过产品、技术与交互体验的持续创新，推动协作工具从“承载人的工作”进一步演进为“支持人与 AI 共同完成工作的智能协作平台”。

1、对“未来人xAgent协作长什么样”提出自己的判断，把它变成原型；
2、在协作场景里，设计并验证新的交互范式；
3、推动从概念到原型到产品的完整落地，从0到1把想法做成真东西；
4、自己就是最重度的用户，每天用，在使用中发现问题、校准方向；
5、参与团队任何你感兴趣的事，设计、开发、运营，不设边界。

岗位要求：
1、对未来人机协作办公有充分思考，你看过大量材料、想过很多轮，有自己的判断，不是跟风做AI；
2、AI办公的深度实践者，试过市面上绝大部分AI办公新产品、用过，能分辨“真在做事”和“只是Demo”，自己的工作流里AI已经是主角；
3、有主人翁意识，在只有目标、没有明确任务的情况下，也能主动承担责任，激进地拿结果；
4、对全球市场、跨文化办公场景有自己的感受。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.740465+00'::timestamptz,'7541286487729113352') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理（达人成长方向） - 抖音电商',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7541315240814823698/detail','岗位名称：AI产品经理（达人成长方向） - 抖音电商

岗位职责：
团队介绍：抖音电商致力于成为用户发现丰富好物的首选平台。众多抖音创作者通过短视频、直播、商城等丰富的形式，给用户提供更个性化、更生动、更高效的消费体验。同时，抖音电商积极引入优质合作伙伴，为商家变现提供多元的选择。

1、深入理解抖音电商达人经营链路，围绕达人冷启动、成长、升级，梳理核心场景，识别关键决策点、提效点和增长机会；
2、负责Agent在达人经营方向的产品规划与落地，建设懂业务、能主动服务的达人成长经纪人，帮助达人提升经营效率和带货结果；设计并推进达人经营场景下的Agent基建与Skill能力，包括经营诊断、选品推荐、内容创意、直播策略、成长规划、合作复盘等方向，做好主Agent、业务Skill、记忆、知识库等能力串联，提升达人经营工作流的自动化和智能化水平；
3、建立产品目标、评估体系和迭代机制，验证AI能力对达人经营结果的真实增量，并通过AB实验量化收益；
4、与算法、工程、运营、达人业务团队协作，推动业务知识接入、成长策略沉淀、模型训练数据闭环、专家评测与后验评估，持续提升Agent和Skill的准确性与规模化效果；
5、优化达人侧AI产品交互体验，推动多端入口整合、多模态表达和更具人感的容器体验建设，提升使用意愿和深度。

岗位要求：
1、有电商业务产品经验，理解电商业务场景下，达人的经营痛点；
2、有AI经营工具相关经验，熟悉Agent能力落地全链路；
3、有创造力、协作力，对AIGC方向有激情，能协同所有上下游团队，结果导向做出前沿产品。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:57.636194+00'::timestamptz,'7541315240814823698') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','大模型算法工程师（AI应用）-Data AML',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7543479798136457480/detail','岗位名称：大模型算法工程师（AI应用）-Data AML

岗位职责：
1、打造行业领先的大模型Context Engineering产品，包含向量库/知识库/记忆库等原子产品优化，在Agent Memory/参数化压缩/多模态/自进化等方向，通过模型侧优化创新提升产品竞争力；
2、探索行业领先的AI搜索/AI推荐/AI问答产品；推进数据合成，模型后训练等方案，提高模型通用能力和业务场景表现；
3、跟进学术界和工业界大模型相关技术进展，聚焦模型和底层创新，探索相关技术在业务应用。

岗位要求：
1、计算机相关专业本科及以上学历，有相关方向技术和研究背景的候选人优先；
2、优秀的代码能力，熟悉PyTorch/TensorFlow等主流深度学习算法框架；
3、有领域顶级会议文章(ACL、EMNLP、NeurIPS、ICML、ICLR、CVPR、ICCV、KDD等)、有编程/AI比赛获奖（ACM/ICPC、NOI/IOI、Top Coder、Kaggle等）优先；
4、熟悉大模型相关技术（RL算法、Agent、多模态等），在大模型领域主导参与过大影响力的项目者优；
5、对新技术充满热情，具有较强的学习能力，出色的独立分析和解决问题的能力，能深入解决大模型优化和应用存在的问题。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.834143+00'::timestamptz,'7543479798136457480') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','语音大模型数据专家（中文方向） - AI数据与安全',NULL,'上海 / 北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7584708211643828533/detail','岗位名称：语音大模型数据专家（中文方向） - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、深度参与语音大模型的构建，搭建具有通用性和扩展性的大模型数据生产、评测体系，与产品算法团队协同完成TTS方向的自研探索与业务落地；
2、端到端语音大模型评测体系建设，设计模型优化、敏感业务场景适配的评测方案与流程，建设并管理科学、敏捷的评测Pipeline，为模型效果提升提供有价值的优化方向与反馈；
3、深度理解对话交互、音视频创作及To B业务及市场动态，设计与业务目标贴合的数据与评测方案，为业务效果突破提供专业的策略与建议，高效推进业务目标达成；
4、统筹标注团队，主导中文/方言数据生产、预处理、标注、校验全链路推进，解决不同方言在表达习惯上的差异化问题；以数据质量与生产效率为导向，通过PE&Agent等形式完成数据清洗与分析，推动项目目标达成。

岗位要求：
1、本科及以上学历，语言学、语音学、计算语言学、语用学、心理学、汉语言等相关专业优先；
2、1年以上语音数据相关工作经验（语音合成-中文方言优先），熟悉音视频创作、智能语音交互场景，有大语言模型相关的科研项目或工作经历者优先；
3、具备出色的PE能力，能够独立设计Prompt策略形成工作流，提高数据生产的质量和效率，具备良好的数据分析能力，能够从复杂数据中提炼关键信息为决策提供依据；
4、具备良好的沟通能力和文档撰写能力，能够清晰地表达观点和撰写专业报告；有较强的学习能力，能够快速掌握新知识、新技能，适应快速发展的行业环境。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.852+00'::timestamptz,'7584708211643828533') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','硬件加速软硬件联合设计验证工程师-AI芯片',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7585531021968722181/detail','岗位名称：硬件加速软硬件联合设计验证工程师-AI芯片

岗位职责：
1、参与AI芯片的业务场景分析和性能分析；
2、使用C语言实现算子Kernel来验证硬件各模块的功能和性能，评估芯片是否满足业务场景需求。

岗位要求：
1、计算机科学/电子工程等相关专业，精通C/C++编程语言；
2、计算机专业基础扎实，熟悉计算机体系结构、常用数据结构与算法；
3、了解大模型训练和推理部署者优先；
4、有NPU算子库开发经验者优先；
5、对新技术充满热情，能够快速在新的领域进行开拓并输出结果；
6、团队沟通协作能力强。

加分项
1、熟悉GPU和NPU体系结构和常见异构编程模型；
2、了解IC实现细节；
3、有AI相关基础知识；
4、熟悉Python语言。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.900663+00'::timestamptz,'7585531021968722181') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','硬件加速软硬件联合设计验证工程师-AI芯片',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7585531385096685829/detail','岗位名称：硬件加速软硬件联合设计验证工程师-AI芯片

岗位职责：
1、参与AI芯片的业务场景分析和性能分析；
2、使用C语言实现算子Kernel来验证硬件各模块的功能和性能，评估芯片是否满足业务场景需求。

岗位要求：
1、计算机科学/电子工程等相关专业，精通C/C++编程语言；
2、计算机专业基础扎实，熟悉计算机体系结构、常用数据结构与算法；
3、了解大模型训练和推理部署者优先；
4、有NPU算子库开发经验者优先；
5、对新技术充满热情，能够快速在新的领域进行开拓并输出结果；
6、团队沟通协作能力强。

加分项
1、熟悉GPU和NPU体系结构和常见异构编程模型；
2、了解IC实现细节；
3、有AI相关基础知识；
4、熟悉Python语言。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.892512+00'::timestamptz,'7585531385096685829') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI数据运营专家（ToB Agent方向） - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7591794384681978165/detail','岗位名称：AI数据运营专家（ToB Agent方向） - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、深入理解AI大模型，产出在Agent、Coding等方面相关的高质量数据，分析Rubric、环境、轨迹等方面的问题，输出分析报告；
2、与产品研发团队进行沟通协作，参与业务场景定义、数据标准制定、标注策略迭代；运营数据团队推进优化专项，为数据生产流程提效和交付质量负责；
3、能通过代码和Prompt Engineering，完成数据挖掘、预处理、数据分析、链路、Agent搭建等任务，自动化构建训练集和评测集，同时探索AI行业新的知识与工具，为业务带来新的思路和方法，并在业务中实践落实；
4、针对大模型的突出问题，与产品、算法、标注、评估等团队合作进行专项攻坚。

岗位要求：
1、本科及以上学历，计算机相关专业优先，有开发经验优先；
2、熟练掌握2种及以上主流编程语言，能够独立阅读主流代码逻辑及报错日志，高频使用AI开发工具，如TRAE/Claude Code/Cursor；
3、精通提示词工程，能优化Prompt解决不同类型的任务需求，理解Agent实现原理，有实际搭建工作流/Agent经验；
4、了解机器学习/人工智能/模型调优，熟悉各种算法的基本概念，有模型优化/评估相关经验者优先；
5、对AI有高度热情，有较强的自驱、学习、沟通能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.594354+00'::timestamptz,'7591794384681978165') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','LLM/VLM模型训练产品经理-AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7594374632452819205/detail','岗位名称：LLM/VLM模型训练产品经理-AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、模型分析：锚定模型训练目标，围绕训练目标开展深度挖掘分析，梳理问题并给出建议；通过研究用户行为与反馈，明确自研LLM/VLM的改进空间及对应改进手段；
2、数据策略制定：基于模型训练方法与需求，制定并迭代涵盖合成数据的整体数据构建策略，同步调研市场数据新趋势，为策略优化提供支撑；
3、数据产线搭建：锚定模型训练目标，设计数据生产链路及核心步骤，发起项目并主导全流程设计、优先级判定及项目管理，保障高效产出高质量数据；
4、模式创新：依托大模型赋能生产，搭建自动化数据生产系统，实现提效与规模化。

岗位要求：
1、1年及以上AI产品工作经验，具备LLM/VLM训练数据生产、评估经验；
2、通过对模型评测、负面案例和海量训练数据的深度分析，从数据视角定位模型缺陷，提出并推动有效的优化策略；
3、对AI行业有好奇心，熟练使用AI工具，能主动追踪前沿技术动态、大模型产品动态；
4、具备系统思维和抽象能力，能结合复杂的规则设计数据生产、评估和处理链路；
5、英语听说读写熟练，可与国际化供应商、国际化团队沟通；
6、具备较强的跨团队协作与项目推进能力，重视数据质量，兼具责任心与大局观。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.612138+00'::timestamptz,'7594374632452819205') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','增长产品经理（AI方向）-飞书（北京/杭州/上海）',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7595477153920141573/detail','岗位名称：增长产品经理（AI方向）-飞书（北京/杭州/上海）

岗位职责：
1、负责制定并实施以AI原生为核心的PLG与CLG混合增长策略，构建可规模化的增长循环；
2、将飞书AI产品的技术能力，通过极具感染力的用户语言和案例，向中国企业市场进行价值传播与推广，输出“先进工作方式”；
3、运用AI工具与深度分析能力，从海量用户数据与反馈中挖掘增长瓶颈与突破机会，提出可落地的解决方案；
4、保持创业精神，主动探索新场景、新渠道，通过快速MVP实验验证机会，并推动其规模化复制。

岗位要求：
1、本科及以上学历，具备2年以上To B SaaS或工具类产品增长经验；
2、将AI与Agent作为核心工作伙伴，熟练运用其构建自动化工作流、解决复杂问题；
3、在AI产品场景下，具备通过社区和产品自身力量驱动增长的实际操盘与策略制定能力；
4、具备面对复杂信息时，能快速筛选关键信息、结构化思考、挖掘本质并快速学习新领域的能力；
5、有自驱力、责任感，能在不确定场景主动定义问题、整合资源、验证机会并推动规模化。

加分项
1、具备AI产品经理经验；
2、具备开发者工具背景；
3、早期创业公司核心成员经历。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.855127+00'::timestamptz,'7595477153920141573') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包AI大模型应用策略产品经理-火山方舟MaaS',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7597278236465203461/detail','岗位名称：豆包AI大模型应用策略产品经理-火山方舟MaaS

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、负责知识库检索、向量召回、记忆管理在应用场景下的评测体系构建，能客观、准确、全面地评估能力表现并驱动优化，产出评估报告；
2、持续迭代/完善评估体系，包括但不限于评估方法论、标准、Benchmark、评测数据集、工具平台的设计和迭代等，对产出质量和优化效果负责；
3、主动挖掘客户需求、主动进行线上AB/用户数据/评估报告分析，发现召回、相关性、记忆一致性等方面的潜在问题与机会，给出数据支持、分析报告和优化方案建议；
4、与算法、工程、数据标注团队紧密协作，定义数据生产任务和标准，并进行有效性验证。

岗位要求：
1、本科及以上学历，有3-5年策略/数据分析产品经验或AI大模型经验，有向量数据库、RAG、搜索推荐等相关产品经历者优先；
2、逻辑性强，对数据变化敏感，热爱用数据去衡量和表达，快速定位问题、提出优化方法、设计合理的验证方案；
3、理解LLM和RAG的基本原理，了解Embedding、向量检索、重排序、记忆机制等技术，关注行业前沿动态；
4、具备良好自我驱动力，结果导向，优秀的沟通和项目协调能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.892978+00'::timestamptz,'7597278236465203461') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','智能模型数据平台工程师-AI Data',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7605137988865771781/detail','岗位名称：智能模型数据平台工程师-AI Data

岗位职责：
1、围绕Seed大模型数据全生命周期，建设Seed大模型海量数据的管理/生产/消费/质量的统一平台，提升大模型数据全生命周期的使用效率与质量，赋能算法预训练、SFT/RLHF等场景；
2、构建大模型领域的Data Agent，重构AI-Native的数据平台范式；
3、协同基础架构/云平台团队，搭建稳定高效的底层数据基础设施（数据湖、对象存储、分布式计算、大规模数据检索、数据血缘系统，调度引擎，算力平台等）；
4、主导技术选型与架构优化，基于Spark/Flink/Ray、湖仓一体、向量数据库，调度引擎等技术栈，构建高吞吐、高容错、可扩展的处理存储能力，支撑日PB级数据处理。

岗位要求：
1、本科及以上学历，计算机相关专业；
2、精通Python、Java、Go等至少一种编程语言，有服务端开发经验，具备良好的编码能力和代码质量意识；
3、至少精通以下引擎/架构之一：Spark/Flink/Ray等大数据处理引擎，Hudi/Iceberg/Paimon等数据湖，及Doris/ClickHouse等OLAP引擎，PyTorch/TensorFlow等机器学习框架，索引与搜索架构；在线上有实践经验，有源码阅读经验，有引擎二次开发经验优先；
4、对业务敏感，能快速理解业务背景，具备优秀的技术与业务结合能力，有较好的需求抽象能力和架构能力；学习能力强，能够快速学习完全没有涉猎过的新技术，并快速应用于工程实践。

加分项：
1、大数据平台生产与管理开发经验；
2、大模型数据抓取、加工，合成应用于预训练、SFT/RLHF的实践经验；
3、Agent项目开发经验，了解当前Agent架构实践；
4、良好的AI Coding实践者，有将Harness Engineering应用于实际开发工作经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.876138+00'::timestamptz,'7605137988865771781') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI技术运营专家-TikTok',NULL,'上海 / 北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7616238832214296837/detail','岗位名称：AI技术运营专家-TikTok

岗位职责：
1、利用AI工具快速搭建、定制或优化轻量级工具与工作流程，支持数据标注生产上下游业务场景，提升整体生产效率与协作效率；
2、深入业务流程，主动识别效率瓶颈与重复性人工操作，借助AI编程工具（如Cursor、Copilot等）设计并实现解决方案，尽可能独立完成从需求定义到工具交付的全流程；
3、通过业务与平台数据监控、用户反馈收集与分析，持续优化数据生产流程、内部工具及平台能力；
4、总结并沉淀AI工具在业务场景中的应用方法与最佳实践，推动相关能力在团队内部的推广与赋能。

岗位要求：
1、本科及以上学历，熟悉模型训练相关的数据标注流程与实践；
2、具备Prompt Engineering能力，能够独立设计Prompt策略形成工作流，提高数据生产的质量和效率；
3、学习能力强，具备问题拆解与抽象能力以及快速原型能力；
4、英语可作为工作语言。

加分项
1、计算机科学或工程相关专业背景；
2、有AI应用落地或AI项目实施经验者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.762497+00'::timestamptz,'7616238832214296837') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Friendly产品工程师-飞书（杭州/北京/上海/深圳）',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7621106746497304837/detail','岗位名称：AI Friendly产品工程师-飞书（杭州/北京/上海/深圳）

岗位职责：
1、设计并推进飞书业务模块的AI Agent Friendly改造，定义高价值场景，输出改造方案并推动落地；
2、与研发、产品、架构团队深度协同，推动关键开放能力（API/MCP/CLI/Skill/SDK）的交付；
3、以AI Agent和开发者视角定义并提升开放能力的易用性、语义清晰度、可组合性与可扩展性；
4、梳理业务域安全边界，明确高敏感数据和高风险操作的默认策略与兜底方案；
5、持续跟踪AI领域世界最新技术和实践，保持对前沿模型和工具的一手体感和认知。

岗位要求：
1、能从开发者视角判断API/工具的设计优劣，具备一定的产品意识；
2、是OpenClaw/Claude等AI Agent工具的深度用户，通晓架构和技术原理；
3、在开源社区有产出，具备代码与架构理解力，开源开发者优先；
4、拥有高质量的个人作品集（开源项目、独立产品、AI工具、插件等）优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.918536+00'::timestamptz,'7621106746497304837') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent开发工程师-抖音（杭州）',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7624039934207707445/detail','岗位名称：AI Agent开发工程师-抖音（杭州）

岗位职责：
1、负责抖音智创AIGC特效链路的核心服务开发与优化，参与Multi-Agent协作系统设计，打造高可用的后端系统；
2、设计和实现基于LLM的智能体核心架构，包括任务规划、对话管理、意图识别和流程工程；
3、打造任务管理和排队系统，提升资源利用率和用户体验；
4、开发和优化效果RAG库，提升模型在特效领域的专业表现和知识理解能力；
5、参与抖音智创AIGC投稿链路的数据开发工作，包括性能监控、成本优化及数据解决方案提供，应用数据开发、分析、挖掘等技术提升数据使用效率。

岗位要求：
1、精通Python、Go、SQL编程语言，具备丰富的服务端开发领域经验和优秀的架构能力，有系统设计和开发经验；
2、对语言大模型、多模态大模型、Agent技术以及大模型的部署流程有基本的了解和认识；
3、熟悉RAG技术实现原理，能够设计和优化知识检索系统；
4、深入理解AI Agent技术栈，熟练掌握主流智能体开发框架，具备LangChain等框架的实战经验，能够构建可扩展的智能体系统；
5、有强烈的学习欲望，对新技术抱有足够热情和好奇心，热爱AI技术。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.883459+00'::timestamptz,'7624039934207707445') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent开发工程师-抖音（上海）',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7624040260628531509/detail','岗位名称：AI Agent开发工程师-抖音（上海）

岗位职责：
1、负责抖音智创AIGC特效链路的服务开发与优化，参与Multi-Agent协作系统设计，打造高可用的后端系统；
2、设计和实现基于LLM的智能体架构，包括任务规划、对话管理、意图识别和流程工程；
3、打造任务管理和排队系统，提升资源利用率和用户体验；
4、开发和优化效果RAG库，提升模型在特效领域的专业表现和知识理解能力；
5、参与抖音智创AIGC投稿链路的数据开发工作，包括性能监控、成本优化及数据解决方案设计，应用数据开发、分析、挖掘等技术提升数据使用效率。

岗位要求：
1、精通Python、Go、SQL编程语言，具备丰富的服务端开发领域经验和优秀的架构能力，有系统设计和开发经验；
2、对语言大模型、多模态大模型、Agent技术以及大模型的部署流程有基本的了解和认识；
3、熟悉RAG技术实现原理，能够设计和优化知识检索系统；
4、深入理解AI Agent技术栈，熟练掌握主流智能体开发框架，具备LangChain等框架的实战经验，能够构建可扩展的智能体系统；
5、有强烈的学习欲望，对新技术抱有足够热情和好奇心，热爱AI技术。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.832583+00'::timestamptz,'7624040260628531509') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI研发效能工程师-AI Data',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7625857499200768261/detail','岗位名称：AI研发效能工程师-AI Data

岗位职责：
1、负责AI提效相关工作的设计、开发和落地，围绕组织效率提升、研发方式升级和AI-Native工作模式建设，推动关键项目形成可复用、可推广的实践；
2、负责AI Coding方向的工程化落地，推进代码生成、测试辅助、代码评审、研发协同等能力进入真实研发流程，推动Harness Engineering等前沿实践沉淀为团队级方法论和工程标准；
3、负责AI Agent方向的探索与落地，推动OpenClaw等Agent框架在办公、研发、协同等场景中的实际应用，推进数字员工方案从Demo走向稳定运行；
4、负责相关能力的平台化与治理建设，明确协作机制、权限控制、风险治理、效果评估与可观测性要求，保障能力可用、可信、可规模化推广；
5、结合实际业务场景，持续优化AI能力接入方式、Workflow设计和系统稳定性，推动AI能力在真实环境中长期发挥价值。

岗位要求：
1、有AI Engineering、研发效能、工程平台、自动化工作流或相关方向的实践经验，能够独立推进功能落地与方案实现；
2、具备扎实的工程能力，有AI Coding工程化实践经验优先；有AI Agent、自动化工作流、数字员工或企业级协同系统相关实践经验优先；
3、对AI前沿方向有深刻理解，尤其对AI Coding、Agent、模型能力演进等方向保持持续关注，能够结合业务场景完成技术选型与落地实现；
4、具备良好的工程化思维，能够将快速变化的AI能力转化为稳定、可维护、可扩展的工程方案；
5、有较强的问题拆解与协同推进能力，能够在复杂场景下与产品、业务、平台、研发等角色高效协作；
6、对新技术保持好奇心和执行力，愿意持续学习并推动AI能力在组织中的真实落地。

加分项：
1、有Harness Engineering、Agent平台、企业级AI工作流、数字员工体系等相关实践经验；
2、有OpenClaw、Copilot类产品、Code Agent、自动化协同系统等实际落地经验；
3、持续关注并输出AI前沿趋势判断、实践总结或方法论沉淀。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.538239+00'::timestamptz,'7625857499200768261') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI研发效能工程师-AI Data',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7625858654604478773/detail','岗位名称：AI研发效能工程师-AI Data

岗位职责：
1、负责AI提效相关工作的设计、开发和落地，围绕组织效率提升、研发方式升级和AI-Native工作模式建设，推动关键项目形成可复用、可推广的实践；
2、负责AI Coding方向的工程化落地，推进代码生成、测试辅助、代码评审、研发协同等能力进入真实研发流程，推动Harness Engineering等前沿实践沉淀为团队级方法论和工程标准；
3、负责AI Agent方向的探索与落地，推动OpenClaw等Agent框架在办公、研发、协同等场景中的实际应用，推进数字员工方案从Demo走向稳定运行；
4、负责相关能力的平台化与治理建设，明确协作机制、权限控制、风险治理、效果评估与可观测性要求，保障能力可用、可信、可规模化推广；
5、结合实际业务场景，持续优化AI能力接入方式、Workflow设计和系统稳定性，推动AI能力在真实环境中长期发挥价值。

岗位要求：
1、有AI Engineering、研发效能、工程平台、自动化工作流或相关方向的实践经验，能够独立推进功能落地与方案实现；
2、具备扎实的工程能力，有AI Coding工程化实践经验优先；有AI Agent、自动化工作流、数字员工或企业级协同系统相关实践经验优先；
3、对AI前沿方向有深刻理解，尤其对AI Coding、Agent、模型能力演进等方向保持持续关注，能够结合业务场景完成技术选型与落地实现；
4、具备良好的工程化思维，能够将快速变化的AI能力转化为稳定、可维护、可扩展的工程方案；
5、有较强的问题拆解与协同推进能力，能够在复杂场景下与产品、业务、平台、研发等角色高效协作；
6、对新技术保持好奇心和执行力，愿意持续学习并推动AI能力在组织中的真实落地。

加分项：
1、有Harness Engineering、Agent平台、企业级AI工作流、数字员工体系等相关实践经验；
2、有OpenClaw、Copilot类产品、Code Agent、自动化协同系统等实际落地经验；
3、持续关注并输出AI前沿趋势判断、实践总结或方法论沉淀。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.516086+00'::timestamptz,'7625858654604478773') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI研发效能工程师-AI Data',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7625858990787578117/detail','岗位名称：AI研发效能工程师-AI Data

岗位职责：
1、负责AI提效相关工作的设计、开发和落地，围绕组织效率提升、研发方式升级和AI-Native工作模式建设，推动关键项目形成可复用、可推广的实践；
2、负责AI Coding方向的工程化落地，推进代码生成、测试辅助、代码评审、研发协同等能力进入真实研发流程，推动Harness Engineering等前沿实践沉淀为团队级方法论和工程标准；
3、负责AI Agent方向的探索与落地，推动OpenClaw等Agent框架在办公、研发、协同等场景中的实际应用，推进数字员工方案从Demo走向稳定运行；
4、负责相关能力的平台化与治理建设，明确协作机制、权限控制、风险治理、效果评估与可观测性要求，保障能力可用、可信、可规模化推广；
5、结合实际业务场景，持续优化AI能力接入方式、Workflow设计和系统稳定性，推动AI能力在真实环境中长期发挥价值。

岗位要求：
1、有AI Engineering、研发效能、工程平台、自动化工作流或相关方向的实践经验，能够独立推进功能落地与方案实现；
2、具备扎实的工程能力，有AI Coding工程化实践经验优先；有AI Agent、自动化工作流、数字员工或企业级协同系统相关实践经验优先；
3、对AI前沿方向有深刻理解，尤其对AI Coding、Agent、模型能力演进等方向保持持续关注，能够结合业务场景完成技术选型与落地实现；
4、具备良好的工程化思维，能够将快速变化的AI能力转化为稳定、可维护、可扩展的工程方案；
5、有较强的问题拆解与协同推进能力，能够在复杂场景下与产品、业务、平台、研发等角色高效协作；
6、对新技术保持好奇心和执行力，愿意持续学习并推动AI能力在组织中的真实落地。

加分项：
1、有Harness Engineering、Agent平台、企业级AI工作流、数字员工体系等相关实践经验；
2、有OpenClaw、Copilot类产品、Code Agent、自动化协同系统等实际落地经验；
3、持续关注并输出AI前沿趋势判断、实践总结或方法论沉淀。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.704561+00'::timestamptz,'7625858990787578117') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理（B端）-抖音生活服务',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7626381123106883893/detail','岗位名称：AI产品经理（B端）-抖音生活服务

岗位职责：
1、参与建设面向百万级生活服务商家的AI经营体系，围绕商家GMV增长目标，抽象生活服务经营策略，设计商家经营全托管模式产品方案，推动生活服务从“经验驱动经营”到“AI驱动经营”的行业变革；
2、深度参与AI经营产品建设，自主发掘AI能力在商家全经营场景中的可落地点，逐步实现商家工具的全AI化、商家线上经营链路的自动化与智能化，包括但不限于智能组品、营销托管、店铺运营、私域运营和内容素材生成等，在数百万商家日常经营中落地，并验证产品对商家经营效果的提升作用；
3、将持续跟踪并推动大模型、Agent、AIGC、RL等前沿AI能力在商业经营场景中的落地，在AI能力快速演进的背景下，探索更高阶的产品形态（如Agent自动决策、托管执行、自动探索实时调优等），推动AI从“辅助工具”向“经营执行者”甚至“经营决策者”演进；
4、搭建并完善数据评估及决策自调整体系，通过数据驱动策略自动迭代，让AI能力真正成为商家增长引擎；
5、与各业务部门、算法、工程、运营等多团队紧密协作，在复杂且快速变化的业务与技术环境中，通过持续学习与实践，形成对“AI+商业经营应用”的系统性认知，沉淀可复用的方法论与产品能力。

岗位要求：
1、本科及以上学历，2年及以上To B产品经验，有平台型或复杂系统产品经验优先，能够在复杂协同的环境中推进产品落地；
2、对AI方向（大模型/Agent/AIGC等）有实际经验或强烈兴趣，认同AI将在未来深度改变商业经营方式，并愿意长期投入；
3、对商家经营、本地生活、电商等业务场景有一定理解，具备优秀结构化思考能力，能够将复杂的商家经营问题拆解为清晰的产品模块，并抽象为可规模化能力；
4、具备良好的数据分析能力，能够从数据中发现问题、验证假设并驱动产品决策与优化；
5、有较强的跨团队协作与推动能力，能够在不确定性高、路径不完全清晰的情况下推动项目持续向前；
6、自驱力强，结果导向，能够在从0到1及规模化阶段中承担核心角色，并从中获得快速成长。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.771854+00'::timestamptz,'7626381123106883893') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理-抖音生活服务',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7627117718337308981/detail','岗位名称：AI产品经理-抖音生活服务

岗位职责：
1、负责抖音生活服务场景下AI产品的规划与落地，结合业务发展目标与行业趋势，挖掘商家、服务商及内部业务团队在经营、营销、销售转化等环节的智能化需求，输出清晰的产品方案并推动实施；搭建AI产品从需求洞察、方案设计、上线推广到效果复盘的完整闭环，推动产品实现从0到1、再到规模化复制，持续提升产品竞争力；
2、深度协同业务、运营、研发、算法、设计等团队，推进AI产品能力建设与持续迭代，围绕多场景应用不断优化产品功能、交互体验和使用效果，提升产品渗透率、用户活跃度及业务价值；
3、独立负责业务场景的Prompt撰写、测试与调优，完成AI应用全流程Workflow搭建与编排，保障AI服务的可用性与效果；
4、深入理解商家经营链路与销售作业场景，推动AI产品在客户建联、线索转化、经营提效、服务支持等场景中的应用落地，帮助业务和客户实现效率提升与价值增长；基于数据分析、用户反馈和业务调研，持续识别关键问题与增长机会，沉淀可复用的产品方法论和解决方案，驱动AI产品在生活服务领域的长期发展。

岗位要求：
1、本科及以上学历，具备3年及以上产品经理相关工作经验，有AI产品、B端产品或商业化产品经验者优先；
2、熟悉生活服务、本地商业、商家经营或销售服务等相关业务场景，能够准确理解业务需求和用户痛点，独立完成需求分析、产品设计及项目推进；
3、具备较强的B端产品能力，熟悉B端用户需求、业务流程及产品落地方式，有成功推动产品从0-1到1-N迭代增长的项目经验；
4、对数据敏感，具备良好的数据分析能力，能够通过数据发现问题、验证方案效果并驱动产品持续优化；
5、具备优秀的跨团队沟通与项目管理能力，主人翁意识强，能够在复杂协同环境中推动项目高效落地；
6、对AI行业和大模型产品有热情、有理解，关注行业趋势和技术发展，具备较强的创新意识与业务判断力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.816726+00'::timestamptz,'7627117718337308981') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI实践全栈工程师-飞书（上海/北京/深圳）',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7628877606284953909/detail','岗位名称：AI实践全栈工程师-飞书（上海/北京/深圳）

岗位职责：
1、深耕AI落地一线，深度绑定客户业务场景，打通AI产品与工程落地的最后一公里，深度嵌入客户业务全流程，主导AI Agent、Workflow等前沿AI应用从0到1的落地实践，沉淀可复制、可规模化的AI落地方案，反向驱动产品迭代升级，打造行业标杆案例；
2、深入客户现场，挖掘高价值AI应用场景，将模糊的业务需求转化为清晰、可落地的技术实施路径，协同内外部团队推进项目立项，抢占AI落地赛道先机；
3、AI项目端到端全流程落地，独立完成项目技术定义、方案架构设计，搭建POC原型及试点版本，适配客户真实业务环境完成AI应用上线，必要时直接参与编码、调试、Prompt工程设计、评测体系搭建及部署支持，全程掌控项目落地质量与效率；
4、深化与客户的长期合作，高效同步方案进展与潜在风险，提供全周期项目交付陪跑服务，推动客户稳定复用AI应用，助力业务复购与场景扩展，实现AI价值闭环；
5、抽象AI落地过程中的可复用模板与方法论，精准识别行业共性需求并推动产品化落地，高效传递客户核心反馈，助力AI产品持续优化，提升行业AI落地效率。

岗位要求：
1、本科及以上学历，计算机、软件工程、人工智能等相关专业优先；
2、具备3年以上企业端技术方案、前置交付等相关经验，有独立推进复杂项目能力；
3、熟悉至少一门主流编程语言（Python/JS/TS/Java等）；
4、理解LLM、Agent、RAG等核心概念，有相关项目应用经验；
5、能独立完成需求分析至上线交付全流程，具备出色的结构化思考与跨团队协同能力；
6、可在复杂动态环境下快速决策、推进工作。

加分项
1、具备企业AI应用、Agent平台、低代码等相关经验；
2、具备零售、制造、金融等行业解决方案沉淀经验；
3、具备客户成功、专业服务、实施咨询、解决方案架构等复合背景；
4、具备从0到1模板沉淀或早期产品/复杂架构设计经验；
5、具备创业、早期产品建设或复杂系统架构设计经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.908817+00'::timestamptz,'7628877606284953909') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','国际化AI短剧制作人 - 番茄小说',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7637436698960365877/detail','岗位名称：国际化AI短剧制作人 - 番茄小说

岗位职责：
团队介绍：番茄小说是抖音在 2019 年推出的免费阅读产品，致力于为读者提供优质的阅读体验。番茄小说拥有海量正版小说，涵盖言情、都市、玄幻、悬疑等主流网文类型，以及大量热剧原著和经典出版物，支持用户看书、听书。

1、负责AI短剧的全流程生产工作，包括前期选题与IP选定策划，把控从剧本创作、视觉风格到制作的全流程项目进度与质量，对内容质量、项目进度与ROI负责；
2、与内外部工作室/制作方协作，对齐并判断创意、剧本、视觉效果与要素、制作重点等，配合上线计划，进行内容质量把控与修改；
3、分析全球爆剧，洞察用户诉求，挖掘AI短剧内容趋势并寻求创新与新内容方向点。

岗位要求：
1、本科及以上学历，专业不限，有影视专业以及国际化学习经历者优先；
2、1年以上影视相关工作经验，熟悉影视制作流程，有男频/通用题材作品经验优先；
3、熟悉AI或者动画内容的视觉表达特点，对AIGC内容制作有兴趣；
4、英语可作为工作语言，有充分欧美内容阅片量和理解力，有国际化学习与工作经历者优先；
5、自驱力与学习力强，工作负责，有强烈的好奇心，有出色的跨部门沟通和协作能力，具备较强的项目管理能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.620703+00'::timestamptz,'7637436698960365877') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI数据分析师（AI垂直场景）-集团信息系统',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7640003367049169205/detail','岗位名称：AI数据分析师（AI垂直场景）-集团信息系统

岗位职责：
1、业务指标体系搭建与数据基建
1）深入了解业务场景，结合业务需求建设稳定、可靠的底层数据，确保数据准确、可用；
2）负责集团信息系统相关业务团队（财务、人力、采购、法务等方向）的业务指标体系搭建，通过数据分析快速定位内部问题或发现机会；
2、业务洞察与诊断分析
1）通过数据分析方法识别、预测组织或业务运营中的核心问题（如信息效率、流程瓶颈、风险点），提出可落地的建议并推动拿到管理收益；
2）挖掘日常管理与业务运营背后的规律和底层逻辑，建立分析框架与模型，产出高质量的诊断报告；
3、AI驱动的数据分析能力建设
1）推动数据分析流程的AI化转型，设计并落地AI驱动的数据分析能力体系；
2）探索并落地AI（大模型、Agent等）在业务分析、文本挖掘、归因分析、预测分析、自动化报告生成等场景中的应用；
3）沉淀可复用的分析模板与技能（Skill），将重复性、标准化的分析工作流程化、智能化，形成AI数据分析的工作范式；
4、跨团队协作与数据产品构建
1）与业务运营、数据仓库、产品、研发、算法等团队保持顺畅沟通，确保分析结论落地与持续优化；
2）参与数据产品/AI数据产品的PRD编写、功能设计与验收，构建用户友好的数据系统支持业务。

岗位要求：
1、本科及以上学历，数学、统计学、计算机或相关理工科专业优先；
2、3-5年数据分析工作经验，具备丰富的数据挖掘、信息收集与建模能力；
3、精通SQL，熟练使用Tableau/PowerBI等可视化工具，熟悉Python或R进行数据分析，具备一定的算法经验（机器学习、Causal Inference、动态规划），较强的AI实践与应用能力，熟悉AI数据分析工具与平台（如VibeCoding、Gemini、ChatGPT、Claude等），能熟练运用大语言模型辅助数据分析与问题诊断，了解数据分析Agent的应用场景，具备将AI技术应用于数据分析的实践经验，能够设计分析Skill，实施AI辅助的归因分析、预测性分析及自动化报告生成；
4、具备深厚的业务理解力，对数字敏感，有洞察力和框架思维，能准确定义问题、提出假设并设计解决方案；具备较强的逻辑能力和抽象能力，有数据产品搭建背景者优先，优秀的沟通能力和影响他人的能力，能讲好故事；充满好奇心，能触类旁通、举一反三；
5、坚信组织的智能化变革一定会发生，愿意主动投入推动变革，有韧性、以拿结果为最终目标；
6、具备数据安全与隐私保护意识，严格遵守数据管理相关规范。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.68818+00'::timestamptz,'7640003367049169205') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','开发者运营专家（AI方向）-飞书',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7640083889069607173/detail','岗位名称：开发者运营专家（AI方向）-飞书

岗位职责：
1、负责AI产品面向开发者群体的运营策略制定与落地，围绕产品不同阶段目标，搭建开发者社区运营体系，提升产品在开发者圈层的认知度与影响力；
2、结合产品功能迭代、技术能力与行业热点，策划并输出面向开发者的内容，包括但不限于功能解读、最佳实践、案例文章、专题内容等，提升产品传播效率与内容供给质量；
3、负责开发者社区日常运营，通过内容运营、活动策划、SEO优化、外部渠道合作等方式，持续提升社区流量、用户增长、活跃度及用户体验；
4、与产品、研发、设计、市场等团队紧密协作，建立产品与开发者之间的双向反馈机制，推动产品能力对外表达及运营策略持续优化；
5、挖掘并维护开发者社区KOL、技术作者、开源社区及生态合作伙伴关系，促进社区活跃与开发者生态建设。

岗位要求：
1、本科及以上学历，具备社区运营、内容运营、开发者运营或相关工作经验；有AI产品、技术产品、开发工具或开源社区相关经验者优先；
2、深入理解开发者群体、技术社区或开源文化，能够准确把握开发者需求，具备良好的开发者沟通与内容表达能力；
3、具备较强的内容策划与文字能力，能够将复杂的产品能力或技术特性转化为清晰、专业、易传播的内容；
4、具备用户增长与数据分析能力，能够基于社区流量、活跃、留存等核心指标持续优化运营策略；
5、具备良好的跨团队协作能力、学习能力与执行力，对AI、技术创新和开发者生态有热情；具备技术背景或研发经历者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.876039+00'::timestamptz,'7640083889069607173') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片互联软件工程师-Data',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7641057392404285701/detail','岗位名称：AI芯片互联软件工程师-Data

岗位职责：
1、参与AI芯片多卡互联方案的设计与开发，开发和优化多卡互联的软件驱动程序，实现多卡之间的协同工作；
2、参与多卡互联系统的验证与调试，及时发现并解决在测试过程中出现的各种问题；
3、参与AI芯片互联相关软件栈开发，包括Kernel Mode Driver/User Mode Driver/SDK/Tools等；
4、跟踪行业最新技术动态，为公司的AI芯片多卡互联技术发展提供前瞻性的建议和技术储备。

岗位要求：
1、计算机/电子信息工程相关专业本科及以上学历；
2、熟练掌握至少一种编程语言（如C、C++等）及Linux系统编程，有Linux内核驱动开发经验，熟悉Linux操作系统下的驱动开发流程；
3、至少2年以上AI芯片/GPGPU芯片/RDMA网卡芯片或者相关领域的工作经验；
4、对多卡互联技术有深入的理解（包括不限于NVLink、SUE、RDMA或者其他高速互联接口协议），掌握RDMA网卡的驱动开发，熟悉TCP/IP协议及RoCE V2协议；
5、熟悉NCCL等集合通信库的原理以及使用；
6、具有良好的团队合作精神和沟通能力，能够与跨部门团队（如硬件团队、算法团队等）紧密协作。

加分项：
1、理解LLM网络模型结构，熟悉模型部署、分析和优化；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:55.493043+00'::timestamptz,'7641057392404285701') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理-集团信息系统',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7641521825382500661/detail','岗位名称：AI产品经理-集团信息系统

岗位职责：
1、AI场景挖掘与产品规划
1）深度调研集团信息系统覆盖的全流程业务痛点，联合业务方挖掘财务、人力、采购、法务等AI应用场景，输出结构化需求文档与用户故事地图；
2）负责AI Agent在集团信息系统各业务场景的产品规划与路线图制定，独立完成从0到1的产品设计与迭代；
3）跟踪LLM、Agent、NLP、RAG等前沿技术动态，定义产品智能化方向与核心价值；
2、Agent架构设计与产品落地
1）主导Agent的产品设计，包括知识问答(RAG)、工具调用链、MCP/Skill扩展等核心模块的规划与优化；
2）输出原型设计及技术实现路径，推动Agent/Skill在业务场景的部署与落地，确保方案兼顾技术可行性与业务实用性；
3、项目推进与跨团队协作
1）制定产品路线图与迭代计划，明确各阶段目标与交付物；
2）协调算法、研发、测试、业务等跨职能团队，推动AI能力在不同业务板块的复用与落地；
3）建立与业务方的需求对接机制，组织评审与验收会议，保障项目按时高质量交付；
4、效果评估与持续优化
1）搭建完善的效果评估体系(测评集构建、准出标准定义)，跟踪产品上线后的关键指标(如成本降低率、效率提升、风险识别准确率)与用户反馈；
2）通过数据分析定位问题，制定迭代优化策略；
3）沉淀AI产品设计方法论、需求模板、Skill资产等，形成产品持续优化闭环。

岗位要求：
1、本科及以上学历，计算机科学、人工智能、信息管理、供应链管理或相关专业优先；
2、年限暂不设限，具备B端产品经理经验、AI/LLM相关产品经验，具备完整AI产品从设计到落地的项目案例，具备扎实的产品设计能力及从0到1的产品落地经验；
3、深入理解LLM、NLP、Agent等核心技术原理，熟悉Agent能力边界、产品架构、技术实现与评测方法，熟悉Prompt、Context、Harness、CLI、RAG、MCP/Skill等应用技术路径，能与研发团队高效沟通技术方案的可行性；
4、掌握常用数据分析工具，具备通过数据评估产品效果的能力，有A/B测试设计与解读经验者优先；
5、熟悉集团信息系统相关业务领域（财务、人力、采购、法务等）业务逻辑与合规要求者优先，能将复杂业务需求转化为清晰的产品方案，具备FDE（业务部署）相关能力者优先；
6、优秀的跨部门沟通、表达、逻辑思维与项目管理能力，能独立对接业务方需求并推动产品落地。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:57.609275+00'::timestamptz,'7641521825382500661') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI应用研发工程师-抖音AI创作（北京/上海）',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7643724902272616709/detail','岗位名称：AI应用研发工程师-抖音AI创作（北京/上海）

岗位职责：
1、负责抖音AI创作多场景下的智能体应用服务开发，包括不限于为多轮对话、形象、视频生成、剧本生成、自由开放式创作等场景提供解决方案；
2、负责上述业务的智能服务链路稳定性、效果的持续优化，以及线上监控保障体系构建；
3、负责各智能体涉及到的多端工具、技能、知识库、记忆等服务架构的设计，在效果与稳定性上配合好评测团队达到用户体验和上线标准；
4、能够协同算法团队在智能体应用服务环节落地垂类算法模型，打磨效果的同时降低推理成本；
5、紧跟行业AI范式，从模型到智能体架构到工作流能够做到快速复现和推动在业务中落地。

岗位要求：
1、对AI应用方向有强烈的兴趣，熟悉Agent相关的常见范式架构，如Plan&Excute、ReAct、Workflow等，熟悉模型的工作原理和特性，并能结合原理和特性做稳定性、成本和效果优化优先；
2、业务理解能力强，能够针对业务上的需求梳理业务边界并快速匹配最适合的Agent工作流范式；
3、开发语言和技术栈不限，熟悉Golang/Python/TypeScript优先，并熟悉常见的软件开发模式；
4、对行业流行的常见模型优缺点有大致的了解，并了解如何系统科学的评测帮助做模型选型；
5、掌握模型原理优先，对常见的CNN、RNN、Transformer模型结构及推理架构有一定的了解优先，对模型的二次训练原理及方法了解优先，如SFT、LoRA-SFT、DPO等。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.825442+00'::timestamptz,'7643724902272616709') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包AI大模型数据分析-火山方舟MaaS',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7644171018764175669/detail','岗位名称：豆包AI大模型数据分析-火山方舟MaaS

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、负责模型资源经营的数据分析与运营体系建设，建立统一Token口径、经营指标和分析框架，包括：模型成本、利用率、峰谷结构、模型替代率、高价值场景识别等；
2、分析业务使用结构，识别资源浪费、高成本低价值场景和替代机会；
3、建立业务分级、模型分级和资源匹配分析机制；
4、支撑公司级资源分配、预算管理和经营决策；
5、推动外部模型向内部模型的替代与切换分析。

岗位要求：
1、有较强数据分析、经营分析或策略运营经验；
2、能独立搭建分析框架，而不仅是报表统计；
3、对ROI、资源利用率、成本结构有较强敏感度；
4、能深入理解AI产品和模型调用场景；
5、有较强沟通能力，能与业务和技术团队协同。

加分项：
1、有云资源、广告、推荐、电商、商业化经营分析经验；
2、有SQL、Python、BI建设能力；
3、有GPU/云资源利用率分析经验；
4、理解AI产品增长和Token消耗特点；
5、能从全局经营视角发现结构性问题，而不是只做局部分析。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.866503+00'::timestamptz,'7644171018764175669') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包AI大模型数据分析-火山方舟MaaS',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7644171893146929461/detail','岗位名称：豆包AI大模型数据分析-火山方舟MaaS

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、负责模型资源经营的数据分析与运营体系建设，建立统一Token口径、经营指标和分析框架，包括：模型成本、利用率、峰谷结构、模型替代率、高价值场景识别等；
2、分析业务使用结构，识别资源浪费、高成本低价值场景和替代机会；
3、建立业务分级、模型分级和资源匹配分析机制；
4、支撑公司级资源分配、预算管理和经营决策；
5、推动外部模型向内部模型的替代与切换分析。

岗位要求：
1、有较强数据分析、经营分析或策略运营经验；
2、能独立搭建分析框架，而不仅是报表统计；
3、对ROI、资源利用率、成本结构有较强敏感度；
4、能深入理解AI产品和模型调用场景；
5、有较强沟通能力，能与业务和技术团队协同。

加分项：
1、有云资源、广告、推荐、电商、商业化经营分析经验；
2、有SQL、Python、BI建设能力；
3、有GPU/云资源利用率分析经验；
4、理解AI产品增长和Token消耗特点；
5、能从全局经营视角发现结构性问题，而不是只做局部分析。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.866598+00'::timestamptz,'7644171893146929461') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包AI大模型策略产品（Model Hub）-火山方舟MaaS',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7644178458600802565/detail','岗位名称：豆包AI大模型策略产品（Model Hub）-火山方舟MaaS

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、负责公司级模型资源经营相关能力建设，包括：Token管理与度量体系、模型路由与降级能力、资源分级与权限机制、ROI与成本分析能力、模型匹配、资源调度、缓存与利用率优化能力；
2、推动内部模型与外部模型统一视角建设，形成统一Token经营体系；
3、与模型、平台、业务、采购、风控、合规等团队协同，推动资源经营机制落地；
4、将资源治理、供给管理、模型切换等策略产品化、平台化；
5、建立AI产品场景下的经营分析和资源决策能力，而不仅是传统后台功能。

岗位要求：
1、有较强的平台产品、策略产品或资源调度类产品经验；
2、能理解AI产品、模型调用、推理成本、token消耗等核心概念；
3、具备较强结构化思考能力，能抽象复杂业务问题；
4、能同时理解业务目标、技术约束和经营逻辑；
5、有跨团队推动复杂项目落地能力。

加分项
1、有MaaS、LLM Platform、广告、推荐、云资源、GPU调度等经验；
2、有资源经营、预算分配、成本治理、策略系统经验；
3、理解模型路由、缓存、Agent、多模型协同等方向；
4、对AI产品商业化、ROI分析有理解；
5、能从“公司级资源经营”而不是“功能开发”视角思考问题。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.907965+00'::timestamptz,'7644178458600802565') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI加速软件资深研发工程师-芯片研发',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7647745095924533509/detail','岗位名称：AI加速软件资深研发工程师-芯片研发

岗位职责：
1、负责大模型在自研AI芯片上的性能评估与软硬件协同优化，主导方案设计、计算、通信全链路适配和调优；
2、对接算法，负责字节跳动大模型例如豆包、Seedance等在自研硬件不同分布式方案设计性能评估、roofline建模和集群成本分析等，协助业务落地的软硬件协同设计；
3、负责高性能计算算子与集合通信算子的设计、实现与优化，主导大模型分布式训练/推理场景下计算与通信的融合及重叠优化，追求极致的端到端吞吐与性价比；
4、负责模型量化、稀疏、蒸馏等部署方案的探索与落地，构建分布式推理系统并对推理框架做极致调优；
5、牵引关键技术难题攻关，制定技术路线，指导并培养团队成员，推动跨团队（算法、框架、驱动、硬件、芯片验证）协同与自研软件栈的架构演进；主动探索针对硬件，创新的部署方案和软件栈方案设计。

岗位要求：
1、计算机/电子工程相关专业，硕士学位及以上优先，4年以上AI编译器、算子或高性能通信相关研发经验；
2、深入理解AI加速硬件体系结构与并行计算，精通多层级存储、片上NOC与片间互联原理，能从体系结构视角驱动软硬件协同设计；
3、精通C/C++与Python，具备扎实的算法功底与大型软件系统的架构设计、性能优化能力；
4、深入掌握主流深度学习框架的底层计算与运行时机制，对常见算子的底层实现有深刻理解；
5、具备技术领导力与较强自驱力，能独立牵引复杂技术攻关，沟通协作与问题分析解决能力优秀。

以下为加分项
1、深入理解LLM与多模态模型（如Qwen、DeepSeek等），有大模型分布式训练/推理框架的研发与调优经验，有大模型训练千卡以上集群训练落地经验；
2、熟悉NCCL、DeepEP等集合通信库与RDMA原理，有自研集合通信库或芯片互联的研发与优化经验；
3、熟悉GPU或主流AI DSA体系结构与CUDA等异构编程模型，有算子优化、图编译优化或硬件评测的实战经验；
4、有AI加速硬件量化工具的开发经验，熟悉模型量化、稀疏、剪枝、蒸馏等压缩技术的落地；
5、熟悉AI服务器与集群架构，对多层级卡间互联Topo有实践经验，有大规模分布式部署落地经历。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:55.471553+00'::timestamptz,'7647745095924533509') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI加速软件资深研发工程师-芯片研发',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7647747126361131317/detail','岗位名称：AI加速软件资深研发工程师-芯片研发

岗位职责：
1、负责大模型在自研AI芯片上的性能评估与软硬件协同优化，主导方案设计、计算、通信全链路适配和调优；
2、对接算法，负责字节跳动大模型例如豆包、Seedance等在自研硬件不同分布式方案设计性能评估、roofline建模和集群成本分析等，协助业务落地的软硬件协同设计；
3、负责高性能计算算子与集合通信算子的设计、实现与优化，主导大模型分布式训练/推理场景下计算与通信的融合及重叠优化，追求极致的端到端吞吐与性价比；
4、负责模型量化、稀疏、蒸馏等部署方案的探索与落地，构建分布式推理系统并对推理框架做极致调优；
5、牵引关键技术难题攻关，制定技术路线，指导并培养团队成员，推动跨团队（算法、框架、驱动、硬件、芯片验证）协同与自研软件栈的架构演进；主动探索针对硬件，创新的部署方案和软件栈方案设计。

岗位要求：
1、计算机/电子工程相关专业，硕士学位及以上优先，4年以上AI编译器、算子或高性能通信相关研发经验；
2、深入理解AI加速硬件体系结构与并行计算，精通多层级存储、片上NOC与片间互联原理，能从体系结构视角驱动软硬件协同设计；
3、精通C/C++与Python，具备扎实的算法功底与大型软件系统的架构设计、性能优化能力；
4、深入掌握主流深度学习框架的底层计算与运行时机制，对常见算子的底层实现有深刻理解；
5、具备技术领导力与较强自驱力，能独立牵引复杂技术攻关，沟通协作与问题分析解决能力优秀。

以下为加分项
1、深入理解LLM与多模态模型（如Qwen、DeepSeek等），有大模型分布式训练/推理框架的研发与调优经验，有大模型训练千卡以上集群训练落地经验；
2、熟悉NCCL、DeepEP等集合通信库与RDMA原理，有自研集合通信库或芯片互联的研发与优化经验；
3、熟悉GPU或主流AI DSA体系结构与CUDA等异构编程模型，有算子优化、图编译优化或硬件评测的实战经验；
4、有AI加速硬件量化工具的开发经验，熟悉模型量化、稀疏、剪枝、蒸馏等压缩技术的落地；
5、熟悉AI服务器与集群架构，对多层级卡间互联Topo有实践经验，有大规模分布式部署落地经历。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.845416+00'::timestamptz,'7647747126361131317') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI短剧产品运营 - 番茄小说',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7650062259561548037/detail','岗位名称：AI短剧产品运营 - 番茄小说

岗位职责：
团队介绍：番茄小说是抖音在 2019 年推出的免费阅读产品，致力于为读者提供优质的阅读体验。番茄小说拥有海量正版小说，涵盖言情、都市、玄幻、悬疑等主流网文类型，以及大量热剧原著和经典出版物，支持用户看书、听书。

1、负责AI短剧从剧本到生产的策略制定，推动创作者生产流程线上化，构建AI短剧平台生态指标与监控体系；
2、深入了解AI短剧生产流程，优化创作者的AI Agent/工作流，提升创作者的制作效率，为创作者活跃和优质内容生产负责；
3、跟进行业内容趋势，提炼优质AI短剧内容特征，建设评估模型，为评估准确率负责。

岗位要求：
1、本科及以上学历，关注AIGC、Agent等前沿技术，并能结合业务场景落地；
2、对AI漫剧、短剧等内容形态有热情，热爱创作，具备对潮流、创作者生态和AI创作模式的敏感度，拥有开放的创新意识和实验精神；
3、具备逻辑思维以及数据分析能力，能独立完成数据分析并设计策略，具备良好沟通能力、项目管理能力和跨部门协作能力。

加分项
1、对AI漫剧、短剧等内容形态有深入了解者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.564526+00'::timestamptz,'7650062259561548037') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI全栈研发工程师-AI数据与安全',NULL,'上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7651514986514975029/detail','岗位名称：AI全栈研发工程师-AI数据与安全

岗位职责：
1、参与数据合成平台、工具平台、强化学习环境管理平台的功能设计与系统实现，围绕工作流搭建、任务编排等场景，构建高可用、易扩展、可持续演进的平台产品能力；
2、负责平台前后端一体化架构设计与工程优化，提升复杂页面交互性能、服务稳定性与系统可维护性，支撑多角色、多场景下的平台高效使用；
3、深度参与AI能力接入与平台封装，推动模型、工具、环境、执行链路、评测能力在产品侧形成统一、清晰、可操作的使用体验，降低业务接入门槛。

岗位要求：
1、本科及以上学历，计算机科学、人工智能等相关专业；熟悉大模型训练范式，对强化学习生态有基础认知；
2、擅长Vibe Coding/Spec Coding，熟练掌握至少一种前端技术栈与一种后端开发语言，能够独立完成复杂平台的前后端设计、开发与联调，具备较强的工程抽象与模块拆分能力；
3、优秀的跨团队协作能力，能够连接研究设想与工程落地，加速前沿模型能力的验证与迭代；
4、具备良好的负责人意识和自我驱动力，对AGI技术抱有强烈热情。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.798801+00'::timestamptz,'7651514986514975029') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI短剧商务运营 - 番茄小说',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7654478006309472517/detail','岗位名称：AI短剧商务运营 - 番茄小说

岗位职责：
团队介绍：番茄小说是抖音在 2019 年推出的免费阅读产品，致力于为读者提供优质的阅读体验。番茄小说拥有海量正版小说，涵盖言情、都市、玄幻、悬疑等主流网文类型，以及大量热剧原著和经典出版物，支持用户看书、听书。

1、版权合作：AI短剧版权方的引入与合作，理解平台规则与内容策略，牵引外部合作方完成业务目标，增加优质内容供给；
2、承制合作：AI短剧承制方的引入与合作，完善AI承制方分级标准与定价机制，优化承制方剧本选择、签约流程，提升承制方合作体验与效率；
3、合作方运营与管理：内容方的日常沟通与关系维护，围绕内容运营、营销策略、平台政策等方面提供商务建议与支持，协助合作方理解平台方向，参与内容选题、方向讨论，提升内容质量与爆款命中率；
4、市场监控与内容策略输入：作为对外出口，持续了解AI短剧行业动态与趋势，及时反馈关键市场信息，以及合作方对平台政策的理解和执行，帮助合作方做出科学投入与内容判断。

岗位要求：
1、本科及以上学历，2年以上商务运营或面向企业运营工作经验，有短剧/漫剧/漫画/动画相关内容合作或制作经验者优先；
2、沟通表达清晰，具备平台视角，理解平台与外部合作方的沟通策略与协作方式，善于推动共赢合作；
3、了解AI短剧的创作逻辑与用户喜好，对行业内CP/产品运营现状、技术发展、内容趋势、市场动向有所洞察；
4、自驱力强，具备优秀的沟通表达能力、项目协调能力和商务谈判能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.629501+00'::timestamptz,'7654478006309472517') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片计算软件架构师/工程师-Data',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7654891640951703861/detail','岗位名称：AI芯片计算软件架构师/工程师-Data

岗位职责：
1、参与AI芯片Profiling方案设计，负责Profiling模块的验证以及相关驱动和工具的开发；
2、参与AI芯片任务调度器驱动方案设计和开发；
3、参与AI芯片任务调度器Firmware方案设计和开发；
4、跟踪行业最新技术动态，为公司的AI芯片多卡互联技术发展提供前瞻性的建议和技术储备。

岗位要求：
1、计算机/自动化相关专业本科及以上学历；
2、熟练掌握至少一种编程语言（如C、C++等）及Linux系统编程，有Linux内核驱动开发经验，熟悉Linux操作系统下的驱动开发流程；
3、至少2年以上AI芯片/GPGPU芯片或者相关领域的工作经验；
4、熟悉AI芯片任务调度器相关软件开发；
5、熟悉CUDA Runtime/Driver API/Cupti/Nsys/Nsight等，熟悉CUDA Toolkit软件；
6、具有良好的团队合作精神和沟通能力，能够与跨部门团队（如硬件团队、算法团队等）紧密协作，共同推进项目进展。

加分项：
1、理解LLM网络模型结构，熟悉模型部署、分析和优化；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.812884+00'::timestamptz,'7654891640951703861') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片互联软件工程师-Data',NULL,'杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7654903771567737141/detail','岗位名称：AI芯片互联软件工程师-Data

岗位职责：
1、参与AI芯片多卡互联方案的设计与开发，开发和优化多卡互联的软件驱动程序，实现多卡之间的协同工作；
2、参与多卡互联系统的验证与调试，及时发现并解决在测试过程中出现的各种问题；
3、参与AI芯片互联相关软件栈开发，包括Kernel Mode Driver/User Mode Driver/SDK/Tools等；
4、跟踪行业最新技术动态，为公司的AI芯片多卡互联技术发展提供前瞻性的建议和技术储备。

岗位要求：
1、计算机/电子信息工程相关专业本科及以上学历；
2、熟练掌握至少一种编程语言，如C、C++等，熟练掌握Linux系统编程；有Linux内核驱动开发经验，熟练Linux操作系统下的驱动开发流程；
3、至少2年以上AI芯片/GPGPU芯片/RDMA网卡芯片或者相关领域的工作经验；
4、对多卡互联技术有深入的理解，包括不限于NVLink、SUE、RDMA或者其他高速互联接口协议；掌握RDMA网卡的驱动开发，熟悉TCP/IP协议，熟悉RoCE V2协议；
5、熟悉NCCL等集合通信库的原理以及使用；
6、具有良好的团队合作精神和沟通能力，能够与跨部门团队（如硬件团队、算法团队等）紧密协作。

加分项：
1、理解LLM网络模型结构，熟悉模型部署、分析和优化；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.727991+00'::timestamptz,'7654903771567737141') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片互联软件工程师-Data',NULL,'西安','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7654903858576034053/detail','岗位名称：AI芯片互联软件工程师-Data

岗位职责：
1、参与AI芯片多卡互联方案的设计与开发，开发和优化多卡互联的软件驱动程序，实现多卡之间的协同工作；
2、参与多卡互联系统的验证与调试，及时发现并解决在测试过程中出现的各种问题；
3、参与AI芯片互联相关软件栈开发，包括Kernel Mode Driver/User Mode Driver/SDK/Tools等；
4、跟踪行业最新技术动态，为公司的AI芯片多卡互联技术发展提供前瞻性的建议和技术储备。

岗位要求：
1、计算机/电子信息工程相关专业本科及以上学历；
2、熟练掌握至少一种编程语言，如C、C++等，熟练掌握Linux系统编程；有Linux内核驱动开发经验，熟练Linux操作系统下的驱动开发流程；
3、至少2年以上AI芯片/GPGPU芯片/RDMA网卡芯片或者相关领域的工作经验；
4、对多卡互联技术有深入的理解，包括不限于NVLink、SUE、RDMA或者其他高速互联接口协议；掌握RDMA网卡的驱动开发，熟悉TCP/IP协议，熟悉RoCE V2协议；
5、熟悉NCCL等集合通信库的原理以及使用；
6、具有良好的团队合作精神和沟通能力，能够与跨部门团队（如硬件团队、算法团队等）紧密协作。

加分项：
1、理解LLM网络模型结构，熟悉模型部署、分析和优化；
2、擅长跨团队沟通交流协作，有项目或团队管理经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.672145+00'::timestamptz,'7654903858576034053') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','兴趣推理产品运营 - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7657074734439778565/detail','岗位名称：兴趣推理产品运营 - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、负责抖音产品用户兴趣推理方向模型策略运营，对主流AI产品边进行体验和能力评估，对评估数据结论负责；
2、发现模型问题并进行分类整理，包括：幻觉问题、理解偏差、兴趣推理错误、用户体验问题、用户个性化需求理解，并推进问题解决，对模型问题推进情况负责；
3、负责构建评测数据集（Benchmark）和模型效果评价体系，分析用户反馈与模型表现，输出评测报告，参与Prompt优化与Agent流程设计，配合产品经理推动模型效果持续优化和版本选代，对兴趣推理相关各项场景体验负责。

岗位要求：
1、本科及以上学历，有较好的文本编辑能力与学习能力，具备不错的知识广度，有较强的优质内容感，对回答的质量有判断与感知，对用户个性化需求能有较好的认知理解；
2、对AIGC与大模型有强烈兴趣，有耐心和创新精神，了解搜索关键业务指标和用户指标，了解NDCG和GSB评估方法为加分项，有过相关工作经验者优先；
3、工作细致有耐心，能适应多变的环境，具备较强的沟通表达能力、自驱力、执行力；
4、能进行复杂情况沟通，有一定统筹协调能力，工作细致有耐心，能适应多变的环境，善于使用各种AI产品提升工作效率。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.646183+00'::timestamptz,'7657074734439778565') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品运营-抖音生活服务',NULL,'北京 / 上海','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7657869556405799221/detail','岗位名称：AI产品运营-抖音生活服务

岗位职责：
1、立足生活服务业务场景，与各产品/业务团队合作与共建，提升不同场景内AI应用的渗透和效果（如交易/营销等场景for用户或商户提供服务，协助搭建迭代Agent服务等）；
2、面向产品及运营团队，通过AI能力进行工作效能提升（如Text-to-Code流程建设、Skill建设评测推广等）；
3、面向内部持续进行AI能力和应用的推广运营、效果追踪、培训和活动组织。

岗位要求：
1、热情且乐于实践，有可供讲解演示的AI个人实践项目或Demo，有创业经历优先；
2、乐于且擅长与不同职能/背景同事进行沟通协同，处理过复杂协同任务，共同完成过有挑战性的项目目标；
3、对未知事物抱有好奇心和敬畏，更愿意基于实践的方式得到认知，对不确定性有一定耐受度。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:35:57.421818+00'::timestamptz,'7657869556405799221') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI数据运营专家（视觉生成） - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7659698092618565941/detail','岗位名称：AI数据运营专家（视觉生成） - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、负责AI数据项目的整体统筹与推进，结合业务目标拆解需求，制定项目方案，协调数据、运营等多方资源，保障项目高质量、高效率交付；
2、负责重点项目全流程统筹，协调产品、数据、运营等多方资源，把控项目节奏及关键节点，及时协调解决项目推进过程中的问题，持续优化跨团队协作机制和项目管理流程；
3、负责数据团队日常运营管理，包括人员规划、人力分配、质量管理、根据业务特点持续优化团队协作效率；
4、建立并维护业务数据看板及项目分析体系，持续跟踪交付效率、质量及资源使用情况，通过数据分析发现问题并推动业务优化；
5、持续关注GenAI、大模型及AI Agent等前沿技术发展，积极探索Agent、Workflow等工具在数据生产、项目管理及协作场景中的应用，推动团队效率持续提升。

岗位要求：
1、本科及以上学历，影视制作、导演、制片、管理等相关专业优先，具备AI内容生产或GenAI相关项目经验者优先；
2、热爱影视创作及AI内容行业，对GenAI、大模型、AI Agent等技术保持持续关注，具备较强的学习能力和学习意愿，能够快速理解新工具并应用于实际项目；
3、具备优秀的项目统筹与制片能力，能够合理规划项目节奏、资源及人员安排，推动复杂项目高质量交付；
4、具备良好的跨团队沟通能力，高效推进项目落地；
5、具备一定的团队管理意识，能够进行人员管理、任务分配、团队协作及能力培养，根据业务需求完成资源协调与人力规划；
6、具备基础的数据分析能力，能够通过项目数据、质量指标及业务数据看板发现问题，推动项目持续优化。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.557141+00'::timestamptz,'7659698092618565941') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理（电商大模型方向） - 抖音搜索',NULL,'杭州 / 上海 / 北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7663426999247702325/detail','岗位名称：AI产品经理（电商大模型方向） - 抖音搜索

岗位职责：
团队介绍：抖音搜索是抖音的核心产品能力之一，满足用户找内容、找商品、找服务、找经验、找人等多元需求，基于海量的内容和商品供给、领先的意图识别和产品能力，用户搜索规模保持高速增长，快速成为中国第一梯队的移动搜索平台。抖音搜索业务体系完善，涵盖内容、电商、生活服务、推荐、交互、数据分析等多个方向。AI大模型和抖音内容生态的结合，会给抖音搜索带来的新的增长动力！

1、AI电商体验全新定义与产品规划：深度拆解抖音电商搜索、智能导购、种草转化、决策下单全链路场景痛点，结合大模型、生成式AI前沿能力，完成AI时代电商交易搜索的产品形态重构、体验升级与中长期产品规划，输出完整产品方案与落地路线图；
2、智能导购场景AI产品落地：负责AI智能导购核心场景搭建，涵盖搜索意图理解、智能问答导购、商品精准推荐、多轮对话决策、场景化种草等核心能力设计，落地AI原生导购产品功能，解决用户搜索不准、决策繁琐、转化低效等核心问题，提升用户搜索满意度与交易转化率；
3、大模型策略拆解与模型调优落地：深度参与大模型在交易搜索场景的落地迭代，独立完成AI产品策略拆解、指标体系搭建、场景规则设计；联动算法、研发团队，参与模型微调、Prompt优化、检索增强、上下文优化等实操工作，持续优化模型精准度、响应效率、场景适配性，贴合电商交易业务诉求；
4、AI产品全流程迭代与落地：独立负责AI产品从需求调研、方案设计、PRD输出、灰度上线到数据复盘的全生命周期管理，通过数据迭代、用户反馈、场景打磨，持续优化AI搜索与导购产品体验，沉淀可复用的电商AI产品能力与方法论；
5、前沿AI技术落地创新跟进业界大模型、AI交互新技术、新玩法，结合抖音电商交易场景特性，探索Vibe coding、智能自动化、AI原生交互等创新落地方式，推动业务体验与效率持续升级。

岗位要求：
1、基础背景：本科及以上学历，2年及以上AI产品、搜索产品、电商策略产品相关经验；
2、硬核大模型实操能力（核心）：具备扎实的大模型产品落地经验，熟练掌握各类大模型工具，拥有丰富的Prompt工程、模型微调、场景化调优、检索增强实操经验，能够独立完成大模型场景落地的策略设计与效果优化，不局限于纯功能设计，懂技术原理、懂模型迭代、懂业务落地；
3、Vibe Coding能力（重点要求）：熟悉Vibe Coding理念与实操方法，能够借助AI编码、自动化工具高效完成产品原型、规则配置、简易脚本调试、需求落地验证，具备AI辅助高效工作、快速试错迭代的能力，拥抱AI原生工作方式；
4、业务认知与创新能力：深刻理解电商交易全链路逻辑，对AI重构电商搜索、导购、用户决策体验有独立思考和创新认知，具备敏锐的行业趋势洞察力，敢于突破传统产品思维，落地AI创新产品方案；
5、综合素质：具备优秀的跨团队协同能力、项目推进能力，逻辑清晰、执行力强。

加分项
1、有电商搜索大模型落地、AI智能导购、生成式搜索产品完整项目经验；
2、熟练使用主流大模型开发工具、拥有模型微调、RAG、Agent场景落地实操经验；
3、具备一定的代码基础，能够独立完成简单脚本编写、工具调试，熟练运用Vibe Coding提升工作效率；
4、深度体验过各类AI原生产品，对AI交互、生成式产品体验设计有独到见解。

岗位亮点
1、核心赛道：抖音电商核心交易搜索业务，直接影响平台核心GMV与用户体验，业务权重高、成长空间大；
2、技术前沿：全程参与大模型在电商交易场景的原生落地，告别传统产品迭代，专注AI时代产品创新；
3、能力成长：深耕大模型实操、AI策略拆解、智能化产品设计，掌握前沿AI产品核心能力，适配行业发展趋势。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.804054+00'::timestamptz,'7663426999247702325') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent研发工程师 - AI算力基础设施',NULL,'北京 / 上海 / 杭州 / 西安','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7664440558144833845/detail','岗位名称：AI Agent研发工程师 - AI算力基础设施

岗位职责：
团队介绍：字节跳动基础设施部门，负责字节跳动的全栈算力基础设施，从芯片服务器产研、到超大规模数据中心，到传统云平台和如今的AI Native Cloud，全方位为抖音、豆包、今日头条、飞书、火山引擎等各类产品提供领先、稳定的百万量级大规模算力基础设施服务。我们的领域涵盖数据中心建设、内核操作系统开发、服务器集群管理、高速网络通信、EB级数据存储体系、搜索型数据库探索、基于LLM的AI基础设施的研发调度与治理等，致力于打造业界领先的、面向LLM的AI云原生基础设施架构与产品矩阵。

1、参与企业级AI Agent Infra的核心建设，打造Agent的身份、权限、记忆、工具、观测与治理等运行时能力，让Agent真正成为可在生产环境运行的新型“应用形态”；
2、参与IaaS AI Agent套件研发，构建稳定可靠的Agent Infra，涵盖Agent相关云服务基础能力开发，探索技术创新，助力AI原生能力规模化实施；
3、参与高性能Agent开发框架的设计与实现，支撑多Agent协作、任务编排、长任务执行、复杂工作流等真实企业场景；
4、参与企业级AI Agent架构设计与实现，包括Agent架构演进、上下文工程、评测和观测等技术方向；
5、参与并迭代Agent链路与模型的评估体系，通过Prompt Engineering、SFT、RL等方法提升Agent能力上限；探索Agent Skills、MCP、Computer Use、Plugin等业界前沿方向，把底层AI能力包装为可复用、可分发、可持续成长的平台能力。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程、人工智能等相关专业优先；
2、掌握扎实的计算机基础与算法功底，熟练掌握至少一门编程语言（Go/Python/C++/Java等）；
3、对大模型与AI Agent领域有强烈兴趣，了解主流大模型能力边界、Agent基本机制（工具调用、上下文与记忆、任务编排等）；
4、熟悉Prompt Engineering、RAG、LangChain/LangGraph/AutoGen、MCP等其中一种技术栈者优先；
5、具备良好的系统思维与抽象能力，能够在复杂协作场景下拆解问题、设计可演进的方案；
6、求知欲强、学习能力突出，能够及时跟进业界前沿技术；具备良好的沟通与协作能力。

加分项
1、有Agent、LLM应用、RAG、知识库、Plugin/MCP等相关项目经验或开源贡献；
2、使用或研究过LangGraph、Claude Code、Codex、Hermes、Computer Use、Agent Skills等前沿框架或工具；
3、有大规模在线系统、工作流引擎、平台化产品或高并发服务的研发经验；
4、具备强化学习、规划算法实践经验，对Agentic AI研发范式有深入理解者优先；
5、参与过学术论文、竞赛或社区分享，具备良好的技术表达与写作能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.838675+00'::timestamptz,'7664440558144833845') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI训练数据与评测专家 - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7664899980926896437/detail','岗位名称：AI训练数据与评测专家 - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、负责大语言模型在通用能力、生产力、多模态&世界模型、Coding&Agent等场景下的训练数据建设与模型评测工作，支持SFT、RL、偏好数据及专项能力数据的生产和迭代，深入理解不同业务场景及用户需求，设计训练数据方案和评估方案，包括数据挖掘、数据构造、清洗去重、标注规范制定、质量验收及评估集建设，分析训练数据的分布、覆盖度、多样性及质量问题，识别数据偏差、能力缺口和长尾场景，持续优化数据配比、生产策略和质量标准；
2、基于大语言模型的调用链路、检索结果、工具调用、模型回复及中间过程等信息，开展负面案例分析、错误定位与根因归类，判断问题来源于训练数据、模型能力、策略、检索或工程链路，结合模型实验结果，分析不同数据批次、数据类型及训练策略对模型效果的影响，闭环验证数据有效性，推动训练数据持续迭代；
3、设计并完善训练数据和模型评测的自动化流程，包括数据预处理、Prompt设计、数据合成、自动化打标、质量检查、结果聚类及分析报告生成等，提升数据生产和评估效率；
4、作为项目POC，与算法、产品、策略及数据团队紧密协作，负责需求澄清、方案设计、项目排期、资源协调、质量验收、风险管理及结果交付；
5、沉淀训练数据方法论、评估框架、错误分类体系、质量Rubric、项目SOP及分析模板，推动数据能力、评估标准和自动化工具复用。

岗位要求：
1、本科及以上学历，计算机、人工智能、数据科学、统计学、数学、语言学等相关专业优先，具备经济、金融、法律、医疗、教育等垂直行业背景者更佳，这类背景有助于更深入理解复杂专业场景下的数据生产与评测需求；
2、对大模型、AI应用、数据生产或模型评测有浓厚兴趣，愿意深入理解业务场景并推动问题解决；
3、具备良好的逻辑分析能力、结构化表达能力和跨团队沟通协作能力，能够把复杂问题拆解清楚并推动落地；
4、具备较强的AI意识，习惯将AI工具融入日常工作与学习，能够主动探索AI能力边界，并在实际场景中推动应用落地者优先；
5、具备较强的责任心、自驱力和学习能力，愿意在不确定性的发展环境中保持平常心，主动推动事情往前走，具备较强的适应能力；
6、有大模型、AIGC、多模态、Agent、代码生成、搜索问答等相关科研、竞赛或项目经历者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.547173+00'::timestamptz,'7664899980926896437') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','隐私合规工程师 - 安全与风控',NULL,'北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7665183601352493365/detail','岗位名称：隐私合规工程师 - 安全与风控

岗位职责：
团队介绍：安全治理与合规团队在保障字节跳动全域安全与合规要求落地的同时，为业务发展提供支持。
我们负责制定并维护多领域的治理框架，涵盖安全认证、政策制定、隐私保护、内部威胁防控、数据合规及法规遵循等方面。
通过推动治理、风险与合规（GRC）领域的精细化建设，我们在字节跳动信息安全战略的构建中发挥着关键作用。

1、负责对公司产品开展数据安全与隐私合规检测、评估工作，撰写报告并输出整改方案；
2、针对共性的数据安全与隐私合规问题开展治理专项，进行风险归因以及跨部门的整改方案输出与落地推进；
3、关注监管动向，基于数据安全与隐私相关政策法规、实施细节等输出适用于公司业务的评估办法；
4、对接公司业务部门的数据安全与隐私合规咨询工作，提供理论与技术支持。

岗位要求：
1、2027届获得本科及以上学历，信息安全、网络安全、计算机、通信或相关专业优先；
2、具有良好的沟通能力、逻辑思维能力、语言表达能力，性格沉稳、善于学习、有团队合作精神；
3、自驱、结果导向，积极应对挑战性任务，工作激情饱满。

加分项：
1、对数据安全与隐私相关标准要求有了解，如个人信息保护法、数据安全法、GB/T35273个人信息安全规范等；
2、对互联网产品的技术架构有了解，了解安卓/iOS的权限机制；
3、具备网络协议分析方面技能以及一定的代码阅读和分析能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.611266+00'::timestamptz,'7665183601352493365') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','供应商资源开拓与运营 - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7665277703839156533/detail','岗位名称：供应商资源开拓与运营 - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、优化供应商引入与上马流程：支持供应商上马全流程，包括条款拟定，合同谈判，制定供应商使用策略，最大化保障公司利益情况下达成商务合作；负责Onboard供应商，理解需求并拆解到供应商筛选标准、规模生产前提验证，确保供应商符合交付标准，推动供应商顺利接入内部项目；
2、项目管理与数据交付：负责供应商项目交付管理，对接内外部需求方，针对需求清晰、模糊、沟通难度不同的各类需求方，高效完成需求梳理、沟通协调，做好内外部预期管理，推动供应商按项目要求完成数据交付，保障项目交付进度与交付质量，从而与内部、外部合作方建立深度信任；
3、供应商绩效管理：开展供应商关系日常维护与管理，建立长期稳定的合作关系，定期对供应商履约情况、服务质量、交付能力进行复盘与评估，优化供应商管理体系，输出供应商绩效管理与项目交付分析报告。

岗位要求：
1、本科及以上学历，有AI数据行业相关学习背景者优先；
2、拥有2年及以上供应商拓展、商务谈判相关工作经验；熟悉AI模型训练数据市场，供应商类型及行业资源分布，有AI数据公司工作经验者优先；
3、覆盖全球供应商资源池，设计供应商资源使用策略，制定可牵引供应商提升绩效的机制，将日常工作沉淀的方法论产品化，流程化，不断优化供应商运营策略和使用效率；
4、对AI行业有好奇心，学习能力强，根据工作需要不断拓展知识边界且形成有效产出；结果导向，有强大自驱力和主动性，遇到困难能想办法解决和推动进程向好发展。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.602959+00'::timestamptz,'7665277703839156533') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品运营 - 飞书 Aily & 妙搭',NULL,'杭州 / 北京 / 上海 / 深圳','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7665549325624674613/detail','岗位名称：AI产品运营 - 飞书 Aily & 妙搭

岗位职责：
团队介绍：飞书一方/官方 Agent开发团队，致力于探Agent在办公、开发等企业生产力场景的应用，目前有Aily、妙搭等AI-Native的产品，覆盖个人提效、团队协作提效、业务提效等场景。 在交付AI-Native产品的同时，我们也致力于打造AI-Native的团队，日常工作中深度拥抱AI，探索更高效的办公模式。

1、负责飞书AI产品（Aily、妙搭等）企业客户的整体经营，制定大盘客户服务计划并协调服务资源，对客户AI产品活跃情况及额度消耗增长负责；
2、推进客户AI转型全周期项目管理（用户激活->场景识别->项目推进->价值复盘），建立价值量化评估与效果回收机制，确保客户对飞书AI产品价值有明确感知；
3、能够与企业关键用户进行对话，搜集沉淀产品推广过程中的反馈，将一线场景与需求反哺产品研发，推动产品持续迭代；
4、推进团队共同沉淀行业AI场景解决方案与最佳实践，提炼可复制打法并规模化推广，通过AI工具提升运营效率，实现产品活跃及额度消耗的非线性增长。

岗位要求：
1、熟悉Codex、Claude Code等AI Agent工具，具备扎实的AI工具动手能力，高频在工作场景中使用，提升工作效率、创造业务价值；
2、具备强项目管理能力，能在多任务并行下独立推进客户项目落地，善于协调内外部资源拿到结果，问题解决能力突出；
3、具备优秀的客户沟通能力与业务洞察力，能清晰传递「AI+业务」融合的价值，洞察并挖掘客户业务中可被AI加强的高价值场景；
4、具备产品化与规模化意识，对数据敏感，能从点状场景中提炼可复制打法；有较强的方案文档撰写能力与优秀的团队合作精神；
5、本科及以上学历，具备To B产品运营、客户成功、管理咨询或企业数字化转型相关经验，有SaaS/AI产品经验优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.782491+00'::timestamptz,'7665549325624674613') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI客户运营 - 飞书 Aily & 妙搭',NULL,'杭州 / 北京 / 上海 / 深圳','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7665549835187603717/detail','岗位名称：AI客户运营 - 飞书 Aily & 妙搭

岗位职责：
团队介绍：飞书一方/官方 Agent开发团队，致力于探Agent在办公、开发等企业生产力场景的应用，目前有Aily、妙搭等AI-Native的产品，覆盖个人提效、团队协作提效、业务提效等场景。 在交付AI-Native产品的同时，我们也致力于打造AI-Native的团队，日常工作中深度拥抱AI，探索更高效的办公模式。

1、负责飞书AI产品（Aily、妙搭等）企业客户的整体经营，制定大盘客户服务计划并协调服务资源，对客户AI产品活跃情况及额度消耗增长负责；
2、推进客户AI转型全周期项目管理（用户激活->场景识别->项目推进->价值复盘），建立价值量化评估与效果回收机制，确保客户对飞书AI产品价值有明确感知；
3、能够与企业关键用户进行对话，搜集沉淀产品推广过程中的反馈，将一线场景与需求反哺产品研发，推动产品持续迭代；
4、推进团队共同沉淀行业AI场景解决方案与最佳实践，提炼可复制打法并规模化推广，通过AI工具提升运营效率，实现产品活跃及额度消耗的非线性增长。

岗位要求：
1、熟悉Codex、Claude Code等AI Agent工具，具备扎实的AI工具动手能力，高频在工作场景中使用，提升工作效率、创造业务价值；
2、具备强项目管理能力，能在多任务并行下独立推进客户项目落地，善于协调内外部资源拿到结果，问题解决能力突出；
3、具备优秀的客户沟通能力与业务洞察力，能清晰传递「AI+业务」融合的价值，洞察并挖掘客户业务中可被AI加强的高价值场景；
4、具备产品化与规模化意识，对数据敏感，能从点状场景中提炼可复制打法；有较强的方案文档撰写能力与优秀的团队合作精神；
5、本科及以上学历，具备To B产品运营、客户成功、管理咨询或企业数字化转型相关经验，有SaaS/AI产品经验优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.793036+00'::timestamptz,'7665549835187603717') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包AI大模型产品经理（用户体验方向） - Data AML',NULL,'上海 / 北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7665609050431981877/detail','岗位名称：豆包AI大模型产品经理（用户体验方向） - Data AML

岗位职责：
团队介绍：Data AML是字节跳动的机器学习中台，为抖音/今日头条/西瓜视频等业务提供推荐/广告/CV/语音/NLP的训练和推理系统。为公司内业务部门提供强大的机器学习算力，并在这些业务的问题上研究一些具有通用性和创新性的算法。同时，也通过火山引擎将一些机器学习/推荐系统的核心能力提供给外部企业客户。

1、负责火山方舟新一代产品的核心用户体验，从用户意图出发，设计完整、自然、可信的任务体验；
2、深入理解开发者和企业用户使用模型、构建Agent的真实过程，把复杂的模型、工具和平台能力，转化为用户能够直观理解和掌控的产品体验；
3、设计Agent产品中的关键体验，包括任务推进、过程反馈、人机协作、异常处理、结果交付与持续使用；
4、与设计、算法、工程团队高密度协作，通过原型、用户反馈和真实行为快速验证判断；
5、持续研究AI原生产品的新范式，把对未来的判断转化为今天能够落地的产品选择。

岗位要求：
1、有出色的用户洞察和体验判断，能站在用户视角重新定义问题；
2、做过Agent、AI助手、Copilot或其他AI产品，对大模型和Agent的能力边界有实际认知；
3、有较强的抽象能力和系统思考能力，能快速做出原型、验证假设；
4、对AI时代的未来有真实的好奇与憧憬，愿意亲手参与定义下一代产品。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:47.859394+00'::timestamptz,'7665609050431981877') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI大模型评估专家（生产力方向） - AI数据与安全',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7665618172833499445/detail','岗位名称：AI大模型评估专家（生产力方向） - AI数据与安全

岗位职责：
团队介绍：AI 数据与安全团队为 Seed 基座模型及 AI 原生应用提供跨模态数据服务，覆盖数据生产全流程，包含模型评估标准的制定、数据规模化生产、数据飞轮搭建，不断提升数据质量，支持模型快速迭代。
团队由产品经理、数据工程、数据运营等跨职能人才组成，并通过与 Seed 研究员、行业专家、全球顶尖数据供应商紧密合作，从真实场景中收集反馈并分析模型表现数据，解决 AI 前沿突破过程中的复杂数据问题，推动模型性能与用户体验的双重提升。我们既是帮助模型技术迭代的一线贡献者，也是模型和 AI 产品的一手用户。

1、负责大语言模型生产力/Agent方向的评测工作，与产品研发协同迭代评估流程与标准，通过交付高质量的评测/众测报告，为模型优化和产品迭代提供牵引；
2、持续探索自动评估的思路与方法，搭建Agent-as-Judge自动评估体系，持续提升人机一致率，提高模型评估的吞吐量与效率；
3、从用户端到端体验和模型理想态出发，构建并迭代人工与自动评估题库，建立题库动态更新机制，推动评估与真实用户需求对齐；
4、深入拆解Agent复杂任务的多步执行链路，将端到端表现归因到模型能力vs工程harness，输出可支撑算法敏捷迭代与准出决策的结论。

岗位要求：
1、本科学历以上，人工智能、计算机、软件工程、数据科学等相关专业优先，有理工背景叠加办公/生产力场景理解者更佳；
2、AI生产力产品（编程、办公、数据分析、浏览器Agent等）的深度用户，清楚该场景下“什么是好的完成质量”以及常见失败模式；
3、熟练掌握提示词工程，能独立搭建Workflow/Agent，具备基础代码能力（能读写Python、看懂日志与Trace优先）；
4、理解或愿意快速掌握Agent评测方法论，有评测/标注/数据质量相关经验优先；
5、具备出色的项目管理能力，能与产品、研发、数据等多部门协同，对齐需求并推动多项任务高质高效交付；
6、对大模型与Agent有高度热情，拥有出色的逻辑思维与问题解决能力，沟通表达清晰，学习能力强，细心严谨，有责任心。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.63832+00'::timestamptz,'7665618172833499445') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent服务端研发工程师 - 开发者服务',NULL,'北京 / 上海 / 杭州 / 深圳 / 广州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667098583514024245/detail','岗位名称：AI Agent服务端研发工程师 - 开发者服务

岗位职责：
团队介绍：字节跳动开发者服务团队负责公司研发工具与基础设施体系建设，为内部开发者提供覆盖全技术栈的框架、工具和研发体系能力，支撑业务高效稳定迭代。
在此基础上，团队正打造面向全场景的AI Agent平台，将大模型与公司内部工程知识深度结合，覆盖需求分析、编码开发、测试发布、运维治理等软件全生命周期，帮助ByteDancer显著提升生产力，重塑开发者服务的形态与体验。
期待对研发工具体系、AI工程生产力有热情、希望在大规模真实场景中打磨技术的同学加入，与我们一起建设新一代开发者基础设施，共同成长！

1、围绕研发高可用治理，质量保障AI化，研发环境管理等方向进行Agent应用开发工作，推动AI技术在相关场景的落地与突破；
2、参与大模型应用开发全流程，包括但不限于模型接入、AI Agent开发、RAG优化、MCP及工具开发、数据工程等；
3、跟踪AI领域的发展动态，推动Agent应用的持续优化。

岗位要求：
1、2027届获得本科及以上学历，计算机、人工智能、自动化、数学相关专业优先；
2、优秀的代码能力、数据结构和基础算法功底，熟练掌握至少一门编程语言，包括但不限于Python、Java、Go等；
3、了解AI Agent相关技术与设计思想，了解主流AI模型及其应用场景；
4、有从0-1搭建AI Agent应用经验，能够独立完成Agent应用的设计开发者优先；
5、在ACM/ICPC、NOI/IOI、Top Coder、Kaggle等比赛获奖者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.785995+00'::timestamptz,'7667098583514024245') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI全栈开发工程师（客户端方向） - TikTok研发',NULL,'杭州 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667107369742829877/detail','岗位名称：AI全栈开发工程师（客户端方向） - TikTok研发

岗位职责：
团队介绍：TikTok研发团队，旨在实现TikTok业务的研发工作，搭建及维护业界领先的产品。加入我们，你能接触到包括用户增长、社交、直播、电商C端、内容创造、内容消费等核心业务场景，支持产品在全球赛道上高速发展；也能接触到包括服务架构、基础技术等方向上的技术挑战，保障业务持续高质量、高效率、且安全地为用户服务；同时还能为不同业务场景提供全面的技术解决方案，优化各项产品指标及用户体验。 
在这里， 有大牛带队与大家一同不断探索前沿， 突破想象空间。 在这里，你的每一行代码都将服务亿万用户。在这里，团队专业且纯粹，合作氛围平等且轻松。目前在北京，上海，杭州、广州、深圳分别开放多个岗位机会。

1、负责TikTok产品客户端（Android/iOS）的相关工作，涉及领域包括但不限于短视频产品的客户端功能迭代和开发、工程架构、构建工具、研发流程、业务架构、性能与体验等；
2、负责TikTok客户端工程技术改造，提升工程品质和开发效率；
3、在指导下，完成关键问题或技术的探索和攻坚，寻找技术创新点，赋能产品和业务研发。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、扎实的计算机、网络和软件开发相关基础，熟悉或掌握至少一门软件开发语言（例如Java、Kotlin、Objective-C、C++、C、JavaScript）；
3、学习能力强，对客户端开发技术有好奇心，对新兴技术趋势感兴趣；
4、具有较强的学习能力和动手能力，良好的沟通能力和优秀的团队协作能力。

加分项：
1、良好的编程习惯，编码思路清晰；
2、有移动端开发经验；
3、热爱移动端开发，在工程技术上追求。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.710922+00'::timestamptz,'7667107369742829877') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI应用开发工程师（智能客服方向） - TikTok Shop',NULL,'北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667144323682584885/detail','岗位名称：AI应用开发工程师（智能客服方向） - TikTok Shop

岗位职责：
团队介绍：TikTok Shop是以TikTok为载体的内容电商业务，致力于成为用户发现并获取优价好物的首选平台，在直播电商、视频内容电商等多场景下，TikTok Shop希望能为用户提供更个性化、更主动、更高效的消费体验，为商家提供稳定可靠的平台服务，在更多的地区实现没有难卖的优价好物，让美好生活触手可得的使命。我们邀请你来此成长、钻研，发掘无限的潜力，一起应对技术和业务上的挑战。目前团队拥有丰富的国际产品研发经验，包容多元的文化，且在全球设立研发团队，邀请你来一起接受跨国合作的挑战！

1、参与国际电商（TikTok Shop）客服场景下的AI工程化、智能客服建设，设计整体技术方案和落地路径，将AI能力、Agent能力真正融入业务流程；
2、参与客服AI应用相关后端服务的设计、开发、测试与上线，保障系统的稳定性、可扩展性和性能表现；
3、与算法、产品、运营、数据、前端等团队协作，将大模型、机器学习、规则引擎、数据分析等能力应用到真实客服业务流程中，打通业务数据资产与工具链。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程、人工智能、电子信息等相关专业优先；
2、具备扎实的计算机基础，熟悉数据结构、算法、操作系统、计算机网络、数据库等基础知识，熟悉至少一种后端开发语言（如Go/Java/Python/C++等），有良好的编码习惯和工程实践意识；
3、了解AI大模型原理，对Agent相关能力研发有基本认识，在AI Coding或大模型应用开发上有项目/实习实践经验者优先；
4、了解或使用过大模型应用开发框架，对RAG、模型评估、自动化评测框架等有实践经验者加分；
5、具备全栈或后端开发能力，能够将AI能力快速转化为产品特性，具备较强的责任心和自驱力，乐于探索新技术，能够在快速变化的业务和技术环境中持续成长。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.700534+00'::timestamptz,'7667144323682584885') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent开发工程师 - Coze',NULL,'北京 / 上海 / 深圳','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667160543863343365/detail','岗位名称：Agent开发工程师 - Coze

岗位职责：
团队介绍：扣子是新一代开箱即用的 AI Agent 平台，面向个人、团队、企业，提供全面服务。具有多人多 Agent 协作特色功能、专家级编程/视频能力、企业级精选“行业专家”技能，等多项产品优势。同时，扣子支持网页端、电脑桌面端、手机 App 端多端协同，用户可以通过手机，远程指挥电脑工作，同时推进多项复杂任务。加入扣子，在AI赛道上拥有广阔的发展空间！

1、负责AI Agent的架构设计与核心功能开发，包括设计并实现基于LLM的AI Agent核心架构，包括规划、推理、记忆管理、工具使用能力等；集成大模型、图片、视频等多模态能力，增强Agent的多模态交互与理解能力；
2、开发AI Agent与外部环境的交互接口，增强AI Agent能力；关注Agent系统的性能、稳定性、可扩展性和安全性；
3、负责AI Agent的效果评估与优化，包括设计和实施AI Agent的评测和评估方案，量化其效果（如任务完成率、准确性、效率、用户体验等）；持续监控Agent运行表现，分析日志和用户反馈，识别瓶颈和问题；对Agent的提示词、工作流、工具使用、模型选择、模型后训练等进行迭代优化，提升效果和效率。

岗位要求：
1、2027届获得硕士及以上学位，计算机、人工智能、自动化、数学相关专业优先；
2、熟练掌握Python/Golang编程语言，具备扎实的编程技能和算法设计能力；
3、熟悉至少一种主流AI Agent开发框架（如Eino、LangGraph等）；
4、需要有使用LLM进行项目开发和效果调优的经验，需要有直接调用LLM API并调试Prompt和上下文的经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.756906+00'::timestamptz,'7667160543863343365') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent工程师 - 抖音用户增长',NULL,'杭州 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667419628440242485/detail','岗位名称：Agent工程师 - 抖音用户增长

岗位职责：
团队介绍：抖音用户增长（User Growth）负责抖音、今日头条、番茄小说等多个产品的用户增长业务，建立行业领先的增长和营销技术，打造极致的用户体验。加入我们，有机会参与亿级用户场景的开发与架构工作，也有机会从数据出发，利用策略和模型为业务带来更大的助力。

1、构建高效、可靠的AI Agent，精准理解产品的复杂需求，实现自规划、任务拆解及执行；
2、设计高效的Multi-Agent系统，确保多Agent间任务流转高效，上下文管理准确；
3、实现AI支撑企业级、大用户规模C端产品的需求端到端生成；
4、负责研发基于LLM的AI Agent系统，负责构建工程研发不同阶段的Agent；
5、参与探索Multi-Agent协作机制，推动Multi-Agent系统对复杂任务的规划和拆解，对已有人类经验的学习和引用，不断优化Agent解决实际问题的路径和效果。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、扎实的计算机、编程基础，熟悉主流大语言模型的原理及方法；
3、理解Multi-Agent系统、任务分解、自动化规划、Prompt Engineering等技术领域之一或多个，有AI Agent相关实践项目者优先；
4、出色的结构化表达能力，较强的技术敏感度与前瞻性，独立的思考和判断力；
5、热爱AI相关技术，对应用和落地工程感兴趣，富有钻研创新精神。

加分项（具备一项或多项者优先）：
1、拥有大量Prompt实践和优化经验；
2、在国际顶级会议或期刊相关领域有论文发表经历；
3、有Multi-Agent系统搭建实践经验或Agent落地应用经验；
4、对AI driven IDE有大量实践经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.829507+00'::timestamptz,'7667419628440242485') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','导购产品经理 - 抖音电商',NULL,'上海 / 北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667421333009156405/detail','岗位名称：导购产品经理 - 抖音电商

岗位职责：
团队介绍：抖音电商以“总能发现好东西”为主张，致力于成为用户发现丰富好物的首选平台。众多抖音创作者通过短视频、直播、商城等丰富的形式，给用户提供更个性化、更生动、更高效的消费体验。同时，抖音电商积极引入优质合作伙伴，为商家变现提供多元的选择。

1、负责抖音电商导购产品，包括商品详情、购物车、店铺、关注Tab等；
2、深入理解消费者购买决策过程，并优化核心导购链路上的用户体验，对交易转化率提升负责；
3、与直播/视频/商城/搜索各流量场、各个行业运营、B端产品等团队合作，做好需求管理，沉淀通用玩法，协同研发、设计等团队，推动产品快速迭代。

岗位要求：
1、2027届获得本科及以上学历；
2、较强的数据及业务分析能力，善于通过数据分析发现问题并制定相应策略；
3、对用户体验有追求，有良好的同理心；
4、自驱力强，有目标感和责任心强，为了目标坚持不懈，敢于承担和挑战。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.690525+00'::timestamptz,'7667421333009156405') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent开发工程师 - 抖音研发',NULL,'上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667476145728080133/detail','岗位名称：AI Agent开发工程师 - 抖音研发

岗位职责：
团队介绍：抖音研发部门负责多款大型产品的研发，包括但不限于抖音、西瓜视频、汽水音乐。
加入我们，你将有机会参与亿级用户场景的开发与架构工作，使用前沿的技术助力业务一起不断成长。

1、构建高效、可靠的AI Agent，精准理解产品的复杂需求，实现自规划、任务拆解及执行；
2、设计高效的Multi-Agent系统，确保多Agent间任务流转高效，上下文管理准确；
3、实现AI支撑企业级、大用户规模C端产品的需求端到端生成；
4、负责研发基于LLM的AI Agent系统，负责构建工程研发不同阶段的Agent；
5、参与探索Multi-Agent协作机制，推动Multi-Agent系统对复杂任务的规划和拆解，对已有人类经验的学习和引用，不断优化Agent解决实际问题的路径和效果。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、扎实的计算机、编程基础，熟悉主流大语言模型的原理及方法；
3、理解Multi-Agent系统、任务分解、自动化规划、Prompt Engineering等技术领域之一或多个，有AI Agent相关实践项目者优先；
4、出色的结构化表达能力，较强的技术敏感度与前瞻性，独立的思考和判断力；热爱AI相关技术，对应用和落地工程感兴趣，富有钻研创新精神。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.805545+00'::timestamptz,'7667476145728080133') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI短剧内容策略产品 - 番茄小说',NULL,'北京','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7667816003496151301/detail','岗位名称：AI短剧内容策略产品 - 番茄小说

岗位职责：
团队介绍：番茄小说是抖音在 2019 年推出的免费阅读产品，致力于为读者提供优质的阅读体验。番茄小说拥有海量正版小说，涵盖言情、都市、玄幻、悬疑等主流网文类型，以及大量热剧原著和经典出版物，支持用户看书、听书。

1、负责AI短剧从剧本到生产的策略制定、创作者生产流程线上化产品建设，构建AI短剧平台生态指标与监控体系；
2、深入了解AI短剧生产流程，优化创作者的AI Agent/工作流，提升创作者的制作效率，为创作者活跃和优质内容生产负责；
3、建设AI短剧标准化评估模型，协同算法和评估团队完成内容评估模型建设，提升优质内容生产效率和ROI。

岗位要求：
1、本科及以上学历，2年及以上产品经理工作经验；
2、内容感知能力佳，对小说、AI短剧等各类内容产品有深入思考，有To B端产品经验优先；
3、自驱力强，对产品工作充满热情，具备良好的团队协作与执行能力，责任心强；
4、逻辑思维清晰，对数据敏感，具备扎实的数据分析能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 07:43:41.585604+00'::timestamptz,'7667816003496151301') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','营销算法工程师 - TikTok Shop',NULL,'上海 / 北京 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667817420166318389/detail','岗位名称：营销算法工程师 - TikTok Shop

岗位职责：
团队介绍：TikTok Shop 是 TikTok 旗下的内容电商业务，致力于成为用户发现并获取优价好物的首选平台。面向直播电商、视频内容电商、货架电商等多元购物场景，国际电商持续为全球用户提供更个性化、更主动、更高效的消费体验，也为商家提供稳定、可靠、可持续增长的平台服务，推动“新奇好物畅销全球，美好生活触手可得”的使命落地。
目前，国际电商算法团队分布在中国、美国、新加坡等多个国家和地区，深度参与全球化业务建设。加入我们，你将有机会面向全球用户、商家和商品生态，与跨区域的产品、工程、运营和业务团队协作，持续提升商品供给质量、用户购物体验、平台交易效率与履约体验，共同探索内容电商与智能购物的新模式。
Data-国际电商团队是 TikTok Shop 的核心算法技术力量，专注于电商场景下的算法创新与规模化落地，方向包括但不限于：生成式推荐与大规模 Foundation Model、多模态商品理解与内容生成、搜索与导购、智能客服、风控治理、物流履约优化、商家经营智能化，以及 Agentic 智能体在电商全链路中的应用。我们希望通过先进的算法能力，帮助用户更高效地发现感兴趣的商品，帮助商家实现更高质量的经营增长，并持续提升交易各环节的智能化水平。
在这里，你将与一流的产品和技术团队合作，面对复杂且真实的国际化电商挑战，推动前沿技术在大规模业务场景中落地，与团队一起创造更多可能。

1、团队主要负责国际电商全球多区域，包括美国、欧洲、拉美、东南亚等区域的智能营销、用户增长等业务，对电商规模以及用户规模负责；
2、建立用户全生命周期数据和价值体系，解决电商用户增长中的各种核心痛点和业务问题；
3、参与搭建业界先进的在线营销推理算法引擎，打通搜索、推荐、营销场域信号，突破各域独立决策到多域联合决策；
4、负责国际化电商的用户增长和智能营销的业务优化，通过算法优化业务主要预算花钱钱效，包括补贴分发、商品定价、预算分配、流量策略等补贴效率以及流量效率优化业务，促进电商GMV增长。

岗位要求：
1、2027届获得本科及以上学历，人工智能、机器学习、计算机、数学、运筹学相关专业优先；
2、有扎实的算法和数据结构基础，优秀的编码能力；
3、学习能力强，对事物保有好奇心，良好的沟通能力和团队协作能力；
4、有扎实的机器学习算法基础，熟悉机器学习、深度学习、因果推断、强化学习中一项或多项；

加分项：
1、在AI领域顶级会议/期刊上发表过论文，或参加ACM/机器学习类竞赛并获得过好名次的优先；
2、有用户增长、智能营销，广告等相关领域研究或者项目实践，有LTV预估、Uplift、运筹规划、序列建模、多场景建模优化等经验的优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.680883+00'::timestamptz,'7667817420166318389') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','大模型算法工程师 - TikTok Shop',NULL,'北京 / 上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667876761523489077/detail','岗位名称：大模型算法工程师 - TikTok Shop

岗位职责：
团队介绍：TikTok Shop 是 TikTok 旗下的内容电商业务，致力于成为用户发现并获取优价好物的首选平台。面向直播电商、视频内容电商、货架电商等多元购物场景，国际电商持续为全球用户提供更个性化、更主动、更高效的消费体验，也为商家提供稳定、可靠、可持续增长的平台服务，推动“新奇好物畅销全球，美好生活触手可得”的使命落地。
目前，国际电商算法团队分布在中国、美国、新加坡等多个国家和地区，深度参与全球化业务建设。加入我们，你将有机会面向全球用户、商家和商品生态，与跨区域的产品、工程、运营和业务团队协作，持续提升商品供给质量、用户购物体验、平台交易效率与履约体验，共同探索内容电商与智能购物的新模式。
Data-国际电商团队是 TikTok Shop 的核心算法技术力量，专注于电商场景下的算法创新与规模化落地，方向包括但不限于：生成式推荐与大规模 Foundation Model、多模态商品理解与内容生成、搜索与导购、智能客服、风控治理、物流履约优化、商家经营智能化，以及 Agentic 智能体在电商全链路中的应用。我们希望通过先进的算法能力，帮助用户更高效地发现感兴趣的商品，帮助商家实现更高质量的经营增长，并持续提升交易各环节的智能化水平。
在这里，你将与一流的产品和技术团队合作，面对复杂且真实的国际化电商挑战，推动前沿技术在大规模业务场景中落地，与团队一起创造更多可能。

1、大模型算法研发：构建电商领域的大模型LLM底座，融合电商的知识，快速落地电商业务，例如：沉淀电商大模型预训练链路，研发电商NLP大模型，或者研发电商图文或者视频多模态大模型；
2、基础算法研发：持续建设和深耕NLP/CV/多模态基础预训练算法（BERT类算法），例如：沉淀&优化电商场景的预训练模型，包括超长文本/口语文本预训练，电商图片/视频自监督，适配电商商品的多模态表征学习等；
3、梳理&沉淀算法库，抽象算法接口，最大化提高算法/预训练模型的复用率，同时优化数据采集&模型训练&部署&推理的流程，提升研发效率；
4、技术输出：定期分享SOTA模型，赋能电商甚至公司级别的业务BU，沉淀专利和论文。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、有好奇心，对AI技术充满热情，在AI系统作品（基模/Agent/评测等）优先；
3、实践动手能力强，有ACM、ICPC、NOI/IOI、Top Coder、Kaggle等高水平比赛获奖经历者优先；
4、有高水平论文发表经历者优先，包括但不限于ACL、EMNLP、COLING、WWW、AAAI等；
5、具备良好的工程实践能力，有较好的编程功底。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.599583+00'::timestamptz,'7667876761523489077') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent开发工程师 - AI Platform',NULL,'上海 / 北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667885791859837237/detail','岗位名称：Agent开发工程师 - AI Platform

岗位职责：
团队介绍：AI Platform 团队，隶属于产品研发和工程架构部门。面向公司内部各业务线，建设统一的AI 应用基础设施和工程平台，帮助业务高效、稳定地落地大模型应用，加速 AI 产品创新。
在平台产品侧，团队打造了新一代AgentOps平台，提供 Prompt Engineering、Agent观测、评测、数据处理、模型微调等 Agent 全生命周期解决方案，帮助Agent开发者构建效果调优的数据飞轮。产品也已成功推出商业化版本。
AI Platform 团队还持续孵化多种面向内部与外部场景的AI应用创新产品，积极探索大模型应用的技术发展。团队氛围好，发展空间大，欢迎加入！

1、基于业务场景核心诉求，主导Agent架构设计、深度迭代与落地，适配复杂业务需求，解决Agent工程化落地的核心痛点；
2、设计并落地Agent自进化全链路体系，构建自主反思、迭代优化的闭环能力，实现Agent基于业务反馈的持续能力升级；
3、打磨Agent任务拆解、推理规划、工具调用、多智能体协作等核心模块，持续优化架构性能，沉淀业务场景最佳实践；
4、跟进Agent领域前沿技术，开展自进化、多模态智能体等方向的技术预研，结合业务完成创新落地，提升核心竞争力。

岗位要求：
1、2027届获得本科及以上学历，计算机、人工智能、自动化、数学相关专业优先；
2、精通Go、Python、C++等一种或多种编程语言，具备扎实的编程技能和算法设计能力；
3、对AI Agent技术有深入了解，熟悉LangChain等框架，熟悉LangSmith等平台；
4、具备出色的团队协作精神和良好的英文阅读及沟通能力。

加分项：
1、在LLM工程领域有落地经验；
2、对AgentOps平台熟悉，如LangSmith、Langfuse等；
3、具备优秀的研究和探索精神，对最新Agent技术趋势和论文有深入的了解。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.683686+00'::timestamptz,'7667885791859837237') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent自进化算法工程师 - AI Platform',NULL,'上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667888717122963765/detail','岗位名称：Agent自进化算法工程师 - AI Platform

岗位职责：
团队介绍：AI Platform 团队，隶属于产品研发和工程架构部门。面向公司内部各业务线，建设统一的AI 应用基础设施和工程平台，帮助业务高效、稳定地落地大模型应用，加速 AI 产品创新。
在平台产品侧，团队打造了新一代AgentOps平台，提供 Prompt Engineering、Agent观测、评测、数据处理、模型微调等 Agent 全生命周期解决方案，帮助Agent开发者构建效果调优的数据飞轮。产品也已成功推出商业化版本。
AI Platform 团队还持续孵化多种面向内部与外部场景的AI应用创新产品，积极探索大模型应用的技术发展。团队氛围好，发展空间大，欢迎加入！

1、负责Agent自进化平台能力建设，基于已具备的Trace采集能力，设计并实现「评测→归因→分析→优化→再评测」的通用自动迭代循环，使多个业务线能基于自身Trace数据实现Agent的持续自进化，而非仅输出优化建议；
2、建设通用化Agent评测与归因分析引擎，从海量执行Trace中自动识别退化模式、能力短板与优化机会点，并直接驱动优化执行（Prompt自动改写、工具配置调整、记忆策略更新等），执行后自动触发再评测验证优化效果，形成持续迭代循环；
3、探索并沉淀自进化方法论，通过评测归因、对比学习、记忆检索、自动优化等手段实现Agent行为的系统化自动调优，使优化能力从单业务定制走向跨业务通用；
4、与评测平台、Trace分析平台产品团队紧密协作，将上述闭环能力产品化，降低业务接入成本，提升自进化方法的通用性与可迁移性。

岗位要求：
1、2027届获得硕士及以上学位，人工智能、计算机科学、统计学、软件工程等相关专业优先；
2、精通Agent应用开发与调优：具备Agentic框架的实际开发与深度定制经验，熟悉主流Agent范式，在Prompt自动优化、记忆系统设计、上下文管理、工具/Skill调度等方向有深入实践；
3、具备大模型应用认知，熟悉推理流程与能力边界，理解上下文管理、多Agent架构、Agent Teams等核心机制；
4、扎实的机器学习与数据分析能力：熟练使用Python及常用ML库，擅长分类、聚类、归因分析、A/B实验等定量方法，能从海量Trace数据中发现问题模式；
5、熟悉AI Coding工具，能利用AI Agent快速完成探索调研、原型开发与实验验证。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.703791+00'::timestamptz,'7667888717122963765') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent数据&评测工程师 - AI Platform',NULL,'北京 / 上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667950077989980469/detail','岗位名称：Agent数据&评测工程师 - AI Platform

岗位职责：
团队介绍：AI Platform 团队，隶属于产品研发和工程架构部门。面向公司内部各业务线，建设统一的AI 应用基础设施和工程平台，帮助业务高效、稳定地落地大模型应用，加速 AI 产品创新。
在平台产品侧，团队打造了新一代AgentOps平台，提供 Prompt Engineering、Agent观测、评测、数据处理、模型微调等 Agent 全生命周期解决方案，帮助Agent开发者构建效果调优的数据飞轮。产品也已成功推出商业化版本。
AI Platform 团队还持续孵化多种面向内部与外部场景的AI应用创新产品，积极探索大模型应用的技术发展。团队氛围好，发展空间大，欢迎加入！

1、深入探索LLM在编程、个人助理等各种场景中的应用，支持TRAE、扣子等业务的端到端评测工作，参与Agent评测、调优和自迭代等相关工作；
2、制定评测标准，开发评测Agent，建设自动化评测基础设施，同时通过数据分析与算法改进，持续探索创新的评测方法；
3、构建大规模高质量的数据（数据建设、数据抓取与解析、数据合成等），提出更好的Benchmark，度量Agent和模型能力；
4、关注行业动态与技术趋势，及时引入新的技术和理念，协同团队参与校企横向项目、学术论坛会议、发布论文等，协助团队构建学术界影响力。

岗位要求：
1、2027届获得本科及以上学历，计算机科学、人工智能、数学等相关专业优先；
2、具备优秀的编码能力，扎实的数据结构和算法功底，至少熟练掌握C/C++/Go/Python一种开发语言；
3、有Agent开发或复杂场景评测经验者优先，在相关顶级会议发表过论文者优先；
4、具备优秀的学习能力且对探索未知领域有强烈兴趣，具备优秀的问题解决能力与自驱力者优先。','["岗位名称：Agent数据&评测工程师 - AI Platform", "岗位职责：", "团队介绍：AI Platform 团队，隶属于产品研发和工程架构部门", "面向公司内部各业务线，建设统一的AI 应用基础设施和工程平台，帮助业务高效、稳定地落地大模型应用，加速 AI 产品创新", "在平台产品侧，团队打造了新一代AgentOps平台，提供 Prompt Engineering、Agent观测、评测、数据处理、模型微调等 Agent 全生命周期解决方案，帮助Agent开发者构建效果调优的数据飞轮", "产品也已成功推出商业化版本", "AI Platform 团队还持续孵化多种面向内部与外部场景的AI应用创新产品，积极探索大模型应用的技术发展", "团队氛围好，发展空间大，欢迎加入！"]'::jsonb,'["Agent", "LLM"]'::jsonb,'[]'::jsonb,'["Agent", "LLM"]'::jsonb,'本科及以上','以原始 JD 描述为准','["Agent", "LLM"]'::jsonb,'["Agent 基础与项目实践", "LLM 基础与项目实践"]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.858517+00'::timestamptz,'7667950077989980469') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','虚拟机编译器开发工程师 - Cross Platform',NULL,'杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7667966484363266309/detail','岗位名称：虚拟机编译器开发工程师 - Cross Platform

岗位职责：
团队介绍：字节跳动Cross Platform致力于开发Lynx等业界前沿的应用框架，构建LLM驱动的前沿系统和基础设施，提升开发者和用户体验。

1、参与字节跳动内部，JavaScript虚拟机，WebAssembly虚拟机的研发，落地及维护；
2、参与自研语言的设计和研发，包括不限于语法设计，垃圾回收器，汇编解释器，JIT/AOT编译器，运行时标准库，性能和内存调优工具等；
3、参与探索AI时代下，编程语言的设计、研发，与框架团队合作实现落地。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、熟练掌握C++，计算机相关知识基础扎实；
3、有V8/QuickJS/LLVM/JVM开发经验者优先；有自己的语言虚拟机相关的开源项目，或者参与过相关开源项目开发者优先；
4、有积极的学习心态，对新鲜事物怀有好奇，具备对未知领域探索和研究能力，乐于分享；
5、熟悉AI领域主流模型和产品，关注领域内最新进展。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.670047+00'::timestamptz,'7667966484363266309') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent Infra研发工程师 - Commercial AI',NULL,'北京 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668201492008110389/detail','岗位名称：Agent Infra研发工程师 - Commercial AI

岗位职责：
团队介绍：Commercial AI 负责中国交易与广告的to B应用统一模型建设，包含基础模型能力、AI Infra、统一商业数据、评测等方向。

1、探索和构建高效的商业化Agent Infrastructure，优化包括抖音电商、生活服务、广告营销等Agent算法策略和工程架构解决方案，持续探索前沿技术，支撑字节跳动商业化收入增长；
2、设计实现Agent基础架构与相关工具链，包括但不限于Harness Engineering、Agent框架、沙箱与模拟环境、个性化记忆、工具、Skills、自动评估体系等；
3、设计实现商业化内部GPU算力资源管理与调度体系，根据训练、推理、评测等多场景的任务特点，通过优化调度策略与运营机制，持续提升资源的弹性能力和有效利用率；
4、与算法、应用、平台等团队紧密配合，优化Agent研发平台的能力与用户体验，提高研发效率与稳定性；
5、关注AI Agent生态技术发展，持续探索并引入先进的Agent应用技术方案，推动在业务场景中落地。

岗位要求：
1、2027届获得本科及以上学历，计算机等相关专业优先；
2、计算机基础知识扎实，熟悉常见的服务端技术组件，有良好的系统设计能力；
3、编码能力优秀，对代码质量与代码风格有高标准要求，对所熟悉的编程语言有一定的深入了解；
4、了解LLM/Agent相关技术，擅长使用大模型能力辅助解决问题，有LLM/Agent项目与实习经验优先；
5、主动性与自驱力强，对新事物的学习与探索能力强，具备出色的问题分析与解决能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.776607+00'::timestamptz,'7668201492008110389') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent策略工程师 - 飞书 Aily & 妙搭',NULL,'深圳 / 上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668269590400698677/detail','岗位名称：Agent策略工程师 - 飞书 Aily & 妙搭

岗位职责：
团队介绍：飞书一方/官方 Agent开发团队，致力于探Agent在办公、开发等企业生产力场景的应用，目前有Aily、妙搭等AI-Native的产品，覆盖个人提效、团队协作提效、业务提效等场景。 在交付AI-Native产品的同时，我们也致力于打造AI-Native的团队，日常工作中深度拥抱AI，探索更高效的办公模式。

1、参与设计和开发基于LLM的AI Agent系统，包括工具调用、记忆管理等核心模块；
2、探索和优化Agent架构，提升任务规划、推理和执行的效果与可靠性；
3、设计和实施AI应用的评测体系，通过数据驱动持续优化Agent表现；
4、跟进前沿Agent技术，快速原型验证并落地到产品中。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、扎实的算法和数据结构基础，熟练掌握至少一门编程语言；
3、对LLM和AI Agent有浓厚兴趣，动手能力强，有独立完成项目的能力，学习能力优秀；
4、有良好的团队合作精神，有责任心。

以下经历加分：
1、有AI Agent产品的开发或调优经验（如OpenClaw、Claude code、Codex等）；
2、有LLM应用调优经验（效果评测、Prompt优化、模型选型等）；
3、有NLP或大模型相关科研经历。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.723989+00'::timestamptz,'7668269590400698677') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent应用开发工程师 - 飞书多维表格',NULL,'深圳','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668303335674431797/detail','岗位名称：Agent应用开发工程师 - 飞书多维表格

岗位职责：
团队介绍：多维表格是一款无代码搭建平台。凭借强大灵活的数据库、丰富富多样的视图组件、自由高效的自动化与工作流、开放的生态体系,以及专业级的BI仪表盘和应用模式,让每个人都能快速构建属于自己的业务系统。
在此基础上,我们正在全面融合AI,让系统真正具备智能化能力。我们的愿景是：打造下一代办公人的Work OS--一个可以构建任何解决方案的平台，没有边界，没有限制。

1、参与飞书多维表格AI Agent能力研发，让Agent能够理解业务数据、调用工具，并完成真实的业务任务；
2、建设Agent的任务编排、上下文管理、Tool Calling、评测观测及异常恢复等核心能力；
3、负责相关Golang服务的设计与开发，解决大规模数据、多人协同场景下的性能、稳定性和安全问题；
4、探索AI Agent与数据表、工作流、仪表盘等产品能力的结合，推动创意从原型走向真实用户；
5、深度使用AI Coding Agent，持续改进编码、测试、排障和团队研发效率。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、具备扎实的计算机基础和良好的编码能力，熟悉至少一种服务端语言；团队主要使用Golang，了解协议、存储、缓存、并发、安全等Web后端技术；
3、对大模型和AI Agent有热情，愿意主动使用并理解其能力边界；
4、具备产品意识、负责人意识和良好的协作能力，愿意对最终用户体验负责；
5、开发过Agent、MCP、CLI、插件或其他AI应用，有开源项目、个人产品或高质量课程项目；
6、了解Tool Calling、RAG、Agent Runtime、模型评测等相关技术。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.587592+00'::timestamptz,'7668303335674431797') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent安全后端开发工程师 - 飞书',NULL,'上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668304903009257733/detail','岗位名称：Agent安全后端开发工程师 - 飞书

岗位职责：
团队介绍：飞书是字节跳动旗下 AI 工作平台，面向人与agent协作，提供一站式协同办公、组织管理、业务提效工具和深入企业场景的 AI 能力，让 AI 真能用真落地。
从互联网、高科技、消费零售到制造、金融、医疗健康，各行各业先进企业都在飞书落地AI，与飞书共创行业最佳实践。先进团队，AI用飞书。

1、负责飞书IAM（身份与访问管理）领域的服务端研发，包括Agent身份安全、访问控制、权限管理等核心系统；
2、参与Agent安全体系建设，包括Agent访问飞书资源管控、Agent Runtime管控等前沿方向；
3、负责团队服务质量、稳定性，从工具、系统上提升团队开发效率；
4、主要技术栈为Golang，深度使用AI研发工具提升研发效能。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程、网络安全等相关专业优先；
2、较好的产品意识，愿意将产品效果作为工作重要的驱动因素；
3、掌握Web后端开发技术：协议、架构、存储、缓存、安全等；
4、对AI/Agent安全有热情，愿意探索AI时代的新型安全问题；
5、积极乐观，认真负责，乐于协作。','["岗位名称：Agent安全后端开发工程师 - 飞书", "岗位职责：", "团队介绍：飞书是字节跳动旗下 AI 工作平台，面向人与agent协作，提供一站式协同办公、组织管理、业务提效工具和深入企业场景的 AI 能力，让 AI 真能用真落地", "从互联网、高科技、消费零售到制造、金融、医疗健康，各行各业先进企业都在飞书落地AI，与飞书共创行业最佳实践", "先进团队，AI用飞书", "1、负责飞书IAM（身份与访问管理）领域的服务端研发，包括Agent身份安全、访问控制、权限管理等核心系统", "2、参与Agent安全体系建设，包括Agent访问飞书资源管控、Agent Runtime管控等前沿方向", "3、负责团队服务质量、稳定性，从工具、系统上提升团队开发效率"]'::jsonb,'["Agent"]'::jsonb,'[]'::jsonb,'["Agent"]'::jsonb,'本科及以上','','["Agent"]'::jsonb,'["Agent 基础与项目实践"]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.848654+00'::timestamptz,'7668304903009257733') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','全栈开发工程师 - 飞书',NULL,'杭州 / 深圳','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668317078402828597/detail','岗位名称：全栈开发工程师 - 飞书

岗位职责：
团队介绍：飞书是字节跳动旗下 AI 工作平台，面向人与agent协作，提供一站式协同办公、组织管理、业务提效工具和深入企业场景的 AI 能力，让 AI 真能用真落地。
从互联网、高科技、消费零售到制造、金融、医疗健康，各行各业先进企业都在飞书落地AI，与飞书共创行业最佳实践。先进团队，AI用飞书。

1、负责APP的全栈开发（Android/iOS/Harmony/服务端）；
2、负责APP性能和品质体系建设；
3、负责AI在移动端的应用场景研发；
4、参与AI Coding体系搭建，系统性提效。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程等相关专业优先；
2、扎实的数据结构和算法基础；精通至少一门编程语言，包括但不限于：Java、Kotlin、Objective-C、Swift、ArkTs、Rust、C++；
3、热爱计算机科学和技术，对移动产品有浓厚兴趣；
4、对AI技术有浓厚兴趣，持续提升AI认知，有AI Coding/Agent实践经验者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.784161+00'::timestamptz,'7668317078402828597') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI娱乐方向Agent Harness研发工程师 - Flow',NULL,'上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668543382147238149/detail','岗位名称：AI娱乐方向Agent Harness研发工程师 - Flow

岗位职责：
团队介绍：字节跳动Flow产品研发团队，专注研究AI智能化相关业务落地，目前落地豆包、Dola等APP，以及对应的Bot开发平台等AI智能化创新产品，业务和团队均处于快速发展期，成长空间大，欢迎各位同学加入！

1、参与AI娱乐/陪伴场景下的Agent Harness系统设计与开发，在导师指导下完成智能体规划、工具编排、RAG增强、长上下文管理、任务调度等核心模块的迭代与优化；
2、参与Agent效果评估和质量保障工作，协助设计场景化评测用例与数据集，支持自动化评测流水线、版本回归与A/B实验，让模型和Agent的迭代效果可量化、可溯源；
3、参与Agent全链路可观测相关工具的开发，包括执行轨迹追踪、结构化日志、性能监控与异常告警，协助改进调试工具与链路回放工具，提升问题排查效率；
4、结合内部真实任务与用户反馈，参与Harness产品的持续迭代，并协助维护相关技术文档与链路。

岗位要求：
1、2027届获得本科及以上学历，计算机、人工智能等相关专业优先；
2、对Agent及其工程化有浓厚兴趣；熟悉TypeScript/JavaScript开发，具备一定的工程模块设计意识；了解Go或其它至少一门后端语言，有能力搭建简单的服务与API；
3、对LLM与Agent的基本机制与原理有初步了解（如LLM API、Agent Loop、Tool Use、Planning、Memory、RAG、MCP等概念）；
4、是AI Agent产品的深度使用者（如Codex、Claude Code、Cursor、OpenClaw、Manus、Cowork等），并已经把它们融入到自己的学习或生活中；
5、具备良好的沟通与团队协作意识，乐于在导师带领下共同成长。

【加分项】
1、有AI行业实习、创业或开源项目经验，尤其是Agent相关的0-1项目实践；
2、作为团队或个人开发者快速迭代产品的经历（如独立作品、黑客松项目等）；
3、参与开源社区，有个人作品或贡献记录；
4、学习能力强，能够借助AI辅助，在缺乏直接经验的领域（如新语言、新框架）快速上手并系统性学习。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.745419+00'::timestamptz,'7668543382147238149') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent开发工程师 - 豆包',NULL,'上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668616776146487605/detail','岗位名称：Agent开发工程师 - 豆包

岗位职责：
团队介绍：字节跳动Flow产品研发团队，专注研究AI智能化相关业务落地，目前落地豆包等APP，以及Bot开发平台等AI智能化创新产品。其中，豆包是一款基于字节自研模型的AI智能助手，能为你答疑解惑，查询信息，提供灵感，辅助创作，也可以和你聊任何感兴趣的话题。业务和团队均处于快速发展期，成长空间大，欢迎各位同学加入！

1、负责豆包创意Agent技术研发，提升大模型在创意场景的应用能力，包括Multi-Agent框架、评测机制等基础能力建设；
2、探索Agent方向的创新方法与技术，提出更先进的Agent范式，引领行业技术发展；
3、探索面向Agent的评估方法，构建豆包的Agent评估体系；
4、设计并实现易用高效的Agent开发周边套件工具，提升开发效率，降低使用Agent技术的门槛，保障交付质量。

岗位要求：
1、2027届获得本科及以上学历，计算机相关专业优先；
2、熟练掌握Python/Java/Go等至少一门语言，有项目开发经验者优先；
3、对大模型有深入理解，熟悉LLM技术原理与应用方法，有Agent系统设计与实现经验；了解Memory机制、RAG、工具调用、规划执行等Agent关键技术，有相关实践经验；
4、深入理解Agent相关技术方法，具备强化学习、规划算法实践经验者加分；
5、对AI原生应用有热情，具备快速复现论文及工程化能力，顶会论文或开源项目贡献者加分。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.767208+00'::timestamptz,'7668616776146487605') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包大模型Agent算法研究员 - Data AML',NULL,'上海 / 北京 / 深圳 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668622489120688389/detail','岗位名称：豆包大模型Agent算法研究员 - Data AML

岗位职责：
团队介绍：Data AML是字节跳动的机器学习中台，为抖音/今日头条/西瓜视频等业务提供推荐/广告/CV/语音/NLP的训练和推理系统。为公司内业务部门提供强大的机器学习算力，并在这些业务的问题上研究一些具有通用性和创新性的算法。同时，也通过火山引擎将一些机器学习/推荐系统的核心能力提供给外部企业客户。

1、面向真实生产力场景，探索和提升大模型Agent的核心智能能力，让Agent能够更自主、可靠地完成复杂工作；方向覆盖General Agent、Coding Agent及其交叉场景；
2、围绕真实高价值任务开展Agent能力优化，包括但不限于：
1）搜索调研、信息处理、数据分析等复杂知识工作；
2）代码理解、代码生成与修改、测试、Debug、Repo-level软件工程任务；
3）跨工具、跨步骤、长程复杂任务中的规划、执行、验证与动态调整；
3、围绕Agent核心能力和训练方法开展研究与优化，包括但不限于：
1）Planning、Tool Use、Context Management、Memory、Verification；
2）指令与格式遵循、事实性与幻觉治理；
3）Long-horizon Agent、错误恢复与自我纠正；
4）大规模任务与环境构造、Trajectory生成与筛选；
5）Reward/Verifier、强化学习、Self-improvement等训练方法；
4、从真实职业和工作流出发，系统梳理高价值任务，例如研究、数据分析、投资分析、软件开发等，将真实工作转化为可训练、可评测、可规模化的Agent任务与环境；
5、深入分析Agent的执行轨迹和失败模式，建立从任务与评测、问题定位到数据、训练和系统优化的完整闭环，持续提升Agent在真实任务上的完成能力和泛化能力。

岗位要求：
1、2027届获得本科及以上学历，专业不限；
2、扎实的机器学习/强化学习基础，或优秀的软件工程与系统能力，在Agent、强化学习、代码智能或相关方向有深入积累；优秀的代码和工程能力，熟练使用Python，具备良好的系统调试和复杂工程实践能力，能够独立完成数据分析、环境构建、Agent实验、训练、评测和问题定位；出色的问题分析和解决能力，能够从模型表现和真实任务中发现关键问题，形成靠谱的技术判断，并独立推动方案设计、实验验证和最终落地；对AI的实际效用和突破性应用有热情，自驱力强，愿意挑战开放、复杂、没有标准答案的问题，并关注技术最终能否转化为真实可用的Agent能力；
3、在NeurIPS/ICML/ICLR/ACL/EMNLP等顶级会议发表过相关高质量工作，或主导过有影响力的Agent、模型训练或智能软件系统项目者优先；
4、在ACM/ICPC、NOI/IOI、Top Coder、Kaggle等算法或编程比赛中取得优秀成绩者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.817723+00'::timestamptz,'7668622489120688389') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包大模型Agent Harness算法工程师 - Data AML',NULL,'上海 / 北京 / 深圳 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668635915050912005/detail','岗位名称：豆包大模型Agent Harness算法工程师 - Data AML

岗位职责：
团队介绍：Data AML是字节跳动的机器学习中台，为抖音/今日头条/西瓜视频等业务提供推荐/广告/CV/语音/NLP的训练和推理系统。为公司内业务部门提供强大的机器学习算力，并在这些业务的问题上研究一些具有通用性和创新性的算法。同时，也通过火山引擎将一些机器学习/推荐系统的核心能力提供给外部企业客户。

1、参与火山方舟Managed-Agent相关的算法研发工作，参与方舟自有Harness的技术架构选型、设计、优化；
2、优化方舟自有Harness，包括但不限于Harness的运行模式、Buildin-Tools、Context机制、Multi-Agent协作调度、智能的辅助能力（模型选择、Advisor、Grader、Rlaphloop等等）；
3、和评测团队一起构建面向Harness迭代的Agent评测，构建全面、有效的Agent Harness端到端评测；
4、定义和实现Harness领域的前沿创新，与模型团队深度合作，参与实现模型与Harness的共同进化，从Harness的角度实现Harness与模型的深度适配。

岗位要求：
1、2027届获得本科及以上学历，专业不限；
2、对Agent Harness有技术热情，对大模型和Agent有较深入的理解，有Agent Harness的优化经验；有使用AI Agent工具进行软件开发的经验；在软件开发领域具有较强的学习能力；能够在AI辅助下，进行有质量保证的编程工作；
3、了解模型和Agent Harness的基本机制及其技术原理（如LLM API、Reasoning、KV Cache、ToolUse、Skills、ReAct、Multi-Agent、MCP、A2A、FunctionCalling）；
4、了解和Agent评估方法、Agent构建、RAG检索技术等；
5、了解流行的各类Agent应用的原理和实现细节，如：OpenClaw、HermesAgent、Codex、ClaudeCode、Managed-Agents。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.734777+00'::timestamptz,'7668635915050912005') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent开发工程师 - Commercial AI',NULL,'北京 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7668701836570806581/detail','岗位名称：AI Agent开发工程师 - Commercial AI

岗位职责：
团队介绍：Commercial AI 负责中国交易与广告的to B应用统一模型建设，包含基础模型能力、AI Infra、统一商业数据、评测等方向。

1、作为广告商家服务方向的大模型算法团队成员，致力于打造广告与经营垂直领域内的Agent，给客户带来全生命周期的一体化服务，助力商家的经营与成长；
2、产品以抖音商家中心为统一门户，串联电商、本地生活、广告等多业务域的账户、数据与能力，目标是让企业从“人工驱动”升级为“Agent驱动”，实现ROI与利润规模的双重提升；
3、从商家在字节跳动的经营与营销场景切入，围绕商家的主要工作场景，打造To B企业一站式AI工作台，辅助商家完成经营策略的制定与执行落地；
4、不仅要以AI赋能日常工作，更要以Agent为核心驱动日常工作；不强调职能边界，每一个人都希望是全能型人才，不再强调传统的算法与工程的区分，也不再强调产品与研发的边界；只要是围绕产品目标与迭代效率，有想法就直接去端到端实现。

岗位要求：
1、2027届获得本科及以上学历，机器学习、人工智能、数理统计等相关专业优先；
2、了解LLM/Agent领域经验，对复杂系统架构设计、Agent开发、LLM Post-Training、RL等方向中的至少一个有专精和深入的实践经验；
3、熟悉大模型应用算法能力优先，包括并不限于SFT、RAG、Agent、PE等；
4、优秀的代码工程能力、数据结构和基础算法功底，有良好的系统设计能力；
5、有熟练的Agent使用经验，需要有各类Agent产品渗透在个人的日常学习与工作中；
6、擅长多人合作，也能独立作战，有激情、勇于克服困难、乐于挑战、快速尝试，乐于了解业务知识，具有良好的团队合作意识、理解沟通能力以及独立解决问题的能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.796682+00'::timestamptz,'7668701836570806581') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI产品经理 - TikTok直播',NULL,'北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7669679804113504517/detail','岗位名称：AI产品经理 - TikTok直播

岗位职责：
团队介绍：TikTok是一个覆盖150个国家和地区的国际短视频平台，我们希望通过TikTok发现真实、有趣的瞬间，让生活更美好。TikTok在全球各地设有办公室，全球总部位于洛杉矶和新加坡，办公地点还包括纽约、伦敦、都柏林、巴黎、柏林、迪拜、雅加达、首尔和东京等多个城市。

TikTok直播是全球领先的直播业务，以实时互动为核心，提供多元化的商业化模式和创作工具。我们为用户提供独特的内容和消费体验；为创作者找到合适的观众，提供最好的工具和一系列盈利模式，帮助创作者创造更多机会、改变他们的生活；通过直播，平台也能从中获得健康、客观的商业化收益，持续发展。我们一直听到这样的故事 —— “LIVE changes my life” —— 他们更好，我们才会更好。

加入我们，一起探索 “不可能的事”—— 我们是行业的先行者，在一步步改变行业。我们持续让行业了解直播是一种新的内容形式，是创作者可以依赖的商业模式。

1、深度参与AI在直播场景的落地，与产品、数据分析、设计、研发团队紧密合作；
2、通过AI相关技术，负责AI礼物、AI互动玩法等营收玩法设计及落地，并结合大模型对生成效果评测，提升交付结果质量；
3、通过数据分析的能力，洞察各国当地情况和不同层级付费用户的付费动机，进行持续迭代；
4、产出高质量的需求并推动方案落地，协调各方资源，推动其他相关部门紧密合作，促进直播业务和其他业务的协同发展。

岗位要求：
1、2027届获得本科及以上学历；
2、熟悉国内外主流直播产品，或有内容相关经验优先，有AI产品相关经验优先，有创新的动力与激情；
3、对AI有热情，对全球的AI产品有了解和使用，了解基础的大模型训练原理；
4、具备敏锐的需求洞察力、强烈的自驱力、有责任感，喜欢挑战和追求；
5、具有良好的英语听写能力和沟通能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.773936+00'::timestamptz,'7669679804113504517') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','数据科学 - TikTok',NULL,'上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7669682046642293045/detail','岗位名称：数据科学 - TikTok

岗位职责：
团队介绍：TikTok是一个覆盖150个国家和地区的国际短视频平台，我们希望通过TikTok发现真实、有趣的瞬间，让生活更美好。TikTok在全球各地设有办公室，全球总部位于洛杉矶和新加坡，办公地点还包括纽约、伦敦、都柏林、巴黎、柏林、迪拜、雅加达、首尔和东京等多个城市。

1、根据TikTok业务目标，设计合理的分析框架、指标体系，评估业务表现；搭建数据指标报表，监控指标变化，并对异动进行归因分析；
2、分析用户行为数据，挖掘产品体验、推荐策略的优化点，与产品经理、算法工程师合作改进用户体验；
3、通过科学的A/B实验设计和结果分析，验证业务假设、评估优化收益；
4、研究因果推断方法，结合业务实际问题，形成合理的落地方案；
5、负责数据清洗与预处理，对来自不同源头的原始数据进行清洗、格式化和标准化，确保数据质量；协助从数据中提取关键特征，根据分析模型要求进行数据标注和整理，为后续建模和分析做准备；进行探索性数据分析，生成基础统计报告和数据可视化图表，帮助团队快速理解数据概况。

岗位要求：
1、2027届获得本科及以上学历，统计学、数据科学、经济学、计算机科学、数学或相关专业优先；
2、熟悉常用的统计分析方法，熟练使用SQL、Python/R等编程语言，有使用Pandas等数据处理库的经验者优先；了解机器学习、推荐算法原理，有实习经验优先；
3、优秀的思维逻辑，善于分析问题和解决问题，良好的沟通协作能力，对于挑战充满热情；对数字敏感，对分析工作有热情，相信数据驱动的价值；良好的沟通能力、团队合作精神和主动意识；具备快速学习新知识和技能的能力，对解决挑战性问题充满热情；工作细致、有耐心，对数据质量有高度的责任心。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.76473+00'::timestamptz,'7669682046642293045') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','直播产品运营 - TikTok直播',NULL,'北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7669697495853238581/detail','岗位名称：直播产品运营 - TikTok直播

岗位职责：
团队介绍：TikTok是一个覆盖150个国家和地区的国际短视频平台，我们希望通过TikTok发现真实、有趣的瞬间，让生活更美好。TikTok在全球各地设有办公室，全球总部位于洛杉矶和新加坡，办公地点还包括纽约、伦敦、都柏林、巴黎、柏林、迪拜、雅加达、首尔和东京等多个城市。

TikTok直播是全球领先的直播业务，以实时互动为核心，提供多元化的商业化模式和创作工具。我们为用户提供独特的内容和消费体验；为创作者找到合适的观众，提供最好的工具和一系列盈利模式，帮助创作者创造更多机会、改变他们的生活；通过直播，平台也能从中获得健康、客观的商业化收益，持续发展。我们一直听到这样的故事 —— “LIVE changes my life” —— 他们更好，我们才会更好。

加入我们，一起探索 “不可能的事”—— 我们是行业的先行者，在一步步改变行业。我们持续让行业了解直播是一种新的内容形式，是创作者可以依赖的商业模式。

1、根据直播营收功能特性及卖点，负责功能教育及宣发方案设计，并与设计、运营、合规等团队推进宣发素材（如H5、视频等）落地，复盘宣发效果；
2、辅助直播营收功能推广活动方案设计，并与产品研发等团队协作推进方案落地；
3、与区域运营密切沟通协作，理解直播营收功能的区域差异，包括分析用户案例、针对指定区域设计特定功能宣发方案。

岗位要求：
1、2027届获得本科及以上学历；
2、具备优秀的策略设计能力和业务理解能力，能够敏锐通过数据波动、业务流程发现推荐策略中的问题，并推动有效解决方案落地；
3、具备较强的项目管理能力，能够精准把握各方需求，高效整合资源，在跨部门协作中应对复杂任务，达成业务目标。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.659358+00'::timestamptz,'7669697495853238581') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','广告算法工程师（流量策略/机制） - Ads Core',NULL,'北京 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7669711027292539141/detail','岗位名称：广告算法工程师（流量策略/机制） - Ads Core

岗位职责：
团队介绍：Ads Core 是抖音集团广告业务体系中负责交易机制与智能决策的核心技术团队之一。
 
我们面对的是一个超大规模的商业化经济系统：一端是广告主和商家，希望在可控成本下获得订单、GMV、线索、用户增长和长期生意增长；另一端是抖音等产品中有限而高价值的用户流量。Ads Core 要解决的问题，是预算从哪里来、流量给到哪里，以及如何让每一次商业流量分配都更接近客户增量、用户体验和平台长期收入的共同最优。
 
团队覆盖出价与竞价、归因与信号、自动化投放、流量机制、激励增长等关键方向，通过机器学习、因果推断、强化学习、机制设计和大规模工程系统，把客户经营目标转化为平台可理解、可执行、可优化的交易决策。
 
技术上，Ads Core 处在超大规模、高并发、强约束的真实交易系统中。我们需要在每天海量请求里完成预算分配、实时出价、归因度量、自动化决策和流量机制优化；也需要在客户目标、用户体验和平台长期收入之间做多目标建模与系统决策。这里会持续产生因果归因、强化学习、机制设计、长期价值建模、大规模在线实验、实时工程系统等高难度问题，并要求算法能力真正落到线上交易链路和业务结果中。
 
加入 Ads Core，你将参与建设抖音集团广告业务最核心的底层系统：让广告主真正把生意做大，让用户体验持续被保护，让平台获得长期、合理、可持续的商业化收入。如果你希望在真实商业系统里把算法、机制和工程能力转化为可见的业务影响，这里会提供足够复杂、也足够有成长空间的问题。

1、参与字节跳动系中国区各APP广告全场景、全链路优化，包括召回/粗排/精排/混排各模块的业务策略优化，构建业界领先的下一代广告投放机制；
2、在海量广告候选下，参与投放系统的在线优化，保证广告客户效果，并不断优化国内多端（抖音、红果短剧、今日头条）多位置下的广告客户投放效率；
3、参与广告、电商、生活服务等交易业务各行业的前沿策略探索，设计和研发合理机制，促进各端LTV提升；
4、深入短剧、激励、直播等特色业务场景下的广告投放机制建设，设计实现交易场景下的召回、排序、计费的系统链路策略，推进中国区交易与广告业务横向场景的快速发展。

岗位要求：
1、2027届获得本科及以上学历，计算机、机器学习和模式识别等相关专业优先；
2、优秀的编程和算法能力，熟悉和精通C++/Python等编程语言，熟悉常见的数据结构和编程算法；
3、扎实的统计学习，深度学习理论基础，在一个或多个领域有深入的研究或实践经验；
4、具备较强的算法设计和建模能力，熟悉机器学习、数据挖掘、NLP、图像、多模态、大模型、数据分析、分布式计算至少某一方面；
5、具备优秀的分析和解决问题的能力，对解决具有挑战的问题充满激情，具备良好的主动性和求知欲，具备良好的沟通协作能力；
6、有国际顶级会议/期刊论文、有GitHub开源作品等公开成果、曾获Kaggle/ACM等算法比赛奖项优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.754372+00'::timestamptz,'7669711027292539141') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','Agent基础系统研发工程师 - 火山方舟',NULL,'上海 / 北京 / 杭州 / 深圳','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7669725958044518661/detail','岗位名称：Agent基础系统研发工程师 - 火山方舟

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、参与火山方舟平台Agent基础系统研发，负责Agent评测框架的设计与建设，沉淀一套可复用、可扩展的评测基础设施；
2、接入SWE-bench、Terminal-Bench、GAIA、τ-bench等业界常用Benchmark，完成任务集管理、执行环境构建、批量调度与自动化评分链路建设；
3、适配主流Agent Harness，抽象统一的接入层与运行协议，支撑不同Agent实现与模型在同一基准下的横向对比；
4、建设评测指标体系与结果分析能力，包括Trace回放、负面案例归因、成本与时延统计等，持续反哺Agent系统的优化迭代；
5、参与内部DevOps Agent建设，围绕代码开发、问题调试、服务部署、技术答疑等场景持续迭代工具链与知识沉淀，提升团队研发效率；同时作为Agent基础能力的深度使用者，反向驱动平台能力打磨。

岗位要求：
1、2027届获得本科及以上学历，计算机及相关专业优先；
2、熟练掌握Python或Golang，具备扎实的代码功底和良好的工程规范意识，熟练使用AI Coding工具；
3、理解大模型与Agent技术原理，熟悉工具调用、上下文管理、长程执行等关键机制，有实际使用Claude Code、Codex、Cursor等Coding Agent的经验；
4、熟悉Linux与容器化技术（Docker/Kubernetes），了解CI/CD流程，能够独立搭建和维护可复现的执行环境；
5、符合以下任一方向者优先：
1）有Benchmark复现、模型或Agent评测、数据分析相关经验；
2）有开源项目贡献、Hackathon获奖、个人Agent项目等经历；
3）具备顶会论文或前沿论文的快速复现能力；
6、对AI原生应用有强烈热情，关注前沿技术发展，具备较强的主动性与问题拆解能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.664313+00'::timestamptz,'7669725958044518661') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','大数据开发工程师 - 风控',NULL,'深圳 / 北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7669741867290921269/detail','岗位名称：大数据开发工程师 - 风控

岗位职责：
团队介绍：风控团队由算法、工程、产品三大团队协同构成，为抖音、今日头条、豆包、剪映等字节跳动业务的内容、交易、流量、账号场景提供智能风控，服务十亿级用户；场景对抗性极强、推理链路长、多模态数据海量，是 AI 时代最有挑战的实战领域之一。算法团队推进 LLM/MLLM 与 Agentic AI 的工业化落地，构建下一代智能风控基建；工程团队依托高并发、大数据与大模型，搭建端云一体的多层对抗体系与情报预警；产品团队评估业务风险、制定策略、探索 AI 在风控中的边界。三线协同，打造高效、前瞻的智能风控防线。

1、参与抖音、今日头条等字节跳动全系产品的风控场景数据建设与数据服务研发；
2、面向千亿级日增量的海量用户行为数据，参与大数据存储、计算、查询链路的设计与实现；
3、负责大规模实时/离线数据的接入、清洗、转换、计算与加工，搭建风控实时数仓；
4、结合AI Agent技术，实现数据开发、运维与分析场景的智能化、自动化，提升数据体系整体研发与运营效能。

岗位要求：
1、2027届获得本科及以上学历，计算机、通信等相关专业优先；
2、熟练掌握至少一门开发语言（Java/Python/C++），具备良好编码能力与线上问题排查能力；
3、熟悉Flink、Spark、Kafka、Hive、ClickHouse、HBase、ES等大数据栈中的一项或多项；
4、对AI Agent、智能决策、自动化风控有兴趣，了解数据如何支撑大模型/Agent优先；
5、对开源社区有过贡献者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.569221+00'::timestamptz,'7669741867290921269') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','大模型Agent Infra工程师 - 模型数据工程',NULL,'北京 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7670043468333746485/detail','岗位名称：大模型Agent Infra工程师 - 模型数据工程

岗位职责：
团队介绍：数据工程与平台团队旨在实现人类知识与经验向模型能力的加速迁移。我们从真实场景出发，通过模型短板识别、高质量数据定义、规模化数据生产，提升模型能力。与此同时，团队还致力于依托训练反馈，反哺数据设计，推动系统迭代，构建业内一流的数据工程能力与平台。

1、参与面向大模型数据场景的Agent Infra平台建设，涵盖但不限于Sandbox、Tool Use、Memory、知识库、轨迹管理等核心能力；
2、面向数据合成、标注、评测等业务场景，设计并构建高效、稳定、可扩展的数据生产Workflow；
3、参与平台基础能力建设，持续提升系统在海量并发场景下的稳定性、性能与资源利用效率，完善端到端可观测性体系；
4、参与Agent Runtime、任务编排、状态管理、执行链路治理等方向的研发工作，支撑复杂任务的稳定运行与持续迭代；
5、探索Agent在数据生产平台中的应用，推动系统向更智能、更自动化的方向演进。

岗位要求：
1、2027届获得本科及以上学历，计算机、软件工程、人工智能、自动化等相关专业优先；
2、具备扎实的计算机基础，理解数据结构、算法、操作系统、计算机网络等基础知识；
3、具备良好的编程能力和工程实现能力，熟悉至少一种常用编程语言，如Python、Go或C++；
4、对后端开发、系统设计、平台研发或数据处理有一定理解，对复杂系统和工程问题有持续兴趣；
5、对大模型、Agent Infra等方向有热情，具备较强的学习能力、问题分析与解决能力；
6、具备良好的沟通协作能力和自驱力，能够持续学习和迭代。

加分项：
1、在课程项目、实验室、竞赛、开源或实习中，有服务端开发、虚拟化、容器化、任务调度、分布式系统等相关实践经历；
2、对大模型、Agent、多模态、模型评测、工作流编排等方向有一定了解或实践经验；
3、有搭建工具链、开发平台系统、参与复杂工程项目或优化系统性能与稳定性的经历；
4、有开源贡献、技术竞赛、科研经历或较强的工程作品积累者优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.672977+00'::timestamptz,'7670043468333746485') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI Agent安全研究员 - TikTok研发',NULL,'上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7670376539674708229/detail','岗位名称：AI Agent安全研究员 - TikTok研发

岗位职责：
团队介绍：TikTok研发团队，旨在实现TikTok业务的研发工作，搭建及维护业界领先的产品。加入我们，你能接触到包括用户增长、社交、直播、电商C端、内容创造、内容消费等核心业务场景，支持产品在全球赛道上高速发展；也能接触到包括服务架构、基础技术等方向上的技术挑战，保障业务持续高质量、高效率、且安全地为用户服务；同时还能为不同业务场景提供全面的技术解决方案，优化各项产品指标及用户体验。 
在这里， 有大牛带队与大家一同不断探索前沿， 突破想象空间。 在这里，你的每一行代码都将服务亿万用户。在这里，团队专业且纯粹，合作氛围平等且轻松。目前在北京，上海，杭州、广州、深圳分别开放多个岗位机会。

1、我们是TikTok隐私创新实验室，招聘AI Agent安全研究员，希望开展智能体系统前沿安全问题的研究与实践；
2、基于真实Agent架构和应用场景，识别具有学术价值和实际影响的安全问题；
3、建立Agent安全威胁模型，提出新的攻击方法、防御机制或分析框架；
4、设计并实现Agent系统、攻击环境、数据集和安全评测Benchmark；对不同模型、Agent Framework、工具协议、记忆机制和多Agent架构开展系统性实证研究；
5、在浏览器Agent、代码Agent、企业Agent、研究Agent或多Agent系统中验证研究方法；分析安全性、任务完成率、泛化能力、误报率、延迟和资源成本之间的权衡；
6、将研究成果产出为高水平论文、技术报告、开源项目、Benchmark、数据集或研究原型；推动优秀研究成果应用于真实Agent产品和安全基础设施。

岗位要求：
1、2027届获得硕士及以上学位；
2、在AI Agent、安全、人工智能、系统或隐私领域发表过论文，或有完整论文投稿经历；以主要作者身份完成过研究项目、毕业论文、开源项目、数据集或Benchmark；熟悉大语言模型和AI Agent的基本原理，理解任务规划、工具调用、上下文管理、记忆和多Agent协作机制；
3、具备Agent系统相关研究或实践经验，包括但不限于：LLM Agent或Agent Framework开发；Tool Use、Function Calling或MCP；浏览器Agent、代码Agent或企业自动化Agent；RAG、长期记忆或多Agent系统；
4、有Agent安全攻击、防御、红队评测或安全Benchmark相关研究经历；有真实Agent系统开发、部署、评测或故障分析经验；
5、能够提供可展示的研究产出，例如论文、技术报告、代码仓库、Demo、开源项目或实验结果；熟悉Agent Framework、MCP、RAG、沙箱、权限控制、程序分析、信息流追踪或形式化方法；
6、有安全攻防、漏洞研究、网络安全竞赛或红队实践经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.693786+00'::timestamptz,'7670376539674708229') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包AI大模型评测算法工程师 - 火山方舟',NULL,'北京 / 上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7670457476447684869/detail','岗位名称：豆包AI大模型评测算法工程师 - 火山方舟

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、深入理解豆包AI大模型To B客户需求，将客户反馈转化为评测任务，确保评测结果真实反映客户使用效果，引导模型的方向发展；
2、基于真实业务场景构建端到端评测Pipeline（含Agent工具调用、RAG检索、多轮对话等复合链路）；
3、从实际使用视角设计评测案例——模拟客户真实Workflow，评估模型在完整工作流中的表现；
4、设计Agent和Coding场景的过程评测指标（如工具调用准确率、代码通过率、多步规划成功率等），能拆解模型每一步的效果；
5、实现评测自动化，在AI工具的帮助下，实现To B复杂场景的评测自动化。

岗位要求：
1、2027届获得本科及以上学历，计算机科学、软件工程、人工智能等相关专业；
2、对主流Agent和VibeCoding工具非常熟悉，有丰富的使用经验；
3、对主流大模型（GPT系列、Claude系列、开源模型）有深入使用经验，熟悉各模型能力边界；
4、有数据分析能力，能从评测数据中发现Pattern、定位问题根因；
5、较强的自驱力，能主动提出新的思路，并推动落地执行。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.648761+00'::timestamptz,'7670457476447684869') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','豆包大模型Agent算法工程师（MaaS） - 火山方舟',NULL,'北京 / 上海 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7670459389480716597/detail','岗位名称：豆包大模型Agent算法工程师（MaaS） - 火山方舟

岗位职责：
团队介绍：火山方舟是火山引擎推出的一站式大模型服务平台，是中国大模型市场产品和份额领跑者。平台提供模型推理、评测、精调等全流程服务。方舟搭载了豆包及业界主流大模型，提供丰富的插件生态和AI应用开发服务，并通过稳定可靠的安全互信方案、专业的算法技术服务，全方位保障企业级AI应用落地。

1、参与火山方舟Managed-Agent相关的算法研发工作，参与方舟自有Harness的技术架构选型、设计、优化；
2、优化方舟自有Harness，包括但不限于Harness的运行模式、Buildin-Tools、Context机制、Multi-Agent协作调度、智能的辅助能力（模型选择、Advisor、Grader、Rlaphloop等等）；
3、和评测团队一起构建面向Harness迭代的Agent评测，构建全面、有效的Agent Harness端到端评测；
4、定义和实现Harness领域的前沿创新，与模型团队深度合作，参与实现模型与Harness的共同进化。

岗位要求：
1、2027届获得本科及以上学历；
2、对Agent Harness有技术热情，对大模型和Agent有较深入的理解，有Agent Harness的优化经验；有使用AI Agent工具进行软件开发的经验；在软件开发领域具有学习能力；能够在AI辅助下，进行有质量保证的编程工作；
3、了解模型和Agent Harness的基本机制及其技术原理（如LLM API、Reasoning、KV Cache、ToolUse、Skills、ReAct、Multi-Agent、MCP、A2A、FunctionCalling）；
4、了解和Agent评估方法、Agent构建、RAG检索技术等；
5、了解流行的各类Agent应用的原理和实现细节，如：OpenClaw、HermesAgent、Codex、ClaudeCode、Managed-Agents。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:10.714374+00'::timestamptz,'7670459389480716597') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','AI芯片交付项目经理 - 芯片研发',NULL,'深圳 / 北京 / 西安 / 上海 / 杭州','SOCIAL',$$BYTEDANCE$$,'https://jobs.bytedance.com/experienced/position/7670753662524737845/detail','岗位名称：AI芯片交付项目经理 - 芯片研发

岗位职责：
团队介绍：字节芯片研发团队目前工作主要集中在芯片设计环节，主要围绕字节自身业务展开芯片探索，为字节多项业务的专用场景定制硬件优化，设计多款基于先进半导体工艺的云端复杂芯片，以期提升性能、降低成本。早期若干芯片项目已经进入到量产部署阶段，有多次一版成功的投片经历，所用工艺包含多个主流的先进工艺节点。与基础设施各团队之间工作的整体协同，能更容易和更好地发挥芯片研发的价值。

1、支持芯片软硬件团队项目管理，跨团队协同，能够独立跟进交付排期、识别项目风险、跟进待办事项闭环；
2、负责算力集群交付全流程管理，统筹交付阶段验收、软件部署、联调验证及上线验收，保障集群按期保质交付；
3、负责工具链上层软件的规划、版本管理与发布流程，协调各领域完成版本迭代与线上升级；
4、落地标准化交付SOP，沉淀项目交付模板、故障处理流程，持续优化交付效率与质量；
5、负责项目管理相关流程和平台优化。

岗位要求：
1、本科及以上学历，微电子、计算机等相关专业硕士学位优先；
2、2-4年芯片/服务器/AI算力/云计算项目交付管理经验，有算力集群交付经验者优先；
3、具备工具链上层软件规划、版本管理及发布经验，熟悉软件研发流程与版本管控机制；
4、了解芯片/整机研发与交付流程，有芯片bring-up、整机柜交付相关经验者优先；
5、强沟通能力、学习能力、责任心和问题解决能力；
6、有PMP、Scrum、PRINCE2等证书优先。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:35:22.823886+00'::timestamptz,'7670753662524737845') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','后端开发工程师（数据引擎） - 集团信息系统',NULL,'深圳','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7671169396929022261/detail','岗位名称：后端开发工程师（数据引擎） - 集团信息系统

岗位职责：
团队介绍：集团信息系统部（Corporate Information System） 负责字节跳动企业内信息系统、工具与AI创新应用的整体规划与建设，我们服务全球所有员工与业务单元，覆盖通用办公、人事、财务、法务、采购、审批、职场等核心领域。在AI时代下，我们致力于推动公司组织效率跃升与业务流程变革，我们正用AI重构企业运作的毛细血管：通过系统工具 AI 化与构建企业级 Agent 体系，让系统进化为 “智能助手”，提升全球团队的协同协作与业务运转效率；通过深耕企业上下文建设，实现从端到端业务流的智能化升级与流程再造。在持续激发AI 生产力的同时，部门加强安全、隐私与合规的治理，为公司长远发展保驾护航。

1、参与平台产品的服务端研发工作，推动业务的快速发展和高效迭代；
2、参与系统架构设计、优化，提升系统性能和开发效率，保证设计和编码的质量；
3、协助团队攻克各种高并发、系统解耦等方面的技术难关；
4、参与各专项技术调研，新技术引入等前瞻项目。

岗位要求：
1、2027届获得本科及以上学历，计算机、通信等相关专业优先；
2、热爱AI技术，积极钻研与实践，熟练使用AI Coding编程工具；
3、有扎实的编程能力，有优秀的设计和代码质量；
4、深刻理解计算机原理，有良好的数据结构和算法基础；
5、熟悉MySQL、Redis、消息队列等常用研发组件；
6、积极乐观，责任心强，工作认真细致，有良好的团队沟通和协作能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.744789+00'::timestamptz,'7671169396929022261') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','通用基础模型研究员 - AI for Science',NULL,'深圳 / 上海 / 北京','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7672666057522235701/detail','岗位名称：通用基础模型研究员 - AI for Science

岗位职责：
团队介绍：AI for Science 团队专注于科学计算与物质发现领域的前瞻技术探索，围绕生物和材料领域基础模型、量子化学、AI分子动力学、高通量实验技术等方向，用 AI 推动科学领域的研究范式突破，也在实际应用场景中创造价值。我们希望用 AI 赋能科学，探索 AI 在科研领域的变革，拓展人类认知边界！

1、面向AI for Science领域，特别是AI for Materials领域，研发可跨科学任务、跨材料体系、跨数据模态和跨学科迁移的通用基础模型，探索科学数据统一表征、大规模预训练、材料性质预测与材料候选生成等技术；
2、研究科学多模态学习、大语言模型、图与几何深度学习、生成模型、强化学习等前沿方向，提升模型的泛化能力、数据效率及可扩展性；
3、面向不同材料体系、化学反应等科学对象，融合文献、模拟及实验中的多模态数据，构建统一学习与跨模态对齐方法；
4、与机器学习、计算化学和材料高通量实验室等跨学科团队协作，开展原创性研究，产出具有行业影响力的算法、系统、专利及高水平学术成果。

岗位要求：
1、2027届获得博士学位，计算机科学、人工智能、统计学、应用数学、计算化学、计算物理等相关专业优先；
2、具备扎实的机器学习基础，深入理解深度学习及基础模型相关技术，在以下至少一个方向具备系统研究和成熟成果：大语言模型预训练与后训练、Agent、多模态学习、图与几何深度学习；
3、具备优秀的研究能力和代表性成果，在NeurIPS、ICML、ICLR等机器学习会议，或Nature、Science及其子刊，以及相关领域权威期刊发表过高水平论文；
4、熟悉大规模模型训练、数据工程或模型评测中的一项或多项，有科学基础模型、大语言模型、多模态模型或生成式模型的大规模训练经验，能够推动研究原型向稳定系统演进；
5、具备较强的问题抽象与技术创新能力，能够从复杂科学问题中提炼可计算、可验证的机器学习问题；对AI for Science和通用智能驱动科学发现具有长期热情，具备攻克开放性难题的韧性，以及良好的跨学科沟通与团队协作能力；
6、熟悉分子、材料、化学反应等一种或多种科学数据；在真实工业与科研场景中取得过有影响力的成果；具备模型与实验、计算模拟或科学数据库协同闭环的实践经验。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.731651+00'::timestamptz,'7672666057522235701') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','推荐算法工程师 - 中国交易与广告',NULL,'北京 / 杭州','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7672981062763727157/detail','岗位名称：推荐算法工程师 - 中国交易与广告

岗位职责：
团队介绍：中国交易与广告，基于个性化推荐、深度学习和大模型技术，依托抖音、今日头条、红果短剧、西瓜视频、番茄小说等多元产品，构建抖音电商、生活服务、广告营销等核心营收业务的算法策略和工程架构。部门运用领先的算法能力，精准连接海量用户与商家，通过推荐、广告和搜索算法精准匹配需求并促进交易达成，保障用户体验与商家权益，实现营收业务可持续增长；基于深厚的技术积累，构建高效、智能、可靠的交易与广告产品，全面提升多行业收入变现与市场占有。在这里，你将直面超大规模流量与复杂业务场景的技术挑战，深度应用业界领先的商业模型与算法技术，投身面向未来的数字营销能力建设，持续探索前沿技术。

1、负责推荐系统链路的算法与模型迭代，面向“召回→粗排→精排→重排/混排”的完整流程，持续提升分发效率与用户体验，并对指标（点击、转化、完播/停留、交易价值与长期价值等）负责；
2、建设多路召回与向量检索体系：包括双塔/表征学习、ANN检索、语义召回与多模态召回等方向；结合用户意图、上下文与实时信号，提升覆盖率、相关性与实时性；
3、建设粗排、精排与重排/混排模型体系：以Transformer为核心进行序列建模与交互建模，结合样本/特征/损失设计与训练技巧，在稳定性、鲁棒性与在线收益之间做权衡；在用户体验、商业收益、生态健康与合规约束之间做平衡；结合因果推断、强化学习、约束优化与探索-利用机制，提升长期收益与系统稳定性；
4、推动模型Scaling与训练范式升级：围绕更大规模数据、更长序列、更大模型与更强训练策略（如自监督预训练、多任务学习、蒸馏、对比学习等）实现可控收益，并沉淀可复用的训练与评估方法论；
5、探索生成式推荐与LLM4Rec：将大模型的语义理解与推理能力引入候选生成、召回增强、重排、混排等环节，提升复杂需求理解、冷启动与长尾分发效果；
6、推进推荐工程化落地：构建样本与特征体系、离线训练与在线推理链路，优化时延与成本（量化/蒸馏/剪枝/推理加速、向量服务、特征一致性与可观测性），并通过AB实验与评测体系实现持续迭代闭环。

岗位要求：
1、2027届获得本科及以上学历，计算机、数学、统计学、电子工程或相关专业优先；
2、具备扎实的数据结构、算法与机器学习/深度学习基础，对推荐/广告/搜索等方向至少一个有系统性理解；
3、熟悉主流深度学习框架（PyTorch/TensorFlow等）与常见训练/推理优化方法，具备良好的工程实现能力与代码习惯；
4、具备优秀的数据分析与问题拆解能力，能够从业务目标出发定义指标、定位问题、设计实验并推动上线迭代；
5、对Transformer、序列建模、Embedding/表征学习、向量检索、重排/混排与多目标优化等方向有实践经验者优先；
6、有大规模推荐系统、在线实验、高并发服务、特征工程或样本体系建设经验者优先。

加分项
1、有生成式推荐/LLM4Rec、语义召回、大模型重排、多模态理解或相关方向的落地经验；
2、在顶级会议（CCF-A类，如ICML、NeurIPS、ICLR、AAAI、IJCAI、KDD、RecSys、SIGIR等）发表过论文或有高质量开源贡献；
3、有金融/保险/电商/本地生活/线索经营等复杂交易场景经验，或对合规约束与长周期经营问题有深入理解。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.637354+00'::timestamptz,'7672981062763727157') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','独立端AI效果调优策略运营（抖音AI产品人才校招） - 抖音社交与互动',NULL,'深圳','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7673038467879094533/detail','岗位名称：独立端AI效果调优策略运营（抖音AI产品人才校招） - 抖音社交与互动

岗位职责：
团队介绍：抖音社交与互动团队服务于抖音连接人与人的愿景，希望为用户提供更好的社交、创作体验，以拓宽抖音的使用场景，成为更多人打开和使用抖音的新理由，提升抖音的用户规模。我们是一支有朝气、背景多元的团队，致力为用户提供最佳的产品体验，热衷听取用户声音和反馈，也运用科学严谨的分析方法，仔细衡量我们的工作成果。抖音社交与互动欢迎你的加入，和我们一起做有挑战的事情。

这是抖音面向具备AI能力的同学发起的校招项目，覆盖产品、策略运营方向。
AI 正在重新定义产品，也在重新定义"做产品"这件事 —— AI Native 的产品，需要你既能理解大模型技术边界，又能定义产品价值。
如果你也有着许多的奇思妙想， 欢迎加入抖音，把想法落地成亿万用户真实可感的产品体验，来抖音，和我们一起探索 AI 产品的下一种可能！

1、制定AI产品的效果标准，对理想态进行定义，落地与AI产品相关的玩法；
2、创新并落地社交玩法，搭建适配AI产品的Skills，调优Skill的效果；
3、梳理AI能力的Workflow，跨团队沟通复杂需求并推动推荐需求高标准上线。

岗位要求：
1、2027届获得本科及以上学历；
2、有AI产品运营的相关经验，对AI和社交有热情，具备行业的认知和思考；
3、有优秀的沟通能力、自驱力，善于跨部门沟通，有较强的责任心，敢于担当；
4、有较强的自我驱动和学习能力。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.625157+00'::timestamptz,'7673038467879094533') ON CONFLICT DO NOTHING;
INSERT INTO job_description (user_id,company,job_name,department,city,recruitment_type,source,source_url,raw_content,responsibilities,required_skills,preferred_skills,keywords,education_requirement,experience_requirement,job_focus,interview_topics,status,published_at,last_verified_at,source_job_id) VALUES (1,'字节跳动','行业分析 - 人力与管理部',NULL,'北京 / 上海','CAMPUS',$$BYTEDANCE$$,'https://jobs.bytedance.com/campus/position/7674928224138873141/detail','岗位名称：行业分析 - 人力与管理部

岗位职责：
团队介绍：人力与管理部作为公司的职能部门之一，助力字节跳动从一家创业公司发展成为拥有超过十万名员工的全球化公司。人力与管理部以“释放人才成长力，激发组织生命力”为使命，在组织、人才、文化等方面持续像打造产品一样打造公司，推动业务成长。

1、以数据为核心驱动力，深入组织与人才管理的关键议题，通过诊断分析与解决方案设计，支撑人力资源战略决策；兼具数据硬实力与业务敏锐度，将复杂组织问题转化为可执行、可衡量的行动方案；
2、组织与人才诊断：深入理解业务战略，识别业务人力投入、组织效能、人才结构中的关键问题，输出诊断报告；
3、分析模型构建：搭建并迭代组织人力相关的分析模型，建立核心指标体系与动态校准机制；
4、解决方案设计与落地：设计优化方案，跨部门推动执行，跟踪效果并闭环迭代；
5、数据产品与工具建设：搭建人才数据分析看板，探索AI工具在组织变革中的应用；
6、人才市场洞察：深入市场调研，研究组织内外及行业趋势，支撑人才规划、结构配置与前沿布局。

岗位要求：
1、2027届获得本科及以上学历；
2、有People Analytics/商业分析/管理咨询相关经验，熟练使用SQL、Python、BI等工具，数据敏感度好，能独立完成数据提取到洞察输出全流程；
3、结构化思维强、有优秀的信息提炼能力，能从业务目标出发拆解问题、产出可落地方案；
4、出色的跨部门沟通与项目推动力，能推动组织与流程变革；
5、对组织管理有好奇心，对复杂系统有研究，能在组织演进中快速成长、开放协作。','[]'::jsonb,'[]'::jsonb,'[]'::jsonb,'[]'::jsonb,NULL,NULL,'[]'::jsonb,'[]'::jsonb,'OPEN',NULL::timestamptz,'2026-08-18 08:50:08.721224+00'::timestamptz,'7674928224138873141') ON CONFLICT DO NOTHING;
