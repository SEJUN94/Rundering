package com.rundering.service;

import java.util.List;

import com.rundering.dao.MemberDAOImpl;
import com.rundering.dto.MemberVO;

public class MemberServiceImpl implements MemberService{
	MemberDAOImpl memberDAOBean;
	
	public void setMemberDAOBean(MemberDAOImpl memberDAOBean) {
		this.memberDAOBean = memberDAOBean;
	}
	
	@Override
	public MemberVO getMember(String id) throws Exception {
		MemberVO member = memberDAOBean.selectMemberById(id);
		return member;
	}
	
	@Override
	public List<String> getAuthList(String memberNo) throws Exception {
		List<String> auth = memberDAOBean.selectAuthByMemberNo(memberNo);
		return auth;
	}
	
	//ID중복체크
	@Override
	public MemberVO checkId(String id) throws Exception {
		MemberVO member = memberDAOBean.checkId(id);
		return member;
	}
	
	//회원가입
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		memberDAOBean.memberJoin(member);
	}
	
	//회원정보수정
	@Override
	public void modifyMember(MemberVO member) throws Exception {
		memberDAOBean.modifyMember(member);
	}
	
	//회원 탈퇴(비활성화)
	@Override
	public void deleteMember(String id) throws Exception {
		memberDAOBean.deleteMember(id);
	}
	
}
