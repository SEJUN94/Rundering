package com.rundering.service;

import com.rundering.dto.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id) throws Exception;
}
