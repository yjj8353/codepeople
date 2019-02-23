package com.jhta.cope.service;

import java.util.List;

import com.jhta.cope.vo.PaidQna;

public interface PaidQnaService {
	
	public List<PaidQna> getPaidQnaByPaidLectureNo(int paidLectureNo);


}
