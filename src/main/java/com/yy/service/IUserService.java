package com.yy.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.yy.pojo.User;
import com.yy.utils.PageInfo;

@Component
public interface IUserService {
	void saveUser(User user);
	void updateUser(User user);
	User findUserByUserName(String username);
	List<User> getUserListByLimit(PageInfo page);
}
