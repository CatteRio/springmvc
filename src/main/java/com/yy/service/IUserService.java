package com.yy.service;

import org.springframework.stereotype.Component;

import com.yy.pojo.User;

@Component
public interface IUserService {
	void saveUser(User user);
	void updateUser(User user);
	User findUserByUserName(String username);
}
