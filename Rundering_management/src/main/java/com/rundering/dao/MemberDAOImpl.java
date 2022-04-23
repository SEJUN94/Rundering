package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.MemberVO;
import com.rundering.manage.Criteria;

public class MemberDAOImpl implements MemberDAO{
	SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}


	@Override
	public MemberVO selectMemberById(String id) throws Exception {
		
		MemberVO member= session.selectOne("Member-Mapper.selectMemberById", id);
		return member;
	}
	@Override
	public List<String> selectAuthByMemberNo(String memberNo) throws Exception {
		List<String> auth = session.selectList("Member-Mapper.selectAuthByMemberNo",memberNo);
		return auth;
	}

	@Override
	public MemberVO selectEmployeeById(String id) throws Exception {
		MemberVO member = session.selectOne("Member-Mapper.selectEmployeeById",id);
		return member;
	}

	@Override
	public List<MemberVO> selectMemberList(Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<MemberVO> memberList 
		= session.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);
		
		return memberList;
	}


	@Override
	public int selectMemberListCount() throws Exception {
		int totalCount = session.selectOne("Member-Mapper.selectMemberListCount");
		return totalCount;
	}


	@Override
	public int selectMemberListCount(Criteria cri) throws Exception {
		int totalCount = session.selectOne("Member-Mapper.selectSearchMemberListCount",cri);
		return totalCount;
	}
}
