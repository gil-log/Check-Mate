package com.checkmate.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.GroupDAO;
import com.checkmate.vo.GroupVO;


@Service
public class GroupServiceImpl implements GroupService {

	@Inject
	private GroupDAO dao;

	@Override
	public GroupVO findMaster(GroupVO groupVO) throws Exception {
		return dao.findMaster(groupVO);
	}
}
