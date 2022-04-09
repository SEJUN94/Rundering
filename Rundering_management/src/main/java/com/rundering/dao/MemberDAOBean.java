package com.rundering.dao;

import com.rundering.dto.MemberVO;

public interface MemberDAOBean {
	public MemberVO selectMemberById(String id) throws Exception;

}
