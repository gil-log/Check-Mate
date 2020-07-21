package com.checkmate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.checkmate.dao.HomeworkDAO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

@Service
public class HomeworkServiceImpl implements HomeworkService {

	@Inject
	private HomeworkDAO dao;
	
	@Override
	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception {
		return dao.homeworkListMini(groupVO);
	}

	@Override
	public int homeworkListCount(GroupVO groupVO) throws Exception {
		return dao.homeworkListCount(groupVO);
	}

	//과제 작성(그룹장)
	@Override
	public void write(HomeworkVO homeworkVO) throws Exception {
		dao.write(homeworkVO);
	}
	
	@Override
	public void homeworkwrite(HomeworkVO homeworkVO) throws Exception {
		dao.homeworkwrite(homeworkVO);
	}
		
	//과제 제출완료
	@Override
	public HomeworkVO read(HomeworkVO homeworkVO) throws Exception {
		return dao.read(homeworkVO);
	}
		
	//모든 과제 읽어오기(그룹장)
	@Override
	public HomeworkVO homeworkread(int h_no) throws Exception {
		return dao.homeworkread(h_no);
	}
		
	@Override
	public List<HomeworkVO> homeworkList(GroupVO groupVO) throws Exception {
		return dao.homeworkList(groupVO);
	}

	@Override
	public int homeworkListAllCount(GroupVO groupVO) throws Exception {
		return dao.homeworkListAllCount(groupVO);
	}

}
