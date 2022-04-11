package com.rundering.manage.delivery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/fordelivery")
public class ForDeliveryController {
	
	@RequestMapping("/login")
	public String login() {
		String url="/delivery/login";
		return url;
	}
	@RequestMapping("/main")
	public String main() {
		String url="/delivery/main";
		return url;
	}
	@RequestMapping("/pickup")
	public String pickUp() {
		String url="/delivery/pickup";
		return url;
	}
	@RequestMapping("/delivery")
	public String delivery() {
		String url="/delivery/delivery";
		return url;
	}
	
	@RequestMapping("/deliverydetail")
	public String deliverydetail() {
		String url="/delivery/delivery_detail";
		return url;
	}
}
