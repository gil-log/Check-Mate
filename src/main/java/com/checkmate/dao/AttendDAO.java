package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.AttendVO;

public interface AttendDAO {

	//출석 현황 리스트 출력
	public List<AttendVO> attendList(AttendVO attendVO) throws Exception;
	

	//출석생성
	public void attendInsert(AttendVO attendVO) throws Exception;

}
