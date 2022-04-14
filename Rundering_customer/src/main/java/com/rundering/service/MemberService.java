package com.rundering.service;

import java.util.List;

import com.rundering.dto.MemberVO;

public interface MemberService {
	public MemberVO getMember(String id) throws Exception;
	public List<String> getAuthList(String memberNo) throws Exception;
	public void loginFailIncrease(String memberNo) throws Exception;
	public void loginSuccess(String memberNo) throws Exception;
	public int idFind(MemberVO member) throws Exception;
	public int passwordFind(MemberVO member) throws Exception;
	public String getFindId(MemberVO member) throws Exception;
	public void updatePassword(MemberVO member) throws Exception;
}
