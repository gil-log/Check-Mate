package com.checkmate.service;

import com.checkmate.vo.UserVO;

public interface UserService {
	
	public void register(UserVO userVO) throws Exception;
	
	public UserVO login(UserVO userVO) throws Exception;
	
	public UserVO userinfo(String u_id) throws Exception;

}