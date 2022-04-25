package com.rundering.dao;

import java.util.List;

import com.rundering.dto.ReplyVO;

public interface ReplyDAO {
	public List<ReplyVO> selectReplyByReplyNo(int replyNo) throws Exception;

	int selectReplySeq() throws Exception;

	void insertReplyByReplyVO(ReplyVO reply) throws Exception;

	void insertReplyByReplyVOFirst(ReplyVO reply) throws Exception;
	
	int selectReplyCountByReplyno(int replyno) throws Exception;

	int selectReplyCheckByReplyno(int replyno) throws Exception;

	
	
}
