package com.rundering.service;

import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.dto.ReplyVO;

public interface ReplyService {
	
	public  Map<String, Object> getReplyList(String replyno,Criteria cri) throws Exception;

	void firstRegistReply(ReplyVO reply) throws Exception;
	
	void registReply(ReplyVO reply) throws Exception;
}
