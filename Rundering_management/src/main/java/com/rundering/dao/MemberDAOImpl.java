package com.rundering.dao;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.MemberVO;

public class MemberDAOImpl implements MemberDAO{
	SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}



	@Override
	public MemberVO selectMemberById(String id) throws Exception {
		
		MemberVO member= session.selectOne("Member-mapper.selectMemberById", id);
		
		return member;
	}

	
}
