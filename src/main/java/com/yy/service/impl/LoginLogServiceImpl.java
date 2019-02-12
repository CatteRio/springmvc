package com.yy.service.impl;

import com.yy.mapper.LoginLogMapper;
import com.yy.pojo.LoginLog;
import com.yy.service.ILoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.ServiceMode;

@Service
public class LoginLogServiceImpl implements ILoginLogService {

    @Autowired
    LoginLogMapper loginLogMapper;

    @Override
    public LoginLog queryById(Integer id) {
        return loginLogMapper.queryById(id);
    }

    @Override
    public void insertByLoginLog(LoginLog loginLog) {
        loginLogMapper.insertByLoginLog(loginLog);
    }
}
