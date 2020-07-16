package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.GroupVO;

public interface GroupDAO {
	
	//그룹생성
	public void GroupCreate(GroupVO groupVO) throws Exception;
		
	//그룹 목록 조회
	public List<GroupVO> GroupList(GroupVO groupVO) throws Exception;
		
	//그룹 총 개수
	public int GroupListCount(GroupVO groupVO) throws Exception;
}


