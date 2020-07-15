package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.AttendVO;


public interface AttendService {

	//출석 현황 리스트 출력
	public List<AttendVO> attendList(AttendVO attendVO) throws Exception;
	
	//출석생성
	public void attendInsert(AttendVO attendVO) throws Exception;
}
