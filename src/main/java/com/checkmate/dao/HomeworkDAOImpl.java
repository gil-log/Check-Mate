package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

@Repository
public class HomeworkDAOImpl implements HomeworkDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("homeworkMapper.homeworkListMini", groupVO);
	}

	@Override
	public int homeworkListCount(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("homeworkMapper.homeworkListCount", groupVO);
	}

}
