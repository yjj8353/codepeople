package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Chat;

public interface ChatDao {

	public void insertChat(Chat chat);
	public void updateChat(Chat chat);
	public List<Chat> getChats(Chat chat);
	public int unReadChatCount(String userId);
}
