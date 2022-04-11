package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/branchinfo")
public class BranchController {

	@RequestMapping("/information")
	public String pointInfo() {
		return "admin/branchinfo/branch_info";
	}
	
	@RequestMapping("/infodetail")
	public String pointInfodetail() {
		return "admin/branchinfo/branch_info_detail";
	}
	@RequestMapping("/detail")
	public String pointDetail() {
		return "admin/branchinfo/branch_detail";
	}
	@RequestMapping("/amount")
	public String pointAmount() {
		return "admin/branchinfo/branch_amount";
	}
	
	@RequestMapping("/quota")
	public String pointQuota() {
		return "admin//branchinfo/branch_quota";
	}
	
	@RequestMapping("/quotadetail")
	public String pointQuotaDetail() {
		return "admin/branchinfo/branch_quota_detail";
	}
}
