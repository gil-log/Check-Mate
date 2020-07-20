package com.checkmate.dao;

import com.checkmate.vo.UserVO;

public interface UserDAO {

	// 회원가입
	public void register(UserVO userVO) throws Exception;

	// 로그인
	public UserVO login(UserVO userVO) throws Exception;

	// 유저 정보 가져오기
	public UserVO userinfo(String u_id) throws Exception;

	// 네이버 로그인으로 우리 디비에 회원가입 자동으로
	public void naverReg(UserVO userVO) throws Exception;
	
	// 네이버 계정으로 디비에 저장된 정보가 있는지 카운트
	public int naverAlreadyChk(UserVO userVO) throws Exception;
}