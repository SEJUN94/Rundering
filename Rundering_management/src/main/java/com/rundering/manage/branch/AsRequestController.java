package com.rundering.manage.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/branch/asrequest")
public class AsRequestController {
	

	@RequestMapping(value = "/list")
	private String list() {
		String url = "branch/asrequest/asrequest_list";
		return url;
	}
	@RequestMapping(value = "/regist/form")
	private String detail() {
		String url = "branch/asrequest/asrequest_regist";
		return url;
	}
	
}