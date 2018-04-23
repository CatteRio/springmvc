package com.yy.utils;

import java.io.Serializable;

import lombok.Data;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:16:24
 */
@Data
public class PageInfo implements Serializable {
	private static final long serialVersionUID = 587754556498974978L;
	// pagesize ，每一页显示多少
	private int showCount = 3;
	// 总页数
	private int totalPage;
	// 总记录数
	private int totalResult;
	// 当前页数
	private int currentPage;
	// 当前显示到的ID, 在mysql limit 中就是第一个参数.
	private int currentResult;
	private String sortField;
	private String order;

}