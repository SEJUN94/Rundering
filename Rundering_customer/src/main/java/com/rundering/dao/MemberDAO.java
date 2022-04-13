package com.rundering.dao;

import java.util.List;

import com.rundering.dto.MemberVO;

public interface MemberDAO {

	public MemberVO selectMemberById(String id) throws Exception;
	public List<String> selectAuthByMemberNo(String memberNo) throws Exception;
	public void updateLoginfailCountByMemberNo(String memberNo) throws Exception;
	public void updateLoginfailZeroByMemberNo(String memberNo) throws Exception;
	public void updateLastLoginByMemberNo(String memberNo) throws Exception;

	// 아이디 중복체크
	public MemberVO checkId(String id) throws Exception;

	// 회원 가입
	public void memberJoin(MemberVO member) throws Exception;

	// 회원 정보 수정
	public void modifyMember(MemberVO member) throws Exception;

	// 회원정보 삭제(비활성화)
	public void deleteMember(String id) throws Exception;
}
