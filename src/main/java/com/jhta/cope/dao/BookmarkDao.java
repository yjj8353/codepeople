package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Bookmark;

public interface BookmarkDao {
	public void insertBookmark(Bookmark bookmark);
	List<Bookmark> getBookmarkByHistoryNo(int historyNo);
}
