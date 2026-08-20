package com.careeragent.agent.llm;

import java.util.List;
import java.util.function.Consumer;

final class ReasoningTagFilter {
    private static final List<String> TAGS=List.of("<think>","</think>","<thinking>","</thinking>","<analysis>","</analysis>","<reasoning>","</reasoning>");
    private final StringBuilder pending=new StringBuilder();
    private final Consumer<String> sink;

    ReasoningTagFilter(Consumer<String> sink){this.sink=sink;}

    void accept(String value){pending.append(value);drain(false);}
    void finish(){drain(true);}

    private void drain(boolean finishing){
        while(!pending.isEmpty()){
            var start=pending.indexOf("<");
            if(start<0){if(finishing||pending.length()>12)emit(pending.substring(0,finishing?pending.length():pending.length()-12));else return;continue;}
            if(start>0){emit(pending.substring(0,start));continue;}
            var full=TAGS.stream().filter(tag->pending.indexOf(tag)==0).findFirst();
            if(full.isPresent()){pending.delete(0,full.get().length());continue;}
            var partial=TAGS.stream().anyMatch(tag->tag.startsWith(pending.toString()));
            if(partial&&!finishing)return;
            emit(pending.substring(0,1));
        }
    }

    private void emit(String value){if(!value.isEmpty()){pending.delete(0,value.length());sink.accept(value);}}
}
