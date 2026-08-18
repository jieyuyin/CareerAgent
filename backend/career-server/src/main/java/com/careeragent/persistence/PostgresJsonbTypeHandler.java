package com.careeragent.persistence;

import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import java.lang.reflect.Field;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import org.apache.ibatis.type.JdbcType;

public class PostgresJsonbTypeHandler extends JacksonTypeHandler {
    public PostgresJsonbTypeHandler(Class<?> type) {
        super(type);
    }

    public PostgresJsonbTypeHandler(Class<?> type, Field field) {
        super(type, field);
    }

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType)
            throws SQLException {
        ps.setObject(i, toJson(parameter), Types.OTHER);
    }
}
