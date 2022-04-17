package com.rundering.manage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {
	
	@RequestMapping("/common/loginform")
	public String loginForm() {
		String url = "common/worker_login";
		return url;
	}
	@RequestMapping("/common/loginTimeOut")
	public String branchLoginTimeOut(Model model)throws Exception {
		
		String url="security/sessionOut";
		
		model.addAttribute("message","세션이 만료되었습니다.\\n다시 로그인 하세요!");
		return url;
	}
	
	@RequestMapping(value = "/common/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		String url = "redirect:/common/loginform";
		session.invalidate();
		return url;
	}
	

}
