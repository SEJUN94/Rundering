package com.rundering.dao;

import java.util.List;

import com.rundering.dto.MemberVO;

public interface MemberDAOBean {
	public MemberVO selectMemberById(String id) throws Exception;
	public List<String> selectAuthByMemberNo(String memberNo) throws Exception;
	
}
