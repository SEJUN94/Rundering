package com.rundering.customer;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rundering.dto.MemberVO;

@Controller

public class MainController {

	
	@RequestMapping("/home")
	public String main() {
		String url = "/main";
		return url;
	}

	@RequestMapping(value = "/joinForm" , method = RequestMethod.GET)
	public String join() {
		String url = "/login/member_join";
		return url;
	}	
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String regist(MemberVO member) throws Exception, IOException {
		String url = "/login/member_joint_success";

		//memberService.regist(member);

		return url;
	}
	
	
	@RequestMapping("/introduce")
	public String introduce() {
		String url = "/introduce/company_introduce";
		return url;
	}
	
	
	
	
}
