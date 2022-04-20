package com.rundering.manage.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/employeeapplication")
public class EmployeesApplicationController {

	@RequestMapping("/main")
	public String employeeapplication() {
		String url = "admin/employeeapplication/employeeapplication_main";
		return url;
	}
	
	
	
	
}
