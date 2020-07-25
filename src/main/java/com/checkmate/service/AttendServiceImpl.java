package com.checkmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.AttendDAO;
import com.checkmate.vo.AttendListVO;
import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;

@Service
public class AttendServiceImpl implements AttendService {

	@Inject
	private AttendDAO dao;
	
	@Override
	//출석현황 리스트 출력
	public List<AttendVO> attendList(GroupVO groupVO) throws Exception {
		return dao.attendList(groupVO);
	}

	@Override
	//출석생성
	public void attendMake(AttendVO attendVO) throws Exception {
		dao.attendMake(attendVO);
	}
	
	@Override
	//추가한 출석 불러오기
	public AttendVO attendLast(GroupVO groupVO) throws Exception {
		return dao.attendLast(groupVO);
	}

	//출석가능 시간이 지났을 때(관리자)
	public void attendClose(AttendVO attendVO) throws Exception {
		dao.attendClose(attendVO);
	}

	@Override
	//출석상태 update
	public void attendUpdate(GroupVO groupVO) throws Exception {
		dao.attendUpdate(groupVO);
	}

	@Override
	//출석체크 버튼을 누른경우
	public void attendClick(AttendVO attendVO) throws Exception {
		dao.attendClick(attendVO);
	}
	

	@Override
	//선택한 출석정보 불러오기
	public AttendVO attendSelect(AttendVO attendVO) throws Exception {
		return dao.attendSelect(attendVO);
	}

	@Override
	//출석관리 화면
	public List<AttendListVO> attendDetail(AttendVO attendVO) throws Exception {
		return dao.attendDetail(attendVO);
	}
	

	@Override
	//관리자가 출석현황을 수정한 경우
	public void attendManage(AttendVO attendVO) throws Exception {
		dao.attendManage(attendVO);
	}
	
	
	
	@Override
	public List<AttendVO> attendListCalendar(AttendVO attendVO) throws Exception {
		return dao.attendListCalendar(attendVO);
	}

	@Override
	public int attendGnoUidCount(AttendVO attendVO) throws Exception {
		return dao.attendGnoUidCount(attendVO);
	}

	@Override
	public int attendMasterCount(GroupVO groupVO) throws Exception {
		return dao.attendMasterCount(groupVO);
	}


}