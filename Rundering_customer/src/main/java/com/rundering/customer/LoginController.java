package com.rundering.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@RequestMapping("form")
	public String login() {
		String url="/login/member_login";
		return url;
	}
	@RequestMapping("failcount")
	public String loginfailCount() {
		String url="/login/member_login_count";
		return url;
	}
	
	@RequestMapping("/findaccount")
	public String forgot_account() {
		String url="/login/member_forgot_account";
		return url;
	}

	@RequestMapping("/findpassword")
	public String forgot_password() {
		String url="/login/member_forgot_password";
		return url;
	}
	
}
