package com.rundering.customer;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rundering.dto.MemberVO;
import com.rundering.service.MemberService;


@RequestMapping("/mypage")
@Controller
public class myPageController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping("")
	public String mypage() {
		String url = "/mypage/my_privacy_check";
		return url;
	}	
	
	@RequestMapping("/pwCheck")
	public ResponseEntity<String> pwCheck(String password,HttpSession session) throws Exception {
		ResponseEntity<String> entity = null;
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		
		
		try {
			String pw = memberService.checkPw(loginUser.getId());
			if (password.equals(pw)) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	@RequestMapping("/memberModify")
	public String memberModify() {
		String url = "/mypage/my_privacy";
		return url;
	}
}
