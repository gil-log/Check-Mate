package com.checkmate.dao;

import com.checkmate.vo.GroupVO;

public interface GroupDAO {
	
	// 원하는 그룹의 관리자 찾기
	public GroupVO findMaster (GroupVO groupVO) throws Exception;

}
