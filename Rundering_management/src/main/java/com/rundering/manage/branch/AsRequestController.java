package com.rundering.manage.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/branch/asrequest")
public class AsRequestController {
	

	@RequestMapping(value = "/list")
	private void list() {

	}
	@RequestMapping(value = "/regist/form.do")
	private String detail() {
		String url = "branch/asrequest/regist";
		return url;
	}
	
}