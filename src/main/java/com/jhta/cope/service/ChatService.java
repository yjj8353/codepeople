package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Chat;

public interface ChatService {

	public void updateChat(Chat chat);
	public List<Chat> getChats(Chat chat);
}
