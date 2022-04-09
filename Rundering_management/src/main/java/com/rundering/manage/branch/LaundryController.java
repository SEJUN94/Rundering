package com.rundering.manage.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/branch/laundry")
public class LaundryController {
	
	@RequestMapping("/situatuionlist")
	private String situatuionList() {
		String url = "branch/laundry/situatuion_list";
		return url;

	}
	@RequestMapping("/storeslist")
	private String sotresList() {
		String url = "branch/laundry/stores_list";
		return url;
	}
	@RequestMapping("/situation_modify")
	private void situatuionModify() {}

	@RequestMapping("/situatuionmodify")
	private String situatuonModify() {
		String url = "branch/laundry/situatuion_modify";
		return url;
	}
	@RequestMapping("/situatuion/modify")
	private String situatuonDetail() {
		String url = "branch/laundry/situatuion_modify";
		return url; 
	}
}
