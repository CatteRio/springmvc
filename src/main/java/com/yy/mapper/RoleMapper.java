package com.yy.mapper;

import java.util.List;

import com.yy.pojo.Permission;
import org.apache.ibatis.annotations.Param;

import com.yy.pojo.Role;
import com.yy.utils.PageInfo;

public interface RoleMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(Role record);

	int insertSelective(Role record);

	Role selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Role record);

	int updateByPrimaryKey(Role record);

	List<Role> selectAll();

	List<Permission> selectAllPermission(Integer id);

	List<Role> getRoleListByLimit(@Param("page") PageInfo page, @Param("role") String role);

	void deleteRoleList(List<Role> roleList);

	void deleteRolePermissions(List<Integer> roleIds);

	void saveRolePermission(@Param("permissions") List<Permission> permissions, @Param("role") Role role);
	
	Role selectByRoleName(String role);

}