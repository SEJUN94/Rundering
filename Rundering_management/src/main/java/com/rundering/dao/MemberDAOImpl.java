package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.MemberVO;

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
}
