package com.rundering.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class EojinTestController {

	@RequestMapping("/branchorder")
	public String branchOrderList() {
		return "admin/branchorder/equipment_order_list";
	}
	
	@RequestMapping("/branchorder/detail")
	public String branchOrderDetail() {
		return "admin/branchorder/equipment_order_detail";
	}
	
	@RequestMapping("/laundryorder")
	public String laundryOrderList() {
		return "admin/laundryorder/laundry_order_list";
	}
	@RequestMapping("/laundryorder/detail")
	public String laundryOrderDetail() { 
		return "admin/laundryorder/laundry_order_detail";
	}
	
	@RequestMapping("/laundryitems")
	public String laundryItemsList() {
		return "admin/laundryitems/list";
	}
	
	@RequestMapping("/laundryitems/regist")
	public String laundryItemRegist() {
		return "admin/laundryitems/regist";
	}
	
	@RequestMapping("/laundryitems/modify")
	public String laundryItemModify() {
		return "admin/laundryitems/modify";
	}

}
