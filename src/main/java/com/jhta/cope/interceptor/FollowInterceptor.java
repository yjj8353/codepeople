package com.jhta.cope.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.jhta.cope.dao.ChatDao;
import com.jhta.cope.service.UserService;
import com.jhta.cope.vo.Follow;
import com.jhta.cope.vo.User;

public class FollowInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	UserService userService;
	@Autowired
	ChatDao chatDao;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("LOGIN_USER") != null) {
			User user = (User) request.getSession().getAttribute("LOGIN_USER");
			int chatCount = chatDao.unReadChatCount(user.getId());
			List<Follow> followMe = userService.getFollowMe(user.getId());
			List<Follow> friends = userService.getFriends(user.getId());
			request.setAttribute("friends", friends);
			request.setAttribute("chatCount", chatCount);
			request.setAttribute("followMe", followMe);
		}
		return true;
	}
}
