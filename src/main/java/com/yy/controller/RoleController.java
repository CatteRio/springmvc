package com.yy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yy.service.IRoleService;
import com.yy.utils.Reply;

/**
 * @author Rio 2018年4月12日下午10:15:19
 */
@RestController
@RequestMapping("/api/role")
public class RoleController {

	@Autowired
	private IRoleService roleService;

	@RequestMapping("/list.do")
	public Reply getRoles() {
		return Reply.ok(roleService.selectAll());
	}

}
