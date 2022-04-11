package com.rundering.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class OrderGoodsController {
	
	@RequestMapping("/ordergoods/list.do")
	public String OrderGoodsList() {
		String url ="admin/ordergoods/list";
		
		return url;
	}
	@RequestMapping("/ordergoods/regist.do")
	public String OrderGoodsRegist() {
		String url="admin/ordergoods/regist";
		
		return url;
	}
	
}
