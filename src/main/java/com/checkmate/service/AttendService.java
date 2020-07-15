package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.AttendListVO;
import com.checkmate.vo.AttendVO;


public interface AttendService {

	//출석 현황 리스트 출력
	public List<AttendListVO> attendList(AttendVO attendVO) throws Exception;
	
	//출석생성
	public void attendMake(AttendVO attendVO) throws Exception;
	
	//제일 최근 출석 불러오기
	public AttendVO attendLast(AttendVO attendVO) throws Exception;
}
