package com.rundering.service;

import java.sql.SQLException;
import java.util.List;

import com.rundering.dto.ReplyVO;

public interface ReplyService {
	

	//리스트보기
	List<ReplyVO> getReplyList(int replyno)throws Exception;	
	
	//등록
	void registReply(ReplyVO reply)throws SQLException;
		
	//수정
	void modifyReply(ReplyVO reply)throws SQLException;
	
	//삭제
	void removeReply(int replyno)throws SQLException;
}



