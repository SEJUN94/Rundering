package com.rundering.customer;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.LaundryOrderReceiveCommand;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.service.LaundryOrderService;

@Controller
@RequestMapping("/order")
public class LaundryOrderController {
	
	@Resource(name = "laundryOrderService")
	private LaundryOrderService laundryOrderService;
	
	@RequestMapping("")
	public String checkInformation() {
		String url="/order/order_essential";
		return url;
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public ModelAndView order(LaundryOrderReceiveCommand command, ModelAndView mnv) {
		String url="/order/order";
		
		mnv.addObject("command",command);
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
