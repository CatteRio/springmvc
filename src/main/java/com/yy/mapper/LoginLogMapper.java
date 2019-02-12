package com.yy.mapper;

import com.yy.pojo.LoginLog;
import org.apache.activemq.leveldb.replicated.dto.Login;

public interface LoginLogMapper {
    /**
     * 查询
     * @param id
     * @return
     */
    LoginLog queryById(Integer id);

    /**
     * 插入一条记录
     * @param loginLog
     */
    void insertByLoginLog(LoginLog loginLog);
}
