package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.AttendListVO;
import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;

@Repository
public class AttendDAOImpl implements AttendDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override 
	//출석현황 리스트 출력
	public List<AttendListVO> attendList(AttendVO attendVO) throws Exception {
		return sqlSession.selectList("attendMapper.attendList", attendVO);
	}

	@Override
	//출석생성
	public void attendMake(AttendVO attendVO) throws Exception {
		sqlSession.insert("attendMapper.attendMake", attendVO);
		
	}

	@Override
	//추가한 출석 불러오기
	public AttendVO attendLast(AttendVO attendVO) throws Exception {
		return sqlSession.selectOne("attendMapper.attendLast", attendVO);
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