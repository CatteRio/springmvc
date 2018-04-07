package com.yy.controller;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.service.impl.UserServiceImpl;
import com.yy.utils.CommonUtils;
import com.yy.utils.Reply;

@Controller
@RequestMapping("/admin")
public class LoginController {

	
	@Autowired
	private IUserService userSerive;
	
	
	@RequestMapping("/loginProcess.do")
	@ResponseBody
	public Reply loginProcess(User user, String captcha, Model model, HttpSession session) {
		String sessionCaptcha = (String) session.getAttribute("captcha");
		if (sessionCaptcha == null || !sessionCaptcha.toLowerCase().equals(captcha.toLowerCase())) {
			return Reply.error("验证码错误");
		}
		if (isRelogin(user)) {
			return Reply.ok("已经登陆的用户");
		}
		UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(),user.getPassword().toCharArray(),
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
		return Reply.ok("登陆成功");
	}

	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public ModelAndView register(Model model) {
		return new ModelAndView("register");
	}

	private boolean isRelogin(User user) {
		Subject us = SecurityUtils.getSubject();
		if (us.isAuthenticated()) {
			return true; // 参数未改变，无需重新登录，默认为已经登录成功
		}
		return false; // 需要重新登陆
	}

}
