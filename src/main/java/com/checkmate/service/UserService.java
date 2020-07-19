package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;

public interface UserService {
	
	public void register(UserVO userVO) throws Exception;
	
	public UserVO login(UserVO userVO) throws Exception;
	
	public UserVO userinfo(String u_id) throws Exception;
	
	// 그룹 user정보 list 가져오기
	public List<UserVO> userList(GroupVO groupVO) throws Exception;
	
	// 그룹 user정보 list 개수 카운트
	public int userListCount(GroupVO groupVO) throws Exception;
}