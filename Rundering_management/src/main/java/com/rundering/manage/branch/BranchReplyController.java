package com.rundering.manage.branch;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.dto.MemberVO;
import com.rundering.dto.ReplyVO;
import com.rundering.manage.Criteria;
import com.rundering.service.ReplyService;

@Controller
@RequestMapping("baranch/reply")
public class BranchReplyController {

	@Autowired
	ReplyService replySerivce;
	
	@RequestMapping(value = "list",method =RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> replyList(String replyno,Criteria cri) {
		ResponseEntity<Map<String, Object>> resp = null;
		Map<String, Object> dataMap=null;
		try {
			dataMap = replySerivce.getReplyList(replyno, cri);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		resp = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		return resp;
	}
	
	
	@RequestMapping(value = "firstRegist",method = RequestMethod.POST)
	public ResponseEntity<String> firstRegist(ReplyVO reply,HttpSession session,Criteria cri) {
		ResponseEntity<String> resp = null;
		MemberVO member= (MemberVO)session.getAttribute("loginMember");
		
		reply.setMemberno(member.getMemberNo());
		try {
			replySerivce.firstRegistReply(reply);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		resp = new ResponseEntity<String>("success", HttpStatus.OK);
		return resp;
		
	}
	@RequestMapping(value = "regist",method = RequestMethod.POST)
	public ResponseEntity<String> regist (ReplyVO reply,HttpSession session,Criteria cri){
		ResponseEntity<String> resp = null;
		MemberVO member = (MemberVO) session.getAttribute("loginMember");

		reply.setMemberno(member.getMemberNo());
		try {
			replySerivce.registReply(reply);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resp;
	}
	
	
	
}
