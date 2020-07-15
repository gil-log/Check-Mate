package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.AttendVO;

@Repository
public class AttendDAOImpl implements AttendDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override 
	public List<AttendVO> attendList(AttendVO attendVO) throws Exception {
		return sqlSession.selectList("attendMapper.attendList", attendVO);
	}

	@Override
	public void attendInsert(AttendVO attendVO) throws Exception {
		sqlSession.insert("attendMapper.attendInsert", attendVO);
		
	}

}
