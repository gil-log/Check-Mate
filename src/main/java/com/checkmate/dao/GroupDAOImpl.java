package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;

@Repository
public class GroupDAOImpl implements GroupDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void GroupCreate(GroupVO groupVO) throws Exception {
		sqlSession.insert("groupMapper.GroupCreate", groupVO);
	}

	@Override
	public List<GroupVO> GroupList(UserVO userVO) throws Exception {
		return sqlSession.selectList("groupMapper.GroupList", userVO);
	}

	@Override
	public int GroupListCount(UserVO userVO) throws Exception {
		return sqlSession.selectOne("groupMapper.GroupListCount", userVO);
	}

	@Override
	public GroupVO findMaster(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.findMaster", groupVO);
	}

	@Override
	public void userPoint(GroupPointVO groupPointVO) throws Exception {
		sqlSession.update("groupMapper.userPoint", groupPointVO);
	}

	@Override
	public GroupVO groupRead(int g_no) throws Exception {
		return sqlSession.selectOne("groupMapper.groupRead", g_no);
	}
	
	@Override
	public void userPlus(GroupVO groupVO) throws Exception {
		sqlSession.insert("groupMapper.userPlus", groupVO);
	}

}
