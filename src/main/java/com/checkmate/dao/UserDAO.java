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

	// 소셜 로그인으로 우리 디비에 회원가입 자동으로
	public void socialReg(UserVO userVO) throws Exception;
	
	// 소셜 계정으로 디비에 저장된 정보가 있는지 카운트
	public int socialAlreadyChk(UserVO userVO) throws Exception;
	
	// 그룹 user정보 list 가져오기
	public List<UserVO> userList(GroupVO groupVO) throws Exception;
	
	// 그룹 user정보 list 개수 카운트
	public int userListCount(GroupVO groupVO) throws Exception;
	
	// 유저 메일 가져오기
	public String userMail(String u_id) throws Exception;
}