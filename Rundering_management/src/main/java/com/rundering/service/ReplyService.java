package com.rundering.service;

import java.util.Map;

import com.rundering.command.CustomerListCriteria;
import com.rundering.dto.ReplyVO;

public interface ReplyService {
	
	public  Map<String, Object> getReplyList(String replyno,CustomerListCriteria cri) throws Exception;

	void firstRegistReply(ReplyVO reply) throws Exception;
	
	void registReply(ReplyVO reply) throws Exception;
}
