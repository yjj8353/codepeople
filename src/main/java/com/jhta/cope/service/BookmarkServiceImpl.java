package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.BookmarkDao;
import com.jhta.cope.vo.Bookmark;
import com.jhta.cope.vo.LectureHistory;

@Service
public class BookmarkServiceImpl implements BookmarkService{

	@Autowired
	BookmarkDao bookmarkDao;
	
	@Autowired
	LectureHistoryService lectureHistoryService;

	
	@Override
	public void insertBookmark(Bookmark bookmark) {
		bookmarkDao.insertBookmark(bookmark);
		
	}


	@Override
	public List<Bookmark> getBookmarkByHistoryNo(int historyNo) {
		
		List<Bookmark> bookmarks = bookmarkDao.getBookmarkByHistoryNo(historyNo);
		LectureHistory history = lectureHistoryService.getLectureHistoryByHistoryNo(historyNo);
		
		for (Bookmark bookmark : bookmarks) {
			bookmark.setHistory(history);
		}
		
		
		return bookmarks;
	}
	
	

}
