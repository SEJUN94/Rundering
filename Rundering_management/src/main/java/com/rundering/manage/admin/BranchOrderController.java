package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class BranchOrderController {
	@RequestMapping("/branchorder")
	public String branchOrderList() {
		return "admin/branchorder/equipment_order_list";
	}
	
	@RequestMapping("/branchorder/detail")
	public String branchOrderDetail() {
		return "admin/branchorder/equipment_order_detail";
	}
	
}
