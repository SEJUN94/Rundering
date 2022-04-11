package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderGoodsController {
	
	@RequestMapping("/admin/ordergoods/list.do")
	public String OrderGoodsList() {
		String url ="admin/ordergoods/list";
		
		return url;
	}
	@RequestMapping("/admin/ordergoods/regist.do")
	public String OrderGoodsRegist() {
		String url="admin/ordergoods/regist";
		
		return url;
	}
	
}
