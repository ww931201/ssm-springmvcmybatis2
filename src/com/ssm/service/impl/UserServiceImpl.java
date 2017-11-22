package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssm.mapper.UserDao;
import com.ssm.po.User;
import com.ssm.service.UserService;

/**
 * 
 * 
 * @author wangwei
 *
 */
@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public User findUser(User user) {
		return userDao.findUser(user);
	}

}
