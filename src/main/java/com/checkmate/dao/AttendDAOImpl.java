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
	public List<AttendVO> attendList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("attendMapper.attendList", groupVO);
	}

	@Override
	//출석생성
	public void attendMake(AttendVO attendVO) throws Exception {
		sqlSession.insert("attendMapper.attendMake", attendVO);
		
	}

	@Override
	//추가한 출석 불러오기
	public AttendVO attendLast(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("attendMapper.attendLast", groupVO);
	}

	@Override
	//출석가능 시간이 지났을 때(관리자)
	public void attendClose(AttendVO attendVO) throws Exception {
		sqlSession.insert("attendMapper.attendClose", attendVO);
		
	}
	
	@Override
	//출석상태 update
	public void attendUpdate(GroupVO groupVO) throws Exception {
		sqlSession.update("attendMapper.attendUpdate", groupVO);
		
	}
	
	@Override
	//출석체크 버튼을 누른경우
	public void attendClick(AttendVO attendVO) throws Exception {
		sqlSession.update("attendMapper.attendClick", attendVO);
		
	}

	@Override
	//선택한 출석정보 불러오기
	public AttendVO attendSelect(AttendVO attendVO) throws Exception {
		return sqlSession.selectOne("attendMapper.attendSelect", attendVO);
	}
		
	@Override
	//출석관리 화면
	public List<AttendVO> attendManage(AttendVO attendVO) throws Exception {
		return sqlSession.selectList("attendMapper.attendManage", attendVO);
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