package com.checkmate.service;

import com.checkmate.vo.GroupVO;

public interface GroupService {

	// 원하는 그룹의 관리자 찾기
	public GroupVO findMaster (GroupVO groupVO) throws Exception;

}
