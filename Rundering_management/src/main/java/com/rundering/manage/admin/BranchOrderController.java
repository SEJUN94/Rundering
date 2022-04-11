package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/branch")
public class BranchOrderController {
	@RequestMapping("/orderlist")
	public String branchOrderList() {
		return "admin/branchorder/equipment_order_list";
	}
	
	@RequestMapping("/orderdetail")
	public String branchOrderDetail() {
		return "admin/branchorder/equipment_order_detail";
	}
	
}
