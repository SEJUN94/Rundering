package com.rundering.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/guide")
public class GuideController {

	@RequestMapping("/price")
	public String price() {
		String url = "/guide/price_guide";
		return url;
	}
	
	@RequestMapping("/howuse")
	public String howuse() {
		String url = "/guide/how_use";
		return url;
	}
	
	@RequestMapping("/area")
	public String servicearea() {
		String url = "/guide/service_area";
		return url;
	}

	
	
}
