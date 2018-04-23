package com.yy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yy.pojo.Premission;
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

	List<Premission> selectAllPremission(Integer id);

	List<Role> getRoleListByLimit(@Param("page") PageInfo page, @Param("role") String role);

	void deleteRoleList(List<Role> roleList);

	void deleteRolePremissions(List<Integer> roleIds);

	void saveRolePremission(@Param("premissions") List<Premission> premissions, @Param("role") Role role);
	
	Role selectByRoleName(String role);

}