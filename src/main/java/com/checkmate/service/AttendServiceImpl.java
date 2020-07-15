package com.checkmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.AttendDAO;
import com.checkmate.vo.AttendVO;
import com.checkmate.vo.GroupVO;

@Service
public class AttendServiceImpl implements AttendService {

	@Inject
	private AttendDAO dao;
	
	@Override
	//출석현황 리스트 출력
	public List<AttendVO> attendList(AttendVO attendVO) throws Exception {
		return dao.attendList(attendVO);
	}

	@Override
	//출석생성
	public void attendInsert(AttendVO attendVO) throws Exception {
		dao.attendInsert(attendVO);
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