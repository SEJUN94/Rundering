package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/branchapplication")
@Controller
public class BranchApplication {
	
	@RequestMapping("/contract")
	public String branchContract() {
		return "/admin/branchapplication/contract_evaluation";
	}
}
