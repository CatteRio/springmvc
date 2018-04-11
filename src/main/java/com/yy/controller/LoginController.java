package com.yy.controller;

import java.nio.file.attribute.UserPrincipal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.utils.CommonUtils;
import com.yy.utils.PageInfo;
import com.yy.utils.PageReply;
import com.yy.utils.Reply;

@RestController
@RequestMapping("/api")
public class LoginController {

	@Autowired
	private IUserService userService;

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
		return Reply.ok("登陆成功");
	}

	private boolean isRelogin(User user) {
		Subject us = SecurityUtils.getSubject();
		if (us.isAuthenticated()) {
			return true; // 参数未改变，无需重新登录，默认为已经登录成功
		}
		return false; // 需要重新登陆
	}

	@RequestMapping("/user/list.do")
	public PageReply getUserList(int page, int limit, String username) {
		PageInfo pageInfo = new PageInfo();
		if (page <= 0) {
			page = 1;
		}
		int currentResult = (page - 1) * limit;
		pageInfo.setCurrentResult(currentResult);
		pageInfo.setShowCount(limit);
		List<User> userList = userService.getUserListByLimit(pageInfo, username);
		return PageReply.ok(pageInfo.getTotalResult(), userList);
	}

	@RequestMapping("/user/delete.do")
	public Reply deleteUser(User user) {
		if (user.getRole().equals("superadmin")) {
			return Reply.error("无法删除超级管理员");
		}
		userService.deleteUser(user);
		return Reply.ok("删除成功");
	}

	@RequestMapping("/user/deletelist.do")
	public Reply deleteUserList(@RequestBody List<User> users) {
		userService.deleteUserList(users);
		return Reply.ok("删除成功");
	}

	@RequiresRoles(value={"superadmin"})
	@RequestMapping("/user/add.do")
	public Reply addUser(User frontUser) {
		User user = userService.findUserByUserName(frontUser.getUsername());
		if (user != null) {
			return Reply.error("用户名已存在");
		}
		frontUser.setRole("admin");
		frontUser.setSalt(CommonUtils.randomSalt());
		String password = CommonUtils
				.toHex(CommonUtils.digest(CommonUtils.MD5(frontUser.getPassword()), frontUser.getSalt().getBytes()));
		frontUser.setPassword(password);
		userService.saveUser(frontUser);
		return Reply.ok("添加成功");
	}

}
