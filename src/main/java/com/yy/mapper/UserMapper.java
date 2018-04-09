package com.yy.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yy.pojo.User;
import com.yy.utils.PageInfo;

public interface UserMapper {
	void save(User user);

	void update(User user);

	void delete(User user);

	User findById(int id);

	User findByUserName(String username);

	List<User> findAll();
	
	List<User> getUserListByLimit(@Param("page") PageInfo page);
}
