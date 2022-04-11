package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCustomerController {
	@RequestMapping("/admin/customerlist")
	public String customerList() {
		return "admin/customer_list";
	}
	 
	@RequestMapping("/admin/customerdetail")
	public String customerDetail() {
		return "admin/customer_detail"; 
	}
}
