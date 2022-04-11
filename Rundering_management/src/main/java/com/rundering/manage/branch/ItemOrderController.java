package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/branch/itemorder")
public class ItemOrderController {
	
	@RequestMapping("/list")
	private void list() {}
	
	@RequestMapping("/detail")
	private void detail() {}
	
	@RequestMapping("/regist")
	private void regist() {}
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/itemorder/modify";
		return url;
	
	}

}
