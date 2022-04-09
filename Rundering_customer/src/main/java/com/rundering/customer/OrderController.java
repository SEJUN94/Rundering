package com.rundering.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	
	@RequestMapping("")
	public String certification() {
		String url="/order/order_essential";
		return url;
	}

	@RequestMapping("/detail")
	public String order() {
		String url="/order/order";
		
		return url;
	}
	
	@RequestMapping("/comfirm")
	public String comfirm() {
		String url="/order/order_comfirm1";
		
		return url;
	}

}
