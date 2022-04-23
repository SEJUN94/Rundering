package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.MemberVO;
import com.rundering.util.AppCriteria;

public interface MemberDAO {
	public MemberVO selectMemberById(String id) throws Exception;

	public List<String> selectAuthByMemberNo(String memberNo) throws Exception;

	public MemberVO selectEmployeeById(String id) throws Exception;

	// 사원등록신청
	public void applicationEmployee(MemberVO member) throws Exception;

	// 등록신청 사원의 고유번호 가져오기
	public MemberVO getMemberNo(String phone) throws Exception;
	
	//신청 등록 사원의 디테일 출력
	public MemberVO getEmpAppinfo(String memberNO) throws Exception;

	// 사원등록 후 아디디 및 비밀번호 변경
	public int updateMember(MemberVO member) throws Exception;

	// 로그인시 지점코드가 같은 사원신청 리스트 가져오기
	public List<MemberVO> getEmplAppList(AppCriteria cri) throws Exception;

	// 전체 개수 체크
	public int applistCount(AppCriteria cri) throws SQLException;
	
	// 등록 신청 사원 반려 
	public int removeByNo(String memberNo) throws Exception;
}
