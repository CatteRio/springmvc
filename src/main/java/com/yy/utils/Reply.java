package com.yy.utils;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author Rio
 * @Date 2018骞�4鏈�3鏃� 涓嬪崍4:00:43
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
