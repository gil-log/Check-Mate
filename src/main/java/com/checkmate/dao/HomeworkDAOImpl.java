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
	
	//과제 작성(그룹장)
	@Override
	public void write(HomeworkVO homeworkVO) throws Exception{
		sqlSession.insert("homeworkMapper.write", homeworkVO);
	}
	
	//과제 작성
	@Override
	public void homeworkwrite(HomeworkVO homeworkVO) throws Exception{
		sqlSession.insert("homeworkMapper.homeworkwrite", homeworkVO);
	}
	
	//과제 제출완료
	@Override
	public HomeworkVO read(HomeworkVO homeworkVO) throws Exception {
		return sqlSession.selectOne("homeworkMapper.read", homeworkVO);
	}
		
	//과제 제출완료(그룹장)
	@Override
	public HomeworkVO homeworkread(int h_no) throws Exception {
		return sqlSession.selectOne("homeworkMapper.homeworkread", h_no);
	}
	
	@Override
	public void delete(HomeworkVO homeworkVO) throws Exception {
		sqlSession.delete("homeworkMapper.delete", homeworkVO);
	}
	
	//전체 목록 조회
	@Override
	public List<HomeworkVO> homeworkList(GroupVO groupVO) throws Exception{
		return sqlSession.selectList("homeworkMapper.homeworkList", groupVO);
	}
			
	@Override
	public int homeworkListAllCount(GroupVO groupVO) throws Exception{
		return sqlSession.selectOne("homeworkMapper.homeworkListAllCount", groupVO);
	}

	@Override
	public int hwCount(HomeworkVO homeworkVO) throws Exception {
		return sqlSession.selectOne("homeworkMapper.hwCount", homeworkVO);
	}
}
