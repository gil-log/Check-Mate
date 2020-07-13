package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupVO;
import com.checkmate.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeVO> noticeList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("noticeMapper.noticeList", groupVO);
	}

	@Override
	public int noticeListCount(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("noticeMapper.noticeListCount", groupVO);
	}

}
