package com.yy.service;

import java.util.List;

import com.yy.pojo.Role;

/**
 * @author Rio 2018年4月12日下午10:16:21
 */
public interface IRoleService {

	int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

	List<Role> selectAll();
}
