package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.Note;

public interface NoteService {
	public List<Note> getNoteByBuyLectureNo(int buyLectureNo);
	public void insertNote(Note note);
	public void updateNote(Note note);
	public Note getNoteByNoteNo(int noteNo);
}
