package com.yy.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yy.pojo.Role;
import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.utils.CommonUtils;
import com.yy.utils.PageInfo;
import com.yy.utils.PageReply;
import com.yy.utils.Reply;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:42
 */
@RestController
@RequestMapping("/api/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/info.do")
	public Reply getUserInfo(int id) {
		User user = userService.findUserById(id);
		if (user == null) {
			user = new User();
		}
		return Reply.ok(user);
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/list.do")
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

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/delete.do")
	public Reply deleteUser(User user) {
		userService.deleteUser(user);
		return Reply.ok("删除成功");
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/deletelist.do")
	public Reply deleteUserList(@RequestBody List<User> users) {
		userService.deleteUserList(users);
		return Reply.ok("删除成功");
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/add.do")
	public Reply addUser(User frontUser, @RequestParam(value = "roleadd[0]") Integer[] roleadd) {
		User user = userService.findUserByUserName(frontUser.getUsername());
		if (user != null) {
			return Reply.error("用户名已存在");
		}
		List<Role> roleList = new ArrayList<>();
		for (Integer roleId: roleadd) {
			Role role = new Role();
			role.setId(roleId);
			roleList.add(role);
		}
		frontUser.setRoles(roleList);
		frontUser.setSalt(CommonUtils.randomSalt());
		String password = CommonUtils.toHex(CommonUtils.digest(CommonUtils.MD5(frontUser.getPassword()), frontUser.getSalt().getBytes()));
		frontUser.setPassword(password);
		userService.saveUser(frontUser);
		return Reply.ok("添加成功");
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/update.do")
	public Reply updateUserInfo(User user,@RequestParam(value = "roleadd[]") Integer[] roleadd) {
		User backUser = userService.findUserByUserName(user.getUsername());
		if (backUser != null && backUser.getId() != user.getId()) {
			return Reply.error("用户名已存在");
		}
		
		List<Role> roleList = new ArrayList<>();
		for (Integer roleId: roleadd) {
			Role role = new Role();
			role.setId(roleId);
			roleList.add(role);
		}
		user.setRoles(roleList);
		
		if (user.getPassword() != null) {
			if (user.getPassword().isEmpty()) {
				user.setPassword(null);
			} else {
				user.setSalt(CommonUtils.randomSalt());
				String password = CommonUtils.toHex(CommonUtils.digest(CommonUtils.MD5(user.getPassword()), user.getSalt().getBytes()));
				user.setPassword(password);
			}
		}
		userService.updateUser(user);
		return Reply.ok("修改成功");
	}

}
