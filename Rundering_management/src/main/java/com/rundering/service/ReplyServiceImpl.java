package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.CustomerListCriteria;
import com.rundering.command.CustomerListPageMaker;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.ReplyVO;

public class ReplyServiceImpl implements ReplyService {
	ReplyDAO replyDAO;
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getReplyList(String replyno,CustomerListCriteria cri) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		List<ReplyVO> replyList = replyDAO.selectReplyByReplyNo(replyno);
		
		
		CustomerListPageMaker pageMaker = new CustomerListPageMaker();
		
		int totalCount = replyDAO.selectReplyCountByReplyno(replyno);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	@Override
	public void firstRegistReply(ReplyVO reply) throws Exception {
		int replyno = replyDAO.selectReplySeq();
		reply.setReplyno(replyno);
		replyDAO.insertReplyByReplyVOFirst(reply);

	}
	
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		replyDAO.insertReplyByReplyVO(reply);
	}
	

}
