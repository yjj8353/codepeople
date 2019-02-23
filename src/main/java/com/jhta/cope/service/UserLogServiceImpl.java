package com.jhta.cope.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.UserLogDao;
import com.jhta.cope.vo.UserLog;

@Service
public class UserLogServiceImpl implements UserLogService {

	@Autowired
	UserLogDao userLogDao;
	
	@Override
	public void userLogWrite(UserLog userLog) throws Exception {
		userLogDao.userLogWrite(userLog);
	}

	@Override
	public int countTodayVisitors() throws Exception {
		return userLogDao.countTodayVisitors();
	}
}