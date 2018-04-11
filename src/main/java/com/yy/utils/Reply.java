package com.yy.utils;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 
 * @author Rio
 * 2018年4月11日下午4:13:47
 */
@Data
@AllArgsConstructor
public class Reply {

	private int code;
	private String message;
	private Object data;

	public static Reply ok(String message, Object data) {
		return new Reply(200, message, data);
	}

	public static Reply ok() {
		return ok("ok", null);
	}

	public static Reply ok(String message) {
		return ok(message, null);
	}

	public static Reply ok(Object data) {
		return ok("ok", data);
	}
	public static Reply error(String message) {
		return new Reply(500, message, null);
	}

}
