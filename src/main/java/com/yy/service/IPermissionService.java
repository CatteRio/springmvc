package com.yy.service;

import java.util.List;

import com.yy.pojo.Permission;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:34
 */
public interface IPermissionService {
	int deleteByPrimaryKey(Integer id);

	int insert(Permission record);

	int insertSelective(Permission record);

	Permission selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Permission record);

	int updateByPrimaryKey(Permission record);

	List<Permission> listAll();

	List<Permission> selectFirstGeneration();

	List<Permission> selectPermissionByUserId(Integer id);

	Permission selectByContent(String content);
}
