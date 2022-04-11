package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminLaundryController {
	
	@RequestMapping("/laundryorder/list.do")
	public String laundryOrderList() {
		return "admin/laundryorder/laundry_order_list";
	}
	@RequestMapping("/laundryorder/detail.do")
	public String laundryOrderDetail() { 
		return "admin/laundryorder/laundry_order_detail";
	}
	
	@RequestMapping("/laundryitems/list.do")
	public String laundryItemsList() {
		return "admin/laundryitems/laundryitems_list";
	}
	
	@RequestMapping("/laundryitems/regist.do")
	public String laundryItemRegist() {
		return "admin/laundryitems/laundryitems_regist";
	}
	
	@RequestMapping("/laundryitems/modify.do")
	public String laundryItemModify() {
		return "admin/laundryitems/laundryitems_modify";
	}
}
