package com.jhta.cope.service;

public interface PaidLectureLikeService {

	int getCountPaidLectureLikeByPaidLectureNo(int paidLectureNo);
	int getLikeCountByPaidLectureLike(int paidLectureNo, int userNo);
	void insertPaidLectureLike(int paidLectureNo, int userNo);
	void deletePaidLectureLikeByPaidLectureLike(int paidLectureNo, int userNo);

}
