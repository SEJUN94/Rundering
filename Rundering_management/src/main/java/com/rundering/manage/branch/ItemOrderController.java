package com.rundering.manage.branch;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/branch/itemorder")
public class ItemOrderController {
	
	@RequestMapping("/list")
	private String list() {
		String url= "/branch/iteamorder/itemorder_list";
		return url;
	}
	
	
	@RequestMapping("/detail")
	private String detail() {
		String url= "/branch/iteamorder/itemorder_detail";
		return url;
	}
	
	@RequestMapping("/regist")
	private String regist() {
		String url= "/branch/iteamorder/itemorder_regist";
		return url;
	}
	
	@RequestMapping("detail/modify")
	private String modify() {
		String url = "/branch/itemorder/modify";
		return url;
	
	}

}
