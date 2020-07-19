package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;

public interface UserDAO {

	// 회원가입
	public void register(UserVO userVO) throws Exception;

	// 로그인
	public UserVO login(UserVO userVO) throws Exception;

	// 유저 정보 가져오기
	public UserVO userinfo(String u_id) throws Exception;

	// 그룹 user정보 list 가져오기
	public List<UserVO> userList(GroupVO groupVO) throws Exception;
	
	// 그룹 user정보 list 개수 카운트
	public int userListCount(GroupVO groupVO) throws Exception;
}