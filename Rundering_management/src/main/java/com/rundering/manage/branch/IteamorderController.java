package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/branch/iteamorder")
public class IteamorderController {
	
	@RequestMapping("/list")
	private void list() {}
	
	@RequestMapping("/detail")
	private void detail() {}
	
	@RequestMapping("/regist")
	private void regist() {}
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/iteamorder/modify";
		return url;
	
	}

}
