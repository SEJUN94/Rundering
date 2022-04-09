package com.rundering.service;

import java.util.List;

import com.rundering.dto.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id) throws Exception;
	public List<String> getAuthList(String memberNo) throws Exception;
}
