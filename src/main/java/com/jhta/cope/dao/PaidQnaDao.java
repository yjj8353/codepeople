package com.jhta.cope.dao;

import java.util.List;

import com.jhta.cope.vo.PaidQna;

public interface PaidQnaDao {

	public List<PaidQna> getPaidQnaByPaidLectureNo(int paidLectureNo);
}
