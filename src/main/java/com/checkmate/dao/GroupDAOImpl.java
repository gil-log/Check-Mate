package com.checkmate.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public GroupVO findMaster(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.findMaster", groupVO);
	}
	
}
