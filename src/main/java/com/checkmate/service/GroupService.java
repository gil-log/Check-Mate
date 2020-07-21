package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;

public interface GroupService {

	public void GroupCreate(GroupVO groupVO) throws Exception;
	
	public List<GroupVO> GroupList(UserVO userVO) throws Exception;	
	
	public int GroupListCount(UserVO userVO) throws Exception;
	
	// 원하는 그룹의 관리자 찾기
	public GroupVO findMaster (GroupVO groupVO) throws Exception;
	
	// 유저 포인트 넣기
	public void userPoint(GroupPointVO groupPointVO) throws Exception;

	// 탑 랭크 유저들 뽑아오기 3위까지
	public List<GroupPointVO> findTopRankList(GroupVO groupVO) throws Exception;

	// 내 순위 찾아오기
	public GroupPointVO findMyRank(GroupVO groupVO) throws Exception;

	// 소켓 접속했을때 세션 아이디 넣기
	public void socketConnection(GroupVO groupVO) throws Exception;

	// 해당 그룹에 소켓 접속 인원 list 가져오기
	public List<GroupVO> socketConnectionList(GroupVO groupVO) throws Exception;
	
	//선택한 그룹 가져오기
	public GroupVO groupRead(GroupVO groupVO) throws Exception;
	
	//그룹 user 추가 
	public void userPlus(GroupVO groupVO) throws Exception;
}
