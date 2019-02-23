package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.Note;

public interface NoteDao {
	public List<Note> getNoteByBuyLectureNo(int buyLectureNo);
	public void insertNote(Note note);
	public void updateNote(Note note);
	public Note getNoteByNoteNo(int noteNo);
}
