package com.checkmate.dao;

import com.checkmate.vo.UserVO;

public interface UserDAO {

	// 회원가입
	public void register(UserVO userVO) throws Exception;

	// 로그인
	public UserVO login(UserVO userVO) throws Exception;

	// 유저 정보 가져오기
	public UserVO userinfo(String u_id) throws Exception;

}