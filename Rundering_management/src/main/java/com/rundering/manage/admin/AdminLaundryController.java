package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminLaundryController {
	
	@RequestMapping("/laundryorder/list")
	public String laundryOrderList() {
		return "admin/laundryorder/laundry_order_list";
	}
	@RequestMapping("/laundryorder/detail")
	public String laundryOrderDetail() { 
		return "admin/laundryorder/laundry_order_detail";
	}

}
