package com.rundering.manage.branch;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/branch/laundrysituatuion")
public class LaundrySituatuionController {
	
	@RequestMapping("/list")
	private String situatuionList() {
		String url = "branch/laundrysituatuion/situatuion_list";
		return url;

	}
	

	@RequestMapping("/modify")
	private String situatuonModify() {
		String url = "branch/laundrysituatuion/situatuion_modify";
		return url;
	}
	@RequestMapping("/detail")
	private String situatuonDetail() {
		String url = "branch/laundrysituatuion/situatuion_modify";
		return url; 
	}
}
