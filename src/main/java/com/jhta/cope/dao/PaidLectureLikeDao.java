package com.jhta.cope.dao;

import com.jhta.cope.vo.PaidLectureLike;

public interface PaidLectureLikeDao {
	int getCountPaidLectureLikeByPaidLectureNo(int paidLectureNo);
	int getLikeCountByPaidLectureLike(PaidLectureLike paidLectureLike);
	void insertPaidLectureLike(PaidLectureLike paidLectureLike);
	void deletePaidLectureLikeByPaidLectureLike(PaidLectureLike paidLectureLike);
}