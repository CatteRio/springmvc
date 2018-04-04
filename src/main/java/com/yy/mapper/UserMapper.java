package com.yy.mapper;

import java.util.List;

import com.yy.pojo.User;

public interface UserMapper {
	void save(User user);

	void update(User user);

	void delete(User user);

	User findById(int id);

	User findByUserName(String username);

	List<User> findAll();
}
