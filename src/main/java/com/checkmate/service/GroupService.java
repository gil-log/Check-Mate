package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupVO;



public interface GroupService {
	
		public void GroupCreate(GroupVO groupVO) throws Exception;
		
		public List<GroupVO> GroupList(GroupVO groupVO) throws Exception;	
		
		public int GroupListCount(GroupVO groupVO) throws Exception;
}
