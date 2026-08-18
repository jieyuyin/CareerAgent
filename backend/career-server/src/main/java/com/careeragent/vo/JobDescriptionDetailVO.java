package com.careeragent.vo;
import lombok.*;
@Data @EqualsAndHashCode(callSuper=true)
public class JobDescriptionDetailVO extends JobDescriptionVO { private boolean hasResumeVersion; private boolean hasApplication; }
