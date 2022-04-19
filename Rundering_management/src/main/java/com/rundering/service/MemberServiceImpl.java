package com.rundering.service;

import java.util.List;

import com.rundering.dao.MemberDAOImpl;
import com.rundering.dto.MemberVO;

public class MemberServiceImpl implements MemberService{
	
	MemberDAOImpl memberDAO;
	
	public void setMemberDAO(MemberDAOImpl memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public MemberVO getMember(String id) throws Exception {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}
	
	@Override
	public List<String> getAuthList(String memberNo) throws Exception {
		List<String> auth = memberDAO.selectAuthByMemberNo(memberNo);
		return auth;
	}
	
	//사원등록신청
	@Override
	public void applicationEmployee(MemberVO member) throws Exception {
		memberDAO.applicationEmployee(member);
	}
	
	
	//등록신청 사원의 고유번호 가져오기
	@Override
	public MemberVO getMemberNo(String phone) throws Exception {
		MemberVO member = memberDAO.getMemberNo(phone);
		return member;
	}
	
	
	
}
