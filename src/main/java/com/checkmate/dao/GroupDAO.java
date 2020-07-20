package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;

public interface GroupDAO {
	
	//그룹생성
	public void GroupCreate(GroupVO groupVO) throws Exception;
		
	//그룹 목록 조회
	public List<GroupVO> GroupList(GroupVO groupVO) throws Exception;
		
	//그룹 총 개수
	public int GroupListCount(GroupVO groupVO) throws Exception;
	
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
}
