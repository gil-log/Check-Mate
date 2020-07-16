package com.checkmate.dao;

import com.checkmate.vo.HomeworkVO;

public interface HomeworkDAO {
	//과제 작성
	public void write(HomeworkVO homeworkVO) throws Exception;
	
}
