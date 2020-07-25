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

	@Override
	public void write(HomeworkVO homeworkVO) throws Exception {
		dao.write(homeworkVO);
	}

	@Override
	public List<HomeworkVO> homeworkPossibleIdList(GroupVO groupVO) throws Exception {
		return dao.homeworkPossibleIdList(groupVO);
	}

	@Override
	public HomeworkVO hwFindVo(HomeworkVO homeworkVO) throws Exception {
		return dao.hwFindVo(homeworkVO);
	}

	@Override
	public List<HomeworkVO> hwFindList(HomeworkVO homeworkVO) throws Exception {
		return dao.hwFindList(homeworkVO);
	}

	@Override
	public List<HomeworkVO> hwImpossibleIdList(GroupVO groupVO) throws Exception {
		return dao.hwImpossibleIdList(groupVO);
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
	public void delete(HomeworkVO homeworkVO) throws Exception {
		dao.delete(homeworkVO);
	}
		
	@Override
	public List<HomeworkVO> homeworkList(GroupVO groupVO) throws Exception {
		return dao.homeworkList(groupVO);
	}

	@Override
	public int homeworkListAllCount(GroupVO groupVO) throws Exception {
		return dao.homeworkListAllCount(groupVO);
	}

	@Override
	public int hwCount(HomeworkVO homeworkVO) throws Exception {
		return dao.hwCount(homeworkVO);
	}

	@Override
	public List<HomeworkVO> hwCompleteList(HomeworkVO homeworkVO) throws Exception {
		return dao.hwCompleteList(homeworkVO);
	}

	@Override
	public HomeworkVO hwView(HomeworkVO homeworkVO) throws Exception {
		return dao.hwView(homeworkVO);
	}

}
