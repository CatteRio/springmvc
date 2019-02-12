package com.yy.controller;

import javax.jms.*;
import javax.servlet.http.HttpSession;

import com.yy.pojo.LoginLog;
import com.yy.utils.ShiroUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.yy.pojo.User;
import com.yy.utils.Reply;

import java.util.Date;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:25
 */
@RestController
@RequestMapping("/api")
public class LoginController {

	@Autowired
	JmsTemplate jmsTemplate;
	@Autowired
	Destination loginTopic;
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public Reply loginProcess(User user, String captcha, Model model, HttpSession session) {
		String sessionCaptcha = (String) session.getAttribute("captcha");
		if (sessionCaptcha == null || !sessionCaptcha.toLowerCase().equals(captcha.toLowerCase())) {
			return Reply.error("验证码错误");
		}
		if (isRelogin(user)) {
			return Reply.ok("已经登陆的用户");
		}
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword().toCharArray(),
				null);
		token.setRememberMe(true);
		try {
			SecurityUtils.getSubject().login(token);
		} catch (UnknownAccountException ex) {
			return Reply.error("用户不存在");
		} catch (IncorrectCredentialsException ex) {
			return Reply.error("密码错误");
		} catch (Exception ex) {
			ex.printStackTrace();
			return Reply.error("内部错误，请重试！");
		}
		//发送消息到消息队列
		jmsTemplate.send(loginTopic, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				LoginLog log =new LoginLog();
				User currentUSer = ShiroUtils.getUser();
				log.setUserId(currentUSer.getId());
				log.setLoginTime(new Date());
				ObjectMessage objectMessage = session.createObjectMessage(log);
				return objectMessage;
			}
		});
		return Reply.ok("登陆成功");
	}

	private boolean isRelogin(User user) {
		Subject us = SecurityUtils.getSubject();
		if (us.isAuthenticated()) {
			return true; // 参数未改变，无需重新登录，默认为已经登录成功
		}
		return false; // 需要重新登陆
	}

}
