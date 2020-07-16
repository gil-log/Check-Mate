package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

public interface HomeworkDAO {
	
	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception;

	public int homeworkListCount(GroupVO groupVO) throws Exception;
	
	//과제 작성
	public void write(HomeworkVO homeworkVO) throws Exception;
	
	//진행 중인 과제에서 내가 안한거 목록 보기 즉 과제 진행 중을 뽑아옴
	public List<HomeworkVO> homeworkPossibleList(GroupVO groupVO) throws Exception;
}
