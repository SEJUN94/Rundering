package com.rundering.service;

import java.util.List;

import com.rundering.dto.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id) throws Exception;

	public List<String> getAuthList(String memberNo) throws Exception;
	
	//사원등록신청
	public void applicationEmployee(MemberVO member) throws Exception;
	
	//등록사원의 고유번호 가져오기
	public MemberVO getMemberNo(String phone) throws Exception;
	
}
