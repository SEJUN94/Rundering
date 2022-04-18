package com.rundering.dto;

import java.util.Date;

public class FAQVO {
	private int faqno;  			//질문번호
	private String setbukdoorclcode;//질문분류코드
	private String question;  		//질문
	private String answer;    		//답변
	private Date registDate;  		//등록일
	private Date modifyDate;   		//수정일
	private String writer;    		//작성자
	
	
	public FAQVO() {
		super();
	}
	
	
	public int getFaqno() {
		return faqno;
	}
	public void setFaqno(int faqno) {
		this.faqno = faqno;
	}
	public String getSetbukdoorclcode() {
		return setbukdoorclcode;
	}
	public void setSetbukdoorclcode(String setbukdoorclcode) {
		this.setbukdoorclcode = setbukdoorclcode;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public Date getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
