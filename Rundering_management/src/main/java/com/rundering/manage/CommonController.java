package com.rundering.manage;

import java.io.IOException;
import java.sql.SQLException;

import javax.annotation.Resource;

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

@RequestMapping("common")
@Controller
public class CommonController {
	
	@Autowired
	private MemberService memberService;
	
	@Resource(name="memberAddressService")
	private MemberAddressService memberAddressService;
	
	@RequestMapping("/loginform")
	public String loginForm() {
		String url = "common/worker_login";
		
		return url;
		
	}
	
	@RequestMapping("/application")
	public String application() {
		String url = "common/worker_register";
		
		return url;
		
	}
	
	@RequestMapping("/application_success")
	@ResponseBody
	public ResponseEntity<String> application_success(MemberAddCommand mac) throws Exception, IOException {
		ResponseEntity<String> entity = null;
			
		MemberVO member = mac.toMember();
		
		MemberAddressVO memberAdd;
		
		try {
			
			memberService.applicationEmployee(member);
			
			member = memberService.getMemberNo(member.getPhone());
			
			mac.setMemberNo(member.getMemberNo());
			
			memberAdd = mac.toAddr();
			
			memberAddressService.memberAddressRegist(memberAdd);
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	

}
