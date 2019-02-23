package com.jhta.cope.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.jhta.cope.vo.User;

public class HandShakeInterceptor extends HttpSessionHandshakeInterceptor {

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {

		ServletServerHttpRequest ssr = (ServletServerHttpRequest) request;
		HttpServletRequest httpRequest = ssr.getServletRequest();

		User user = (User) httpRequest.getSession().getAttribute("LOGIN_USER");
		if (user != null) {
			boolean isSendLoginMsg = (Boolean) httpRequest.getSession().getAttribute("SEND_LOGIN_MSG");
			
			if (isSendLoginMsg) {
				attributes.put("SEND_LOGIN_MSG_FLAG", true);
				httpRequest.getSession().setAttribute("SEND_LOGIN_MSG", false);
			}  else {
				attributes.put("SEND_LOGIN_MSG_FLAG", false);				
			}
			attributes.put("LOGIN_USER_ID", user.getId());
		}
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}
}
