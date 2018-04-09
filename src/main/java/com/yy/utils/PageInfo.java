package com.yy.utils;

import java.io.Serializable;

import lombok.Data;

/**
 * @author Rio 2018年4月8日下午8:32:25
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