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
		List<ReplyVO> replyList = replyDAO.selectReplyByReplyNo(replyno);
		
		
		PageMaker pageMaker = new PageMaker();
		
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
