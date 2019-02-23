package com.yy.pojo;

import java.io.Serializable;
import java.util.List;

import lombok.Data;
/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:17
 */
@Data
public class Role implements Serializable {
	private Integer id;

	private String role;

	private String remark;

	private boolean status;

	private boolean checked;

	private List<Permission> permissions;
}