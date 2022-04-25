package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.dao.ReplyDAO;
import com.rundering.dto.ReplyVO;
import com.rundering.manage.Criteria;
import com.rundering.manage.PageMaker;

public class ReplyServiceImpl implements ReplyService {
	ReplyDAO replyDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getReplyList(String replyno,Criteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int replynoInt =Integer.parseInt(replyno); 
		List<ReplyVO> replyList = replyDAO.selectReplyByReplyNo(replynoInt);
		
		
		PageMaker pageMaker = new PageMaker();
		
		int totalCount = replyDAO.selectReplyCountByReplyno(replynoInt);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
 
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker); 
		
		return dataMap;
	}
	
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		int count =replyDAO.selectReplyCheckByReplyno(reply.getReplyno());
		reply.setCount(count);
		replyDAO.insertReplyByReplyVO(reply);
	}
	

}
