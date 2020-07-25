package com.checkmate.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.checkmate.vo.GroupPointVO;
import com.checkmate.vo.GroupVO;
import com.checkmate.vo.UserVO;

@Repository
public class GroupDAOImpl implements GroupDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void GroupCreate(GroupVO groupVO) throws Exception {
		sqlSession.insert("groupMapper.GroupCreate", groupVO);
	}
	
	@Override
	//초대현황
	public List<GroupVO> groupCheck(UserVO userVO) throws Exception {
		return sqlSession.selectList("groupMapper.groupCheck", userVO);
	}
	
	@Override
	//초대 yes
	public void groupYes(GroupVO groupVO) throws Exception {
		sqlSession.update("groupMapper.groupYes", groupVO);
	}
	
	@Override
	//초대 no
	public void groupNo(GroupVO groupVO) throws Exception {
		sqlSession.delete("groupMapper.groupNo", groupVO);
	}

	@Override
	public List<GroupVO> GroupList(UserVO userVO) throws Exception {
		return sqlSession.selectList("groupMapper.GroupList", userVO);
	}

	@Override
	public int GroupListCount(UserVO userVO) throws Exception {
		return sqlSession.selectOne("groupMapper.GroupListCount", userVO);
	}

	@Override
	public GroupVO findMaster(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.findMaster", groupVO);
	}

	@Override
	public void userPoint(GroupPointVO groupPointVO) throws Exception {
		sqlSession.update("groupMapper.userPoint", groupPointVO);
	}

	@Override
	public List<GroupPointVO> findTopRankList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("groupMapper.findTopRankList", groupVO);
	}

	@Override
	public GroupPointVO findMyRank(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.findMyRank", groupVO);
	}

	@Override
	public void socketConnection(GroupVO groupVO) throws Exception {
		sqlSession.update("groupMapper.socketConnection", groupVO);
	}

	@Override
	public List<GroupVO> socketConnectionList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("groupMapper.socketConnectionList", groupVO);
	}
	
	@Override
	public GroupVO groupRead(GroupVO groupVO) throws Exception {
		return sqlSession.selectOne("groupMapper.groupRead", groupVO);
	}
	
	@Override
	public void userPlus(GroupVO groupVO) throws Exception {
		sqlSession.insert("groupMapper.userPlus", groupVO);
	}
	
	@Override
	//출석 생성시 그룹원들의 attend를 추가하기 위해 그룹원 이름 가져오기!
	public List<GroupVO> groupMemberList(GroupVO groupVO) throws Exception {
		return sqlSession.selectList("groupMapper.groupMemberList", groupVO);
	}

	@Override
	public void userPlusMailAuth(GroupVO groupVO) throws Exception {
		sqlSession.update("groupMapper.userPlusMailAuth", groupVO);
	}

	@Override
	public void groupLock(GroupVO groupVO) throws Exception {
		sqlSession.update("groupMapper.groupLock", groupVO);
	}
}
