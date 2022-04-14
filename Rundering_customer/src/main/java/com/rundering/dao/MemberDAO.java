package com.rundering.dao;

import java.util.List;

import com.rundering.dto.MemberVO;

public interface MemberDAO {
	public MemberVO selectMemberById(String id) throws Exception;
	public List<String> selectAuthByMemberNo(String memberNo) throws Exception;
	public void updateLoginfailCountByMemberNo(String memberNo) throws Exception;
	public void updateLoginfailZeroByMemberNo(String memberNo) throws Exception;
	public void updateLastLoginByMemberNo(String memberNo) throws Exception;
	
}
