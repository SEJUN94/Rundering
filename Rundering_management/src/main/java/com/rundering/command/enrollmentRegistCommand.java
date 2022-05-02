package com.rundering.command;

import com.rundering.dto.BranchVO;
import com.rundering.dto.MemberVO;

public class enrollmentRegistCommand {
	String name;
	String phone;
	String email;
	String branchName;
	String branchContact;
	String toparea;
	String area;
	String zip;
	String add1;
	String add2;
	int branchLndrpcrymslmcoqy;
	int A001;
	int A002;
	int A003;
	
	public MemberVO getMemberVO () {
		MemberVO member =new MemberVO();
		member.setName(name);
		member.setPhone(phone);
		member.setEmail(email);
		return member;
	}
	public BranchVO getBranchVO () {
		BranchVO branch = new BranchVO();
		branch.setBranchName(branchName);
		branch.setBranchContact(branchContact);
		branch.setArea(area);
		branch.setToparea(toparea);
		branch.setZip(zip);
		branch.setAdd1(add1);
		branch.setAdd2(add2);
		branch.setBranchLndrpcrymslmcoqy(branchLndrpcrymslmcoqy);
		return branch;
	}
	
	
}
