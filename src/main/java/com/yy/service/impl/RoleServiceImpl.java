package com.yy.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.mapper.RoleMapper;
import com.yy.pojo.Premission;
import com.yy.pojo.Role;
import com.yy.service.IRoleService;
import com.yy.utils.PageInfo;

/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:50
 */
@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		List<Integer> roleIds = new ArrayList<>();
		roleIds.add(id);
		roleMapper.deleteRolePremissions(roleIds);
		return roleMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Role record) {
		List<Premission> premissions = record.getPremissions();
		int result = roleMapper.insert(record);
		record = roleMapper.selectByRoleName(record.getRole());
		roleMapper.saveRolePremission(premissions, record);
		return result;
	}

	@Override
	public int insertSelective(Role record) {
		return roleMapper.insertSelective(record);
	}

	@Override
	public Role selectByPrimaryKey(Integer id) {
		return roleMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Role record) {
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		int result = roleMapper.updateByPrimaryKey(record);
		List<Integer> ids = new ArrayList<>();
		ids.add(record.getId());
		roleMapper.deleteRolePremissions(ids);
		roleMapper.saveRolePremission(record.getPremissions(), record);
		return result;
	}

	@Override
	public List<Role> selectAll() {
		return roleMapper.selectAll();
	}

	@Override
	public List<Role> getRoleListByLimit(PageInfo page, String role) {
		return roleMapper.getRoleListByLimit(page, role);
	}

	@Override
	public void deleteRoleList(List<Role> roleList) {
		List<Integer> roleIds = new ArrayList<>();
		for (Role role : roleList) {
			roleIds.add(role.getId());
		}
		roleMapper.deleteRolePremissions(roleIds);
		roleMapper.deleteRoleList(roleList);
	}

	@Override
	public Role selectByRoleName(String role) {
		// TODO Auto-generated method stub
		return roleMapper.selectByRoleName(role);
	}

}
