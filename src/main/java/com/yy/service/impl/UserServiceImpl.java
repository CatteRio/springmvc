package com.yy.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.mapper.UserMapper;
import com.yy.pojo.User;
import com.yy.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userDAO;

	public void saveUser(User user) {
		userDAO.save(user);
	}

	@Override
	public User findUserByUserName(String username) {
		return userDAO.findByUserName(username);
	}

	@Override
	public void updateUser(User user) {
		userDAO.update(user);
	}
}
