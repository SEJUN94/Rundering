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
	@Override
	public void loginFailIncrease(String memberNo) throws Exception{
		memberDAOBean.updateLoginfailCountByMemberNo(memberNo);
	}
	
}
