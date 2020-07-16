package com.checkmate.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.HomeworkDAO;
import com.checkmate.vo.HomeworkVO;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	@Inject
	private HomeworkDAO dao;
	
	// 과제 작성
	@Override
	public void write(HomeworkVO homeworkVO) throws Exception {
		dao.write(homeworkVO);
	}
}
