package com.yy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yy.service.IPremissionService;
import com.yy.utils.Reply;

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
}
