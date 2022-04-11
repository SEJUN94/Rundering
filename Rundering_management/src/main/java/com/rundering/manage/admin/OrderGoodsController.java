package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class OrderGoodsController {
	
	@RequestMapping("/ordergoods/list")
	public String OrderGoodsList() {
		String url ="admin/ordergoods/ordergoods_list";
		
		return url;
	}
	@RequestMapping("/ordergoods/regist")
	public String OrderGoodsRegist() {
		String url="admin/ordergoods/ordergoods_regist";
		
		return url;
	}
	
}
