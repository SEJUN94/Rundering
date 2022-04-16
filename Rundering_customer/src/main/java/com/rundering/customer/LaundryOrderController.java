package com.rundering.customer;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.LaundryOrderReceiveCommand;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.service.LaundryItemsService;
import com.rundering.service.LaundryOrderService;

@Controller
@RequestMapping("/order")
public class LaundryOrderController {
	
	@Resource(name = "laundryOrderService")
	private LaundryOrderService laundryOrderService;
	@Resource(name = "laundryItemsService")
	private LaundryItemsService laundryItemsService;
	
	@RequestMapping("")
	public String checkInformation() {
		String url="/order/order_essential";
		return url;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public ModelAndView order( ModelAndView mnv) throws Exception {
		String url="/order/order";

		Map<String, Object> dataMap = laundryItemsService.getlaundryItemsList();
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/comfirm")
	public String comfirm(LaundryOrderReceiveCommand command) throws Exception {
		String url="/order/order_comfirm1";
		
		LaundryOrderVO laundryOrder = command.toLaundryOrderVO();
		
		laundryOrderService.orderReceive(laundryOrder);
		
		return url;
	}

}
