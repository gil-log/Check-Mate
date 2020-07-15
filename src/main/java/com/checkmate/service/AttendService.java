package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;


public interface AttendService {

	//출석 현황 리스트 출력
	public List<AttendVO> attendList(AttendVO attendVO) throws Exception;
	
	//출석생성
	public void attendInsert(AttendVO attendVO) throws Exception;

	//calendar용 출석 리스트
	public List<AttendVO> attendListCalendar(AttendVO attendVO) throws Exception;

	// attend에 gno uid로 개수 카운트
	public int attendGnoUidCount(AttendVO attendVO) throws Exception;

	// attend에 그 관리자가 만든 개수 카운트
	public int attendMasterCount(GroupVO groupVO) throws Exception;
}