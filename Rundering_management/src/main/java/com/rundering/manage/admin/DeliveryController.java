package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class DeliveryController {
	@RequestMapping("/delivery/list.do")
	public String deliveryList() {
		String url="/admin/delivery/list";
		
		return url;
	}
	@RequestMapping("/delivery/detail.do")
	public String deliveryDetail() {
		String url="/admin/delivery/detail";
		
		return url;
	}
	
	
}
