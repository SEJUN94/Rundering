package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public MemberVO getMember(String id) throws Exception {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}

	@Override
	public List<String> getAuthList(String memberNo) throws Exception {
		List<String> auth = memberDAO.selectAuthByMemberNo(memberNo);
		return auth;
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
}
