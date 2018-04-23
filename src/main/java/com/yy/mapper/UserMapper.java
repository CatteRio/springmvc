package com.yy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yy.pojo.Role;
import com.yy.pojo.User;
import com.yy.utils.PageInfo;

public interface UserMapper {
	void save(User user);

	void saveUserRole(@Param("roles") List<Role> roles, @Param("user") User user);

	void update(User user);

	void delete(User user);

	User findById(int id);

	User findByUserName(String username);

	List<User> findAll();

	List<User> getUserListByLimit(@Param("page") PageInfo page, @Param("username") String username);

	void deleteUserList(List<User> userList);

	void deleteUserRoles(List<Integer> userIds);
	
	List<Role> selectAllRoles(Integer id);
}
