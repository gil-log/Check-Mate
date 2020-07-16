package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.HomeworkVO;

@Repository
public class HomeworkDAOImpl implements HomeworkDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<HomeworkVO> homeworkListMini(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("homeworkMapper.homeworkListMini", groupVO);
	}

	@Override
	public int homeworkListCount(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("homeworkMapper.homeworkListCount", groupVO);
	}
	
	//과제 작성
	@Override
	public void write(HomeworkVO homeworkVO) throws Exception{
		sqlSession.insert("homeworkMapper.write", homeworkVO);
	}

	@Override
	public List<HomeworkVO> homeworkPossibleIdList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("homeworkMapper.homeworkPossibleIdList", groupVO);
	}

	@Override
	public HomeworkVO hwFindVo(HomeworkVO homeworkVO) throws Exception {
		return sqlSession.selectOne("homeworkMapper.hwFindVo", homeworkVO);
	}

	@Override
	public List<HomeworkVO> hwFindList(HomeworkVO homeworkVO) throws Exception {
		return sqlSession.selectList("homeworkMapper.hwFindList", homeworkVO);
	}

	@Override
	public List<HomeworkVO> hwImpossibleIdList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("homeworkMapper.hwImpossibleIdList", groupVO);
	}

}
