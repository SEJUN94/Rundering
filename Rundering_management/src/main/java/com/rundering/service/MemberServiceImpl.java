package com.rundering.service;

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
	
}
