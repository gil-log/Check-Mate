package com.checkmate.service;

import com.checkmate.vo.HomeworkVO;

public interface HomeworkService {
	//과제 작성
		public void write(HomeworkVO homeworkVO) throws Exception;
}
