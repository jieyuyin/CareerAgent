package com.careeragent.mapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.careeragent.domain.entity.PendingAction;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.annotations.*;
@Mapper public interface PendingActionMapper extends BaseMapper<PendingAction> {
 @Select("SELECT * FROM pending_action WHERE id = #{id} FOR UPDATE")
 @Results(id="pendingActionResult", value={@Result(column="payload", property="payload", jdbcType=JdbcType.OTHER, typeHandler=PostgresJsonbTypeHandler.class)})
 PendingAction selectByIdForUpdate(@Param("id") Long id);
}
