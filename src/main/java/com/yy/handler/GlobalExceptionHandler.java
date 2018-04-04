package com.yy.handler;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.http.HttpStatus;
import com.yy.utils.Reply;

/**
 * @author Rio
 * @Date 2018年4月3日 下午4:55:07
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(Exception.class)
	@ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
	@ResponseBody
	public Reply handleException(Exception e) {
		e.printStackTrace();
		return Reply.error("未知异常，请联系管理员！");
	}

}
