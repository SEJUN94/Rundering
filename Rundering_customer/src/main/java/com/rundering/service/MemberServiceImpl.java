package com.rundering.service;

import java.util.List;

import com.rundering.dao.MemberDAOImpl;
import com.rundering.dto.MemberVO;

public class MemberServiceImpl implements MemberService{
	MemberDAOImpl memberDAOBean;
	
	public void setMemberDAOBean(MemberDAOImpl memberDAOBean) {
		this.memberDAOBean = memberDAOBean;
	}
	@Override
	public MemberVO getMember(String id) throws Exception {
		MemberVO member = memberDAOBean.selectMemberById(id);
		return member;
	}
	@Override
	public List<String> getAuthList(String memberNo) throws Exception {
		List<String> auth = memberDAOBean.selectAuthByMemberNo(memberNo);
		return auth;
	}
	@Override
	public void loginFailIncrease(String memberNo) throws Exception{
		memberDAOBean.updateLoginfailCountByMemberNo(memberNo);
	}
	@Override 
	public void loginSuccess(String memberNo) throws Exception{
		memberDAOBean.updateLastLoginByMemberNo(memberNo);
		memberDAOBean.updateLoginfailZeroByMemberNo(memberNo);
	}
	@Override
	public int idFind(MemberVO member) throws Exception {
		int check = memberDAOBean.selectIdFindByMember(member);
		return check;
	}
	@Override
	public int passwordFind(MemberVO member) throws Exception {
		int check = memberDAOBean.selectPasswordFindByMember(member);
		return check;
	}
	@Override
	public String getFindId(MemberVO member) throws Exception{
		String id = memberDAOBean.selectGetFindIdByMember(member);
		return id;
	}
	@Override
	public void updatePassword(MemberVO member) throws Exception{
		
		
		memberDAOBean.updatePasswordByMember(member);
		member =memberDAOBean.selectMemberById(member.getId());
		memberDAOBean.updateLoginfailZeroByMemberNo(member.getMemberNo());
	}
	
}
