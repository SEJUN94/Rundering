package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.CustomerListCriteria;
import com.rundering.command.CustomerListPageMaker;
import com.rundering.dao.MemberDAOImpl;
import com.rundering.dto.MemberVO;
import com.rundering.util.AppCriteria;
import com.rundering.util.AppPageMaker;

public class MemberServiceImpl implements MemberService {

	MemberDAOImpl memberDAO;

	public void setMemberDAO(MemberDAOImpl memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public MemberVO getEmployee(String id) throws Exception {
		MemberVO member = memberDAO.selectEmployeeById(id);
		return member;
	}

	// 사원등록신청
	@Override
	public void applicationEmployee(MemberVO member) throws Exception {
		memberDAO.applicationEmployee(member);
	}

	// 등록신청 사원의 고유번호 가져오기
	@Override
	public MemberVO getMemberNo(String phone) throws Exception {
		MemberVO member = memberDAO.getMemberNo(phone);
		return member;
	}

	// 사원등록 후 아이디 및 비밀번호 변경
	@Override
	public void updateMember(MemberVO member) throws Exception {
		memberDAO.updateMember(member);

	}

	// 로그인시 지점코드가 같은 사원신청 리스트 가져오기
	@Override
	public Map<String, Object> getEmplAppList(AppCriteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MemberVO> appList = memberDAO.getEmplAppList(cri);
		
		// 전체 list 개수
		int totalCount = memberDAO.applistCount(cri);
		// PageMaker 생성.
		AppPageMaker pageMaker = new AppPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("appList", appList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}
	
	// 등록 신청 사원의 디테일 정보 가져오기
	@Override
	public MemberVO getEmpAppinfo(String memberNO) throws Exception {
		MemberVO mv = memberDAO.getEmpAppinfo(memberNO);
		
		return mv;
	}
	
	//권한그룹
	@Override
	public List<String> getAuthList(String memberNo) throws Exception {
		List<String> auth = memberDAO.selectAuthByMemberNo(memberNo);
		return auth;
	}
	
	
	
	//고객 정보 	
	@Override
	public MemberVO getMember(String id) throws Exception {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}

	//고객리스트
	@Override
	public Map<String, Object> getMemberList(CustomerListCriteria cri) throws Exception {
		CustomerListCriteria searchCri = (CustomerListCriteria)cri;
		Map<String, Object> dataMap = new HashMap<String, Object>();

		CustomerListPageMaker pageMaker = new CustomerListPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(memberDAO.selectMemberListCount(searchCri));

		List<MemberVO> memberList = memberDAO.selectMemberList(searchCri);

		dataMap.put("memberList", memberList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


}
