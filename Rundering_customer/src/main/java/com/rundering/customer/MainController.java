package com.rundering.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller

public class MainController {

	
	@RequestMapping("/home")
	public String main() {
		String url = "/main";
		return url;
	}

	@RequestMapping("/join")
	public String join() {
		String url = "/login/member_join";
		return url;
	}
	
	@RequestMapping("/introduce")
	public String introduce() {
		String url = "/introduce/company_introduce";
		return url;
	}
	
	
	
	
}
