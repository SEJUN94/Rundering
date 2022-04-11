package com.rundering.manage.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/branch/laundrystores")
public class LaundryStoresController {
	
	@RequestMapping("/list")
	private String sotresList() {
		String url = "branch/laundrystores/stores_list";
		return url;
	}
}
