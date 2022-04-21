package com.rundering.dao;

import java.util.List;

import com.rundering.dto.ReplyVO;

public interface ReplayDAO {
	public List<ReplyVO> selectReplyByReplyNo(String replyNo) throws Exception;
	
}
