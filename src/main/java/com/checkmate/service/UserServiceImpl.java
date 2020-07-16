package com.checkmate.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.UserDAO;
import com.checkmate.vo.UserVO;


@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	@Override
	public void register(UserVO vo) throws Exception {
		dao.register(vo);
		
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public UserVO userinfo(String u_id) throws Exception {
		return dao.userinfo(u_id);

	}

}
