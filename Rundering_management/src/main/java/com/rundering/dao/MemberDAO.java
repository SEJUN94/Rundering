package com.rundering.dao;

import java.util.List;

import com.rundering.dto.MemberVO;
import com.rundering.manage.Criteria;

public interface MemberDAO {
	
	//고객리스트 조회		
	List<MemberVO> selectMemberList(Criteria cri)throws Exception;
	
	// 일반 리스트 전체 개수
	int selectMemberListCount() throws Exception;
	// 검색 결과의 전체 리스트 개수
	int selectMemberListCount(Criteria cri) throws Exception;
	
	// 고객 정보 조회
	public MemberVO selectMemberById(String id) throws Exception;
	
	public List<String> selectAuthByMemberNo(String memberNo) throws Exception;
	
	public MemberVO selectEmployeeById(String id) throws Exception;
}
