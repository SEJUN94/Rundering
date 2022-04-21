package com.rundering.manage;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class CommonController {
	
	@RequestMapping(value = "/common/loginform", method = RequestMethod.GET)
	public String loginForm(@RequestParam(defaultValue="")String error,
			HttpServletResponse response) {
		String url = "common/worker_login";
		
		if(error.equals("1")) {
			response.setStatus(302);
		}
		
		return url;
	}
	@RequestMapping("/security/accessDenied")
	public void accessDenied() {}
	
	@RequestMapping("/common/loginTimeOut")
	public String loginTimeOut(Model model)throws Exception {
		String url="security/sessionOut";
		model.addAttribute("message","세션이 만료되었습니다.");
		return url;
	}
}