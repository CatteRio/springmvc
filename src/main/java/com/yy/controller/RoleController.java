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

import com.yy.pojo.Premission;
import com.yy.pojo.Role;
import com.yy.service.IRoleService;
import com.yy.utils.PageInfo;
import com.yy.utils.PageReply;
import com.yy.utils.Reply;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:36
 */
@RestController
@RequestMapping("/api/role")
public class RoleController {

	@Autowired
	private IRoleService roleService;

	@RequestMapping("/all/list.do")
	public Reply getRoles(Integer id) {
		return Reply.ok(roleService.selectAll());
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/list.do")
	public PageReply getRolesLimit(int page, int limit, String role) {
		PageInfo pageInfo = new PageInfo();
		if (page <= 0) {
			page = 1;
		}
		int currentResult = (page - 1) * limit;
		pageInfo.setCurrentResult(currentResult);
		pageInfo.setShowCount(limit);
		List<Role> roleList = roleService.getRoleListByLimit(pageInfo, role);
		return PageReply.ok(pageInfo.getTotalResult(), roleList);
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/delete.do")
	public Reply deleteRole(Role role) {
		roleService.deleteByPrimaryKey(role.getId());
		return Reply.ok("删除成功");
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/deletelist.do")
	public Reply deleteRoleList(@RequestBody List<Role> roles) {
		roleService.deleteRoleList(roles);
		return Reply.ok("删除成功");
	}

	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/add.do")
	public Reply addRole(Role frontRole, @RequestParam(value = "premissionadd[0]") Integer[] premissionadd) {
		Role role = roleService.selectByRoleName(frontRole.getRole());
		if (role != null) {
			return Reply.error("角色名已存在");
		}
		List<Premission> premissionList = new ArrayList<>();
		for (Integer premissionId : premissionadd) {
			Premission premission = new Premission();
			premission.setId(premissionId);
			premissionList.add(premission);
		}

		frontRole.setPremissions(premissionList);
		roleService.insert(frontRole);
		return Reply.ok("添加成功");
	}

	
	
	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/info.do")
	public Reply getRoleInfo(int id) {
		Role role = roleService.selectByPrimaryKey(id);
		if (role == null) {
			role = new Role();
		}
		return Reply.ok(role);
	}
	
	
	
	@RequiresRoles(value = { "超级管理员", "管理员" }, logical = Logical.OR)
	@RequestMapping("/update.do")
	public Reply updateRole(Role role,@RequestParam(value = "premissionadd[]") Integer[] premissionadd) {
		Role backRole = roleService.selectByRoleName(role.getRole());
		if (backRole != null && backRole.getId() != role.getId()) {
			return Reply.error("角色名已存在");
		}
		List<Premission> premisisonList = new ArrayList<>();
		for (Integer premissionId: premissionadd) {
			Premission premisison = new Premission();
			premisison.setId(premissionId);
			premisisonList.add(premisison);
		}
		role.setPremissions(premisisonList);
		
		roleService.updateByPrimaryKey(role);
		return Reply.ok("修改成功");
	}
	
	
	
}
