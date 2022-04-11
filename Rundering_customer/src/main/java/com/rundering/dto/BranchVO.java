package com.rundering.dto;

import java.util.Date;

public class BranchVO {
	private String branchCode; //지점코드
	private String branchName; //지점명
	private String add; //주소
	private int branchLndrpcrymslmcoqy; //세탁가능수량
	private Date branchRegistDate; //등록일
	private String branchContact; //연락처
	private Date branchModifyDate; //수정일
	private String deleteat; //삭제여부
	private String topareacode; //지역분류코드
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getAdd() {
		return add;
	}
	public void setAdd(String add) {
		this.add = add;
	}
	public int getBranchLndrpcrymslmcoqy() {
		return branchLndrpcrymslmcoqy;
	}
	public void setBranchLndrpcrymslmcoqy(int branchLndrpcrymslmcoqy) {
		this.branchLndrpcrymslmcoqy = branchLndrpcrymslmcoqy;
	}
	public Date getBranchRegistDate() {
		return branchRegistDate;
	}
	public void setBranchRegistDate(Date branchRegistDate) {
		this.branchRegistDate = branchRegistDate;
	}
	public String getBranchContact() {
		return branchContact;
	}
	public void setBranchContact(String branchContact) {
		this.branchContact = branchContact;
	}
	public Date getBranchModifyDate() {
		return branchModifyDate;
	}
	public void setBranchModifyDate(Date branchModifyDate) {
		this.branchModifyDate = branchModifyDate;
	}
	public String getDeleteat() {
		return deleteat;
	}
	public void setDeleteat(String deleteat) {
		this.deleteat = deleteat;
	}
	public String getTopareacode() {
		return topareacode;
	}
	public void setTopareacode(String topareacode) {
		this.topareacode = topareacode;
	}
	
	
	
}
