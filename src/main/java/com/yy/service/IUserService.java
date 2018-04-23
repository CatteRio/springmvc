package com.yy.service;

import java.util.List;

import org.springframework.stereotype.Component;

import com.yy.pojo.User;
import com.yy.utils.PageInfo;
/**
 * 
 * @author Rio(417168602@qq.com)
 * @date 2018-04-23 下午2:15:38
 */
public interface IUserService {
	void saveUser(User user);
	void updateUser(User user);
	User findUserById(int id);
	User findUserByUserName(String username);
	List<User> getUserListByLimit(PageInfo page,String username);
	void deleteUser(User user);
	void deleteUserList(List<User> userList);
}
