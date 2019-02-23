package com.jhta.cope.service;

import com.jhta.cope.vo.UserLog;

public interface UserLogService {

	void userLogWrite(UserLog userLog) throws Exception;
	int countTodayVisitors() throws Exception;
}
