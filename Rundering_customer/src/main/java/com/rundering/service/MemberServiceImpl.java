package com.rundering.service;

import java.util.List;

import com.rundering.dao.MemberDAOBeanImpl;
import com.rundering.dto.MemberVO;

public class MemberServiceImpl implements MemberService{
	MemberDAOBeanImpl memberDAOBean;
	
	public void setMemberDAOBean(MemberDAOBeanImpl memberDAOBean) {
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
	
}
