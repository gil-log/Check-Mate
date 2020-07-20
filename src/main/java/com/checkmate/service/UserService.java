package com.checkmate.service;

import com.checkmate.vo.UserVO;

public interface UserService {
	
	public void register(UserVO userVO) throws Exception;
	
	public UserVO login(UserVO userVO) throws Exception;
	
	public UserVO userinfo(String u_id) throws Exception;
	
	// 네이버 로그인으로 우리 디비에 회원가입 자동으로
	public void naverReg(UserVO userVO) throws Exception;
		
	// 네이버 계정으로 디비에 저장된 정보가 있는지 카운트
	public int naverAlreadyChk(UserVO userVO) throws Exception;

}