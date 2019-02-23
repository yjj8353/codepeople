package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.ChatDao;
import com.jhta.cope.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	ChatDao chatDao;
	
	public List<Chat> getChats(Chat chat){
		return chatDao.getChats(chat);
	}

	@Override
	public void updateChat(Chat chat) {
		chatDao.updateChat(chat);
	};
}
