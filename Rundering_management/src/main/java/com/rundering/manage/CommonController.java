package com.rundering.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	@RequestMapping("common/loginform")
	public String loginForm() {
		String url = "common/worker_login";
		
		return url;
		
	}
	

}
