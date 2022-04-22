package com.rundering.dao;

import java.util.List;

import com.rundering.dto.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> selectReplyByReplyNo(String replyNo) throws Exception;

	int selectReplySeq() throws Exception;

	void insertReplyByReplyVO(ReplyVO reply) throws Exception;

	void insertReplyByReplyVOFirst(ReplyVO reply) throws Exception;
	
	int selectReplyCountByReplyno(String replyno) throws Exception;
	
	
}
