package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.AttendListVO;
import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;

public interface AttendDAO {


	//출석 현황 리스트 출력
	public List<AttendListVO> attendList(AttendVO attendVO) throws Exception;
	
	//출석생성
	public void attendMake(AttendVO attendVO) throws Exception;

	//추가한 출석 불러오기
	public AttendVO attendLast(AttendVO attendVO) throws Exception;
	
	//calendar용 출석 리스트
	public List<AttendVO> attendListCalendar(AttendVO attendVO) throws Exception;
	
	// attend에 gno uid로 개수 카운트
	public int attendGnoUidCount(AttendVO attendVO) throws Exception;
	
	// attend에 그 관리자가 만든 개수 카운트
	public int attendMasterCount(GroupVO groupVO) throws Exception;

}