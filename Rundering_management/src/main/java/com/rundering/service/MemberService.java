package com.rundering.service;

import java.util.List;

import com.rundering.dto.MemberVO;
import com.rundering.manage.Criteria;

public interface MemberService {
	
	//고객 리스트 조회
	public List<MemberVO> getMemberList(Criteria cri)throws Exception;
	
	//고객 정보 조회
	public MemberVO getMember(String id) throws Exception;

	//권한그룹코드 분류
	public List<String> getAuthList(String memberNo) throws Exception;
	
	//사원여부
	public MemberVO getEmployee(String id) throws Exception;
}
