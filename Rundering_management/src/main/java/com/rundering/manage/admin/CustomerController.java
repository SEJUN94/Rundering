package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/customer")
public class CustomerController {

	@RequestMapping("/list")
	public String customerList() {
		return "admin/customer/customer_list";
	}
	@RequestMapping("/detail")
	public String customerDetail() {
		return "admin/customer/customer_detail";
	}
	@RequestMapping("/dormant")
	public String dormant_List() {
		return "admin/customer/dormant_account_list";
	}
	@RequestMapping("/dormant_detail")
	public String dormant_Detail() {
		return "admin/customer/dormant_detail";
	}
	@RequestMapping("/secession")
	public String secession_List() {
		return "admin/customer/secession_account_list";
	}
	@RequestMapping("/secession_detail")
	public String secession_Detail() {
		return "admin/customer/secession_detail";
	}

}
