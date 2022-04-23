package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.MemberVO;
import com.rundering.manage.Criteria;
import com.rundering.util.AppCriteria;

public class MemberDAOImpl implements MemberDAO {
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public MemberVO selectMemberById(String id) throws Exception {
		MemberVO member = session.selectOne("Member-Mapper.selectMemberById", id);
		return member;
	}

	@Override
	public List<String> selectAuthByMemberNo(String memberNo) throws Exception {
		List<String> auth = session.selectList("Member-Mapper.selectAuthByMemberNo", memberNo);
		return auth;
	}

	@Override
	public MemberVO selectEmployeeById(String id) throws Exception {
		MemberVO member = session.selectOne("Member-Mapper.selectEmployeeById", id);
		return member;
	}

	// 사원등록신청
	@Override
	public void applicationEmployee(MemberVO member) throws Exception {
		session.update("Member-Mapper.applicationEmployee", member);
	}

	// 등록신청 사원의 고유번호 가져오기
	@Override
	public MemberVO getMemberNo(String phone) throws Exception {

		MemberVO member = session.selectOne("Member-Mapper.getMemberById", phone);

		return member;
	}

	// 사원등록 후 아디디 및 비밀번호 변경
	@Override
	public void updateMember(MemberVO member) throws Exception {

		session.selectOne("Member-Mapper.updatemplmem", member);

	}

	// 로그인시 지점코드가 같은 사원신청 리스트 가져오기
	@Override
	public List<MemberVO> getEmplAppList(AppCriteria cri) throws Exception {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<MemberVO> appList = session.selectList("Member-Mapper.getemplapplist", cri, rowBounds);

		return appList;
	}

	// 리스트 개수 체크
	@Override
	public int applistCount(AppCriteria cri) throws SQLException {
		int count = session.selectOne("Member-Mapper.applistCount", cri);
		return count;
	}
	
	// 등록 신청 사원의 디테일 정보 가져오기
	@Override
	public MemberVO getEmpAppinfo(String memberNO) throws Exception {
		
		MemberVO member = session.selectOne("Member-Mapper.getEmpAppinfo", memberNO);

		return member;
	}


	@Override
	public List<MemberVO> selectMemberList(Criteria cri) throws Exception {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		List<MemberVO> memberList 
		= session.selectList("Member-Mapper.selectSearchMemberList",cri,rowBounds);
		
		return memberList;
	}


	@Override
	public int selectMemberListCount() throws Exception {
		int totalCount = session.selectOne("Member-Mapper.selectMemberListCount");
		return totalCount;
	}


	@Override
	public int selectMemberListCount(Criteria cri) throws Exception {
		int totalCount = session.selectOne("Member-Mapper.selectSearchMemberListCount",cri);
		return totalCount;
	}

}
