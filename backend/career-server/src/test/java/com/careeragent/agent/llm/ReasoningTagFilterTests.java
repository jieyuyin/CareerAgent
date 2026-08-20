package com.careeragent.agent.llm;

import static org.assertj.core.api.Assertions.assertThat;
import java.util.ArrayList;
import org.junit.jupiter.api.Test;

class ReasoningTagFilterTests {
    @Test void removesReasoningTagsSplitAcrossStreamChunks(){var output=new ArrayList<String>();var filter=new ReasoningTagFilter(output::add);filter.accept("<th");filter.accept("ink>您好，请介绍");filter.accept("一下项目</thi");filter.accept("nk>");filter.finish();assertThat(String.join("",output)).isEqualTo("您好，请介绍一下项目");}
    @Test void preservesNormalAngleBrackets(){var output=new ArrayList<String>();var filter=new ReasoningTagFilter(output::add);filter.accept("使用 A < B 的条件");filter.finish();assertThat(String.join("",output)).isEqualTo("使用 A < B 的条件");}
}
