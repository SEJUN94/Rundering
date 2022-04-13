package com.rundering.customer;

import java.io.IOException;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.command.MemberAddCommand;
import com.rundering.dto.MemberAddressVO;
import com.rundering.dto.MemberVO;
import com.rundering.service.MemberAddressService;
import com.rundering.service.MemberService;

@Controller

public class MainController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberAddressService memberAddrService;
	
	@RequestMapping("/home")
	public String main() {
		String url = "/main";
		return url;
	}

	@RequestMapping("/joinform")
	public String joinForm() {
		String url = "/login/member_join";
		return url;
	}	
	
	@RequestMapping("/join")
	@ResponseBody
	public ResponseEntity<String> join(MemberAddCommand mac) throws Exception, IOException {
		ResponseEntity<String> entity = null;
			
		MemberVO member = mac.toMember();
		
		MemberAddressVO memberAdd = null;
		
		try {
			
			memberService.memberJoin(member);
			
			memberService.getMember(member.getId());
			
			System.out.println(member.getMemberNo()+"dasdasdsadasdsadsadsadsadsa");
			mac.setMemberno(member.getMemberNo());
			
			memberAdd = mac.toAddr();
			System.out.println(memberAdd.getAdd1()+"~~~~~aaaaaaaaaaaaaaaaaaaa~~~~~~~~~~~~~~~~~~~~~~~");
			memberAddrService.memberAddressRegist(memberAdd);
			
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
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
