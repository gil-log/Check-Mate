package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;

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

	@Override
	public List<AttendVO> attendListCalendar(AttendVO attendVO) throws Exception {
		return sqlSession.selectList("attendMapper.attendListCalendar", attendVO);
	}

	@Override
	public int attendGnoUidCount(AttendVO attendVO) throws Exception {
		return sqlSession.selectOne("attendMapper.attendGnoUidCount", attendVO);
	}

	@Override
	public int attendMasterCount(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("attendMapper.attendMasterCount", groupVO);
	}

}