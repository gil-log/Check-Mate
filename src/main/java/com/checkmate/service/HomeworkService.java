package com.checkmate.service;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

public interface HomeworkService {

	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception;

	public int homeworkListCount(GroupVO groupVO) throws Exception;

	//과제 작성(그룹장)
	public void write(HomeworkVO homeworkVO) throws Exception;
	
	public void homeworkwrite(HomeworkVO homeworkVO) throws Exception;
	
	//과제 제출완료
	public HomeworkVO read(HomeworkVO homeworkVO) throws Exception;
		
	//모든 과제 읽어오기(그룹장)
	public HomeworkVO homeworkread(int h_no) throws Exception;
	
	//과제 삭제(그룹장)
	public void delete(HomeworkVO homeworkVO) throws Exception;
		
	//전체 목록 조회
	public List<HomeworkVO> homeworkList(GroupVO groupVO) throws Exception;
			
	public int homeworkListAllCount(GroupVO groupVO) throws Exception;

	// 해당 개수 0 인지 1 인지 세기
	public int hwCount(HomeworkVO homeworkVO) throws Exception;
}
