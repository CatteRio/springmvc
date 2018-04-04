package com.yy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Rio
 * @Date 2018年4月3日 下午7:03:43
 */
@Controller
@RequestMapping("/admin")
public class IndexController {
	
	@RequestMapping("/login.do")
	public ModelAndView login(Model model) {
		return new ModelAndView("login");
	}

	@RequestMapping("/index.do")
	public ModelAndView main(Model model) {
		return new ModelAndView("index");
	}

	@RequestMapping("/userinfo.do")
	public ModelAndView showUserInformation(Model model) {
		return new ModelAndView("/userinfo/userinfo");
	}
	@RequestMapping("/modifyinfo.do")
	public ModelAndView modifyInfo(Model model) {
		return new ModelAndView("/userinfo/modifyinfo");
	}
}
