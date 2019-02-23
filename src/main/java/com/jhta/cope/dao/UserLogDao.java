package com.jhta.cope.dao;

import com.jhta.cope.vo.UserLog;

public interface UserLogDao {

	void userLogWrite(UserLog userLog);
	int countTodayVisitors();
}
