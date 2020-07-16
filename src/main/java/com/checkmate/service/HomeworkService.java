package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

public interface HomeworkService {

	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception;

	public int homeworkListCount(GroupVO groupVO) throws Exception;

	//과제 작성
	public void write(HomeworkVO homeworkVO) throws Exception;

	//진행 중인 과제에서 내가 안한거 목록 보기 즉 과제 진행 중을 뽑아옴
	public List<HomeworkVO> homeworkPossibleIdList(GroupVO groupVO) throws Exception;

	//진행 가능한 과제를 h_no 검색을 통해 그 정보들을 가져옴
	public HomeworkVO hwFindVo(HomeworkVO homeworkVO) throws Exception;

	//세션 아이디가 제출을 마친 과제 리스트 가져옴
	public List<HomeworkVO> hwFindList(HomeworkVO homeworkVO) throws Exception;
	
	// 제출기간 놀쳐서 불가능한 미제출 과제 h_no 리스트 가져옴
	public List<HomeworkVO> hwImpossibleIdList(GroupVO groupVO) throws Exception;
}
