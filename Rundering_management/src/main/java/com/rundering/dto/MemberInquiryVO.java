package com.rundering.dto;

import java.util.Date;

public class MemberInquiryVO {
	private int inqryno;     //문의번호
	private String memberno;    //회원고유번호
	private String inqryclcode; //문의분류코드
	private String title;       //제목
	private String answercn;    //답변내용
	private Date answerdeman; //답변일자
	private String content;     //내용
	private Date inqrydate;   //문의날짜
	private String answerennc;  //답변유무
	private String deleteat;    //삭제여부
	private String atchFileNo;  //통합첨부파일 번호
	private String answrr;      //답변자
	private String orderno;     //주문번호

	public int getInqryno() {
		return inqryno;
	}
	public void setInqryno(int inqryno) {
		this.inqryno = inqryno;
	}
	public String getMemberno() {
		return memberno;
	}
	public void setMemberno(String memberno) {
		this.memberno = memberno;
	}
	public String getInqryclcode() {
		return inqryclcode;
	}
	public void setInqryclcode(String inqryclcode) {
		this.inqryclcode = inqryclcode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAnswercn() {
		return answercn;
	}
	public void setAnswercn(String answercn) {
		this.answercn = answercn;
	}
	public Date getAnswerdeman() {
		return answerdeman;
	}
	public void setAnswerdeman(Date answerdeman) {
		this.answerdeman = answerdeman;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getInqrydate() {
		return inqrydate;
	}
	public void setInqrydate(Date inqrydate) {
		this.inqrydate = inqrydate;
	}
	public String getAnswerennc() {
		return answerennc;
	}
	public void setAnswerennc(String answerennc) {
		this.answerennc = answerennc;
	}
	public String getDeleteat() {
		return deleteat;
	}
	public void setDeleteat(String deleteat) {
		this.deleteat = deleteat;
	}
	public String getAtchFileNo() {
		return atchFileNo;
	}
	public void setAtchFileNo(String atchFileNo) {
		this.atchFileNo = atchFileNo;
	}
	public String getAnswrr() {
		return answrr;
	}
	public void setAnswrr(String answrr) {
		this.answrr = answrr;
	}
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	
	
}
