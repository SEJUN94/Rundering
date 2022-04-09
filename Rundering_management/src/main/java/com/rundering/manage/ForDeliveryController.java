package com.rundering.manage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fordelivery")
public class ForDeliveryController {
	
	@RequestMapping("/login.do")
	public String login() {
		String url="/delivery/login";
		return url;
	}
	@RequestMapping("/main.do")
	public String main() {
		String url="/delivery/main";
		return url;
	}
	@RequestMapping("/pickup.do")
	public String pickUp() {
		String url="/delivery/pickup";
		return url;
	}
	@RequestMapping("/delivery.do")
	public String delivery() {
		String url="/delivery/delivery";
		return url;
	}
	
	@RequestMapping("/deliverydetail.do")
	public String deliverydetail() {
		String url="/delivery/delivery_detail";
		return url;
	}
}
