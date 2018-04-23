package com.yy.handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.http.HttpStatus;
import com.yy.utils.Reply;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:14:47
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public Reply handleException(Exception e) {
		e.printStackTrace();
		try {
			throw e;
		} catch (UnauthorizedException e2) {
			return Reply.error("没有权限访问");
		} catch (Exception e1) {
			return Reply.error("未知异常，请联系管理员！");
		}
	}
}
