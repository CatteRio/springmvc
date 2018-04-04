package com.yy.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.utils.Reply;

/**
 * @author Rio
 * @Date 2018年4月3日 下午4:41:51
 */

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;
	@RequestMapping("/update.do")
	@ResponseBody
	public Reply update(User user) throws Exception {
		User currentUser = (User) SecurityUtils.getSubject().getPrincipal();
		currentUser.setUsername(user.getUsername());
		currentUser.setNickname(user.getNickname());
		userService.updateUser(currentUser);
		return Reply.ok("更新成功");
	}

}
