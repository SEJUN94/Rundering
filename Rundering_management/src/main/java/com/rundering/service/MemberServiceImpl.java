package com.rundering.service;

import java.util.List;

import com.rundering.dao.MemberDAOImpl;
import com.rundering.dto.MemberVO;
import com.rundering.manage.Criteria;

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

	@Override
	public MemberVO getEmployee(String id) throws Exception {
		MemberVO member = memberDAO.selectEmployeeById(id);
		return member;
	}

	@Override
	public List<MemberVO> getMemberList(Criteria cri) throws Exception {
		return null;
	}
}
