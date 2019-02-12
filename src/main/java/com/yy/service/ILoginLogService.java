package com.yy.service;

import com.yy.pojo.LoginLog;
import org.apache.activemq.leveldb.replicated.dto.Login;

public interface ILoginLogService {
    LoginLog queryById(Integer id);

    void insertByLoginLog(LoginLog loginLog);
}
