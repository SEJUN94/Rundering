package com.rundering.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EojinTestController {

	@RequestMapping("/admin/branchOrder")
	public String branchOrderList() {
		return "admin/branch_equipment_order_list";
	}
	@RequestMapping("/admin/branchOrder/detail")
	public String branchOrder() {
		return "admin/branch_equipment_order_detail";
	}

}
