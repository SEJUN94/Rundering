package com.rundering.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/branchapplication")
@Controller
public class BranchApplicationController {
	
	@RequestMapping("/regist")
	public void branchApplication() {
		
	}
	@RequestMapping("/my_branch_request")
	public void myBranchRequest() {
		
	}
	//인증 후 지점 신청 확인
	@RequestMapping("/self_authentification")
	public void selfAuthentification() {}
	
	@RequestMapping("/storeApplication")
	public void selectStoreApplication() {}
}
