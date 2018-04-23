package com.yy.utils;

import lombok.Data;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:16:48
 */
@Data
public class PageReply extends Reply {
	private long count;

	public PageReply(int code, String message, long count, Object data) {
		super(code, message, data);
		this.count = count;
	}

	public static PageReply ok(long count, Object data) {
		return new PageReply(200, "成功", count, data);
	}

}
