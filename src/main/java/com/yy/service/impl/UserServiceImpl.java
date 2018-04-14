package com.yy.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yy.mapper.UserMapper;
import com.yy.pojo.Role;
import com.yy.pojo.User;
import com.yy.service.IUserService;
import com.yy.utils.PageInfo;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	private UserMapper userDAO;

	public void saveUser(User user) {
		List<Role> roles = user.getRoles();
		userDAO.save(user);
		user = userDAO.findByUserName(user.getUsername());
		userDAO.saveUserRole(roles, user);
	}

	@Override
	public User findUserByUserName(String username) {
		return userDAO.findByUserName(username);
	}

	@Override
	public void updateUser(User user) {
		userDAO.update(user);
		List<Integer> ids = new ArrayList<>();
		ids.add(user.getId());
		userDAO.deleteUserRoles(ids);
		userDAO.saveUserRole(user.getRoles(), user);
	}

	@Override
	public List<User> getUserListByLimit(PageInfo page,String username) {
		return userDAO.getUserListByLimit(page,username);
	}

	@Override
	public void deleteUser(User user) {
		List<Integer> userIds = new ArrayList<>();
		userIds.add(user.getId());
		userDAO.deleteUserRoles(userIds);
		userDAO.delete(user);
	}

	@Override
	public void deleteUserList(List<User> userList) {
		List<Integer> userIds = new ArrayList<>();
		for (User user : userList) {
			userIds.add(user.getId());
		}
		userDAO.deleteUserRoles(userIds);
		userDAO.deleteUserList(userList);
	}

	@Override
	public User findUserById(int id) {
		return userDAO.findById(id);
	}

}
