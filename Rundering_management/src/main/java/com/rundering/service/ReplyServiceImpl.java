package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.MemberDAO;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.MemberVO;
import com.rundering.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	@Override
	public Map<String, Object> getRequestReplyList(String replyno) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int replynoInt =Integer.parseInt(replyno); 
		List<ReplyVO> replyList = replyDAO.selectReplyByReplyNo(replynoInt);
		dataMap.put("replyList", replyList);
		
		return dataMap;
	}
	
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		int count =replyDAO.selectReplyCheckByReplyno(reply.getReplyno());
		reply.setCount(count);
		replyDAO.insertReplyByReplyVO(reply);
	}

	@Override
	public void replyRemove(ReplyVO reply) throws Exception {
		replyDAO.deleteReply(reply);
	}
	@Override
	public void replyModify(ReplyVO reply) throws Exception{
		replyDAO.updateReply(reply);
	}

}
