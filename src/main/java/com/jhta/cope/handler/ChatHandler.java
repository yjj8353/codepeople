package com.jhta.cope.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.jhta.cope.dao.ChatDao;
import com.jhta.cope.dao.UserDao;
import com.jhta.cope.vo.Chat;
import com.jhta.cope.vo.Follow;
import com.jhta.cope.vo.User;
import com.sun.activation.viewers.TextEditor;

public class ChatHandler extends TextWebSocketHandler {

	@Autowired
	private ChatDao chatDao;
	@Autowired
	private UserDao userDao;

	public static final Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String payLoad = message.getPayload();
		String payLoadItem[] = payLoad.split(":");
		String protocol = payLoadItem[0];
		// 문의 채팅
		if ("QNA".equals(protocol)) {
			String msg = payLoadItem[1];
			String sendUser = new ObjectMapper().writeValueAsString(ChatHandler.getSessionUser(session));
			for (String key : sessionMap.keySet()) {
				WebSocketSession ws = sessionMap.get(key);
				User user = getSessionUser(ws);
				if (user.getAuthStatus() == 9) {
					Chat chat = new Chat().setSendUser(ChatHandler.getSessionUser(session)).setRecvUser(user)
							.setContents(msg);
					chatDao.insertChat(chat);
					ws.sendMessage(new TextMessage("ANSWER/ADMIN/" + sendUser + "/" + msg));
				}
			}
		}
		// 유저 채팅
		else if ("USER".equals(protocol)) {
			String recvUserId = payLoadItem[1];
			String msg = payLoadItem[2];
			String sendUser = new ObjectMapper().writeValueAsString(ChatHandler.getSessionUser(session));
			WebSocketSession ws = sessionMap.get(recvUserId);
			chatDao.insertChat(new Chat().setRecvUser(new User().setId(recvUserId))
					.setSendUser(ChatHandler.getSessionUser(session)).setContents(msg));
			if(ws!=null) {
				ws.sendMessage(new TextMessage("ANSWER/USER/" + sendUser + "/" + msg));
			}
		}
		// 친구 신청
		else if ("FOLLOW".equals(protocol)) {
			String target = payLoadItem[1];
			String sendUser = new ObjectMapper().writeValueAsString(ChatHandler.getSessionUser(session));

			WebSocketSession targetSession = sessionMap.get(target);
			if (targetSession != null) {
				targetSession.sendMessage(new TextMessage("FOLLOWING/" + sendUser));
			}
		}
		// 친구 신청 수락
		else if ("FRIEND".equals(protocol)) {
			String target = payLoadItem[1];
			String recvUser = payLoadItem[2];
			User sendUser = ChatHandler.getSessionUser(session);
			WebSocketSession recvSession =  sessionMap.get(recvUser);
			if(target.equals("ACCEPT")) {
				recvSession.sendMessage(new TextMessage("FRIEND/ACCEPT/"+sendUser.getName()));
			}else if(target.equals("REFUSE")){
				recvSession.sendMessage(new TextMessage("FRIEND/REFUSE/"+sendUser.getName()));
			}
		}

	}

	// 연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		User user = ChatHandler.getSessionUser(session);
		user.setUserOn("ON");
		userDao.updateUser(user);
		sessionMap.put(user.getId(), session);
		boolean isSendLoginMsg = (Boolean) session.getAttributes().get("SEND_LOGIN_MSG_FLAG");

		List<Follow> friends = userDao.getFriends(user.getId());

		for (Follow follow : friends) {
			WebSocketSession ws = sessionMap.get(follow.getFollower().getId());
			if (ws != null) {
				if (isSendLoginMsg) {
					ws.sendMessage(new TextMessage("ONUSER/ALERT/" + new Gson().toJson(follow.getFollowing())));
				}
				ws.sendMessage(new TextMessage("ONUSER/CHAT/" + new Gson().toJson(follow.getFollowing())));
			}
		}
	}

	// 해제시
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		User user = ChatHandler.getSessionUser(session);
		user.setUserOn("OFF");
		userDao.updateUser(user);
		List<Follow> friends = userDao.getFriends(user.getId());

		for (Follow follow : friends) {
			WebSocketSession ws = sessionMap.get(follow.getFollower().getId());
			if (ws != null) {
				ws.sendMessage(new TextMessage("OFFUSER/" + new Gson().toJson(follow.getFollowing())));
			}
		}

		sessionMap.remove(ChatHandler.getSessionUser(session).getId());
	}

	// 오류시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}

	private static User getSessionUser(WebSocketSession session) {
		Map<String, Object> attr = session.getAttributes();
		return (User) attr.get("LOGIN_USER");
	}

	public static List<User> getAllOnUsers() {
		List<User> users = new ArrayList<>();
		for (String key : sessionMap.keySet()) {
			WebSocketSession ws = sessionMap.get(key);
			User user = ChatHandler.getSessionUser(ws);
			users.add(user);
		}
		return users;
	}
	
	public static void serverToClientMessage(String userId,String msg,Object object) {
		WebSocketSession ws = sessionMap.get(userId);
		try {
			ws.sendMessage(new TextMessage(msg+"/"+object));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
