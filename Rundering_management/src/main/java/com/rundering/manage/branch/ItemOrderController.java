package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/branch/iteamorder")
public class ItemOrderController {
	
	@RequestMapping("/list")
	private String list() {
		String url= "/branch/itemorder/itemorder_list";
		return url;
	}
	
	
	@RequestMapping("/detail")
	private String detail() {
		String url= "/branch/itemorder/itemorder_detail";
		return url;
	}
	
	@RequestMapping("/regist")
	private String regist() {
		String url= "/branch/itemorder/itemorder_regist";
		return url;
	}
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/itemorder/modify";
		return url;
	
	}

}
