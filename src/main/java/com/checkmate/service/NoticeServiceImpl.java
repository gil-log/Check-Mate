package com.checkmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.NoticeDAO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	@Override
	public List<NoticeVO> noticeList(GroupVO groupVO) throws Exception {
		return dao.noticeList(groupVO);
	}

	@Override
	public int noticeListCount(GroupVO groupVO) throws Exception {
		return dao.noticeListCount(groupVO);
	}

	@Override
	public void noticeWrite(NoticeVO noticeVO) throws Exception {
		dao.noticeWrite(noticeVO);
	}

	@Override
	public List<NoticeVO> noticeListMini(GroupVO groupVO) throws Exception {
		return dao.noticeListMini(groupVO);
	}

	@Override
	public NoticeVO noticeRead(NoticeVO noticeVO) throws Exception {
		return dao.noticeRead(noticeVO);
	}

	@Override
	public void noticeDelete(NoticeVO noticeVO) throws Exception {
		dao.noticeDelete(noticeVO);
	}

}
