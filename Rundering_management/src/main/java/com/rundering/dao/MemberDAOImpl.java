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

	//사원등록신청
	@Override
	public void applicationEmployee(MemberVO member) throws Exception {
		session.update("Member-Mapper.applicationEmployee",member);
	}

	//등록신청 사원의 고유번호 가져오기
	@Override
	public MemberVO getMemberNo(String phone) throws Exception {

		MemberVO member= session.selectOne("Member-Mapper.getMemberById", phone);
		
		return member;
	}
}
