package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;

public interface GroupDAO {
	
	//그룹생성
	public void GroupCreate(GroupVO groupVO) throws Exception;
		
	//그룹 목록 조회
	public List<GroupVO> GroupList(UserVO userVO) throws Exception;
		
	//그룹 총 개수
	public int GroupListCount(UserVO userVO) throws Exception;
	
	// 원하는 그룹의 관리자 찾기
	public GroupVO findMaster (GroupVO groupVO) throws Exception;

	// 유저 포인트 넣기
	public void userPoint(GroupPointVO groupPointVO) throws Exception;
	
	//선택한 그룹 가져오기
	public GroupVO groupRead(int g_no) throws Exception;
	
	//그룹 user 추가 
	public void userPlus(GroupVO groupVO) throws Exception;

}
