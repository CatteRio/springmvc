package com.yy.controller;

import com.yy.pojo.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yy.service.IPermissionService;
import com.yy.utils.Reply;
import com.yy.utils.ShiroUtils;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:29
 */
@RestController
@RequestMapping("/api/permission")
public class PermissionController {

	@Autowired
	private IPermissionService permissionService;

	@RequestMapping("/all/list.do")
	public Reply getPermissions(Integer id) {
		if (id != null && id != 0) {
			return Reply.ok(permissionService.selectByPrimaryKey(id));
		}
		return Reply.ok(permissionService.selectFirstGeneration());
	}

	@RequestMapping("/list.do")
	public Reply getPermission(String content) {
		return Reply.ok(permissionService.selectByContent(content));
	}

	@RequestMapping("/update.do")
	public Reply update(Permission permission) {
		permissionService.updateByPrimaryKey(permission);
		ShiroUtils.clearCachedAuthorizationInfo();
		return Reply.ok("修改成功");
	}

	@RequestMapping("/add.do")
	public Reply add(Permission permission) {
		permissionService.insertSelective(permission);
		ShiroUtils.clearCachedAuthorizationInfo();
		return Reply.ok("新增成功");
	}

	@RequestMapping("/delete.do")
	public Reply delete(Permission permission) {
		permissionService.deleteByPrimaryKey(permission.getId());
		ShiroUtils.clearCachedAuthorizationInfo();
		return Reply.ok("删除成功");
	}

}
