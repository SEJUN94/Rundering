package com.rundering.customer;

import java.sql.SQLException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rundering.dto.MemberVO;


@RequestMapping("/mypage")
@Controller
public class myPageController {
	
	@RequestMapping("")
	public String joinForm() {
		String url = "/mypage/my_privacy_check";
		return url;
	}	
	
	@RequestMapping("pwCheck")
	public ResponseEntity<String> pwCheck(String password) throws Exception {
		ResponseEntity<String> entity = null;
	

		return entity;
	}
	
	
}
