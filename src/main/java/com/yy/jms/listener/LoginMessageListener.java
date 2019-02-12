package com.yy.jms.listener;

import com.yy.pojo.LoginLog;
import com.yy.service.ILoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

@Component
public class LoginMessageListener implements MessageListener {
    @Autowired
    ILoginLogService loginLogService;

    @Override
    public void onMessage(Message message) {
        ObjectMessage message1 = (ObjectMessage) message;
        try {
            LoginLog log = (LoginLog) message1.getObject();
            loginLogService.insertByLoginLog(log);
        } catch (JMSException e) {
            e.printStackTrace();
        }
    }
}
