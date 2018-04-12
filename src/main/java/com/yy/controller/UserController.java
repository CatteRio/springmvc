package com.yy.controller;

import java.util.List;

import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.utils.CommonUtils;
import com.yy.utils.PageInfo;
import com.yy.utils.PageReply;
import com.yy.utils.Reply;

/**
 * @author Rio
 * @Date 2018年4月3日 下午4:41:51
 */

@RestController
@RequestMapping("/api/user")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequiresRoles(value = { "superadmin" })
	@RequestMapping("/info.do")
	public Reply getUserInfo(int id) {
		User user = userService.findUserById(id);
		if (user == null) {
			user = new User();
		}
		return Reply.ok(user);
	}

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

	@RequestMapping("/delete.do")
	public Reply deleteUser(User user) {
		userService.deleteUser(user);
		return Reply.ok("删除成功");
	}

	@RequestMapping("/deletelist.do")
	public Reply deleteUserList(@RequestBody List<User> users) {
		userService.deleteUserList(users);
		return Reply.ok("删除成功");
	}

	@RequiresRoles(value = { "superadmin" })
	@RequestMapping("/add.do")
	public Reply addUser(User frontUser) {
		User user = userService.findUserByUserName(frontUser.getUsername());
		if (user != null) {
			return Reply.error("用户名已存在");
		}
		// frontUser.setRoleId(1);
		frontUser.setSalt(CommonUtils.randomSalt());
		String password = CommonUtils
				.toHex(CommonUtils.digest(CommonUtils.MD5(frontUser.getPassword()), frontUser.getSalt().getBytes()));
		frontUser.setPassword(password);
		userService.saveUser(frontUser);
		return Reply.ok("添加成功");
	}

	@RequiresRoles(value = { "superadmin" })
	@RequestMapping("/update.do")
	public Reply updateUserInfo(User user) {
		User backUser = userService.findUserByUserName(user.getUsername());
		if (backUser != null && backUser.getId() != user.getId()) {
			System.out.println(backUser.getId());
			System.out.println(user.getId());
			return Reply.error("用户名已存在");
		}
		if (user.getPassword() != null) {
			if (user.getPassword().isEmpty()) {
				user.setPassword(null);
			} else {
				user.setSalt(CommonUtils.randomSalt());
				String password = CommonUtils
						.toHex(CommonUtils.digest(CommonUtils.MD5(user.getPassword()), user.getSalt().getBytes()));
				user.setPassword(password);
			}
		}
		userService.updateUser(user);
		return Reply.ok("修改成功");
	}

}
