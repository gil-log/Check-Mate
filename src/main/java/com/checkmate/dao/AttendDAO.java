package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;

public interface AttendDAO {


	//출석 현황 리스트 출력
	public List<AttendVO> attendList(GroupVO groupVO) throws Exception;
	
	//출석생성
	public void attendMake(AttendVO attendVO) throws Exception;
	
	//출석 생성시 그룹원들의 attend를 추가하기 위해 그룹원 이름 가져오기!
	public List<GroupVO> groupMemberList(GroupVO groupVO) throws Exception;
	
	//추가한 출석 불러오기
	public AttendVO attendLast(GroupVO groupVO) throws Exception;

	//출석가능 시간이 지났을 때(관리자)
	public void attendClose(AttendVO attendVO) throws Exception;

	//출석상태 update
	public void attendUpdate(GroupVO groupVO) throws Exception;

	//출석체크 버튼을 누른경우
	public void attendClick(AttendVO attendVO) throws Exception;

	//선택한 출석정보 불러오기
	public AttendVO attendSelect(AttendVO attendVO) throws Exception;
	
	//출석관리 화면
	public List<AttendVO> attendManage(AttendVO attendVO) throws Exception;
		
	
	
	
	
	//calendar용 출석 리스트
	public List<AttendVO> attendListCalendar(AttendVO attendVO) throws Exception;
	
	// attend에 gno uid로 개수 카운트
	public int attendGnoUidCount(AttendVO attendVO) throws Exception;
	
	// attend에 그 관리자가 만든 개수 카운트
	public int attendMasterCount(GroupVO groupVO) throws Exception;

}