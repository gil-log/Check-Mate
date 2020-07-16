package com.checkmate.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.HomeworkVO;


@Repository
public class HomeworkDAOImpl implements HomeworkDAO{
	@Inject
	private SqlSession sqlSession;
	
	//과제 작성
	@Override
	public void write(HomeworkVO homeworkVO) throws Exception{
		sqlSession.insert("homeworkMapper.insert", homeworkVO);
	}

}
