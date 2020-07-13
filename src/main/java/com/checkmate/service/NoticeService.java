package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;


public interface NoticeService {

	public List<NoticeVO> noticeList(GroupVO groupVO) throws Exception;

	public int noticeListCount(GroupVO groupVO) throws Exception;
}
