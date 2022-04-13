package com.rundering.dao;

import com.rundering.dto.MemberVO;

public interface MemberDAO {
	public MemberVO selectMemberById(String id) throws Exception;

}
