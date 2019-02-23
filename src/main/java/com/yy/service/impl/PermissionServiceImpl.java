package com.yy.service.impl;

import java.util.List;

import com.yy.pojo.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.mapper.PermissionMapper;
import com.yy.service.IPermissionService;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:46
 */
@Service
public class PermissionServiceImpl implements IPermissionService {

	@Autowired
	private PermissionMapper permissionMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return permissionMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Permission record) {
		return permissionMapper.insert(record);
	}

	@Override
	public int insertSelective(Permission record) {
		return permissionMapper.insertSelective(record);
	}

	@Override
	public Permission selectByPrimaryKey(Integer id) {
		return permissionMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Permission record) {
		return permissionMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Permission record) {
		return permissionMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<Permission> listAll() {
		return permissionMapper.listAll();
	}

	@Override
	public List<Permission> selectFirstGeneration() {
		return permissionMapper.selectFirstGeneration();
	}

	@Override
	public List<Permission> selectPermissionByUserId(Integer id) {
		return permissionMapper.selectPermissionByUserId(id);
	}

	@Override
	public Permission selectByContent(String content) {
		return permissionMapper.selectByContent(content);
	}

}
