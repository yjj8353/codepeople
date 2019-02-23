package com.jhta.cope.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jhta.cope.dao.NoteDao;
import com.jhta.cope.vo.BuyLecture;
import com.jhta.cope.vo.Note;

@Service
public class NoteServiceImpl implements NoteService {

	@Autowired
	BuyLectureService buyLectureService;
	
	@Autowired
	NoteDao noteDao;
	
	
	@Override
	public List<Note> getNoteByBuyLectureNo(int buyLectureNo) {
		List<Note> notes = noteDao.getNoteByBuyLectureNo(buyLectureNo);
		
		for (Note note : notes) {
			BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(buyLectureNo);
			note.setBuyLecture(buyLecture);
		}
		return notes;
	}


	@Override
	public void insertNote(Note note) {
		noteDao.insertNote(note);
	}


	@Override
	public void updateNote(Note note) {
		noteDao.updateNote(note);
	}


	@Override
	public Note getNoteByNoteNo(int noteNo) {
		Note note = noteDao.getNoteByNoteNo(noteNo);
		int buyLectureNo = note.getBuyLecture().getNo();
		BuyLecture buyLecture = buyLectureService.getBuyLectureByBuyLectureNo(buyLectureNo);
		
		note.setBuyLecture(buyLecture);
		return note;
	}

}
