package com.yy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yy.pojo.Premission;
import com.yy.service.IPremissionService;
import com.yy.utils.Reply;
import com.yy.utils.ShiroUtils;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:29
 */
@RestController
@RequestMapping("/api/premission")
public class PremissionController {

	@Autowired
	private IPremissionService premissionService;

	@RequestMapping("/all/list.do")
	public Reply getPremissions(Integer id) {
		if (id != null && id != 0) {
			return Reply.ok(premissionService.selectByPrimaryKey(id));
		}
		return Reply.ok(premissionService.selectFirstGeneration());
	}

	@RequestMapping("/update.do")
	public Reply update(Premission premission) {
		premissionService.updateByPrimaryKey(premission);
		ShiroUtils.clearCachedAuthorizationInfo();
		return Reply.ok("修改成功");
	}

	@RequestMapping("/add.do")
	public Reply add(Premission premission) {
		premissionService.insertSelective(premission);
		ShiroUtils.clearCachedAuthorizationInfo();
		return Reply.ok("新增成功");
	}
	
	
	@RequestMapping("/delete.do")
	public Reply delete(Premission premission) {
		premissionService.deleteByPrimaryKey(premission.getId());
		ShiroUtils.clearCachedAuthorizationInfo();
		return Reply.ok("删除成功");
	}
	
}
