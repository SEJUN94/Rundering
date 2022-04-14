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
	public void updateLoginfailCountByMemberNo(String memberNo) throws Exception{
		session.update("Member-Mapper.updateLoginfailCountByMemberNo", memberNo);
	}
	@Override 
	public void updateLoginfailZeroByMemberNo(String memberNo) throws Exception{
		session.update("Member-Mapper.updateLoginfailZeroByMemberNo", memberNo);
	}
	@Override
	public void updateLastLoginByMemberNo(String memberNo) throws Exception{
		session.update("Member-Mapper.updateLastLoginByMemberNo",memberNo);
	}
	@Override
	public int selectIdFindByMember(MemberVO member) throws Exception{
		int check =session.selectOne("Member-Mapper.selectIdFindByMember",member);
		return check;
	}
	@Override
	public int selectPasswordFindByMember(MemberVO member) throws Exception{
		int check =session.selectOne("Member-Mapper.selectPasswordFindByMember",member);
		return check;
	}
	@Override
	public String selectGetFindIdByMember(MemberVO member) throws Exception{
		String id = session.selectOne("Member-Mapper.selectGetFindIdByMember",member);
		return id;
	}
	@Override
	public void updatePasswordByMember(MemberVO member) throws Exception{
		session.update("Member-Mapper.updatePasswordByMember",member);
	}

	
}
