package com.rundering.customer;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.dto.MemberVO;
import com.rundering.service.MemberService;

@Controller

public class MainController {

	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/home")
	public String main() {
		String url = "/main";
		return url;
	}

	@RequestMapping("/joinForm")
	public String joinForm() {
		String url = "/login/member_join";
		return url;
	}	
	
	@RequestMapping("/join")
	@ResponseBody
	public ResponseEntity<String> join(MemberVO member) throws Exception, IOException {
		ResponseEntity<String> entity = null;
		
		try {
			memberService.memberJoin(member);
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public ResponseEntity<String> idCheck(String id) throws Exception {
		ResponseEntity<String> entity = null;
		System.out.println(id);
		try {
			MemberVO member = memberService.checkId(id);
			if (member != null) {
				entity = new ResponseEntity<String>("duplicated", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("", HttpStatus.OK);
			}
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return entity;
	}
	
	
	
	@RequestMapping("/introduce")
	public String introduce() {
		String url = "/introduce/company_introduce";
		return url;
	}
	
	
	
	
}
