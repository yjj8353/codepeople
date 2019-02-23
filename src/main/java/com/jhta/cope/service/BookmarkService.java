package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Bookmark;

public interface BookmarkService {
	public void insertBookmark(Bookmark bookmark);
	List<Bookmark> getBookmarkByHistoryNo(int historyNo);

}
