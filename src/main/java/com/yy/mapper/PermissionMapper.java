package com.yy.mapper;

import java.util.List;

import com.yy.pojo.Permission;

public interface PermissionMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Permission record);

	int insertSelective(Permission record);

	Permission selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Permission record);

	int updateByPrimaryKey(Permission record);

	List<Permission> listAll();

	List<Permission> selectFirstGeneration();
	
	List<Permission> selectPermissionByUserId(Integer id);
	
	List<Permission> selectChildren();
	
	Permission selectByContent(String content);
}