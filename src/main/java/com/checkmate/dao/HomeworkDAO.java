package com.checkmate.dao;

import java.util.List;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

public interface HomeworkDAO {
	
	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception;

	public int homeworkListCount(GroupVO groupVO) throws Exception;
}
