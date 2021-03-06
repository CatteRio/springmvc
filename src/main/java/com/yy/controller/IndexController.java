package com.yy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:21
 */
@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping("/login.do")
	public ModelAndView login(Model model) {
		return new ModelAndView("login");
	}
	@RequestMapping("/welcome.do")
	public ModelAndView welcome(Model model) {
		return new ModelAndView("welcome");
	}
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public ModelAndView indexDo() {
		return new ModelAndView("index");
	}

	@RequestMapping(value = "/{module}/{view}.do", method = RequestMethod.GET)
	public ModelAndView index(@PathVariable String module, @PathVariable String view) {
		return new ModelAndView("/" + module + "/" + view);
	}

}
