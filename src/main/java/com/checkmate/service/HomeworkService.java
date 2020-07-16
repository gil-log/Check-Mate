package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

public interface HomeworkService {

	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception;

	public int homeworkListCount(GroupVO groupVO) throws Exception;

	//과제 작성
	public void write(HomeworkVO homeworkVO) throws Exception;
}