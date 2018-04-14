package com.yy.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import lombok.Data;

@Data
public class Role {
	private Integer id;

	private String role;

	private String remark;

	private boolean status;

	private boolean checked;
}