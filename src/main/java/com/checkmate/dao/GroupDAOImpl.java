package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;

@Repository
public class GroupDAOImpl implements GroupDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void GroupCreate(GroupVO groupVO) throws Exception {
		sqlSession.insert("groupMapper.GroupCreate", groupVO);
	}

	@Override
	public List<GroupVO> GroupList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("groupMapper.GroupList", groupVO);
	}

	@Override
	public int GroupListCount(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.GroupListCount", groupVO);
	}

	@Override
	public GroupVO findMaster(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.findMaster", groupVO);
	}

	@Override
	public void userPoint(GroupPointVO groupPointVO) throws Exception {
		sqlSession.update("groupMapper.userPoint", groupPointVO);
	}
	
}
