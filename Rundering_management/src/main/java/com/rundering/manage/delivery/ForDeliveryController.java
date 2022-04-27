package com.rundering.manage.delivery;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.Criteria;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.service.DeliveryService;

@Controller
@RequestMapping("/fordelivery")
public class ForDeliveryController {
	
	@Autowired
	private DeliveryService deliveryService;
	
	@RequestMapping("/login")
	public String login() {
		String url="/delivery/login";
		return url;
	}
	@RequestMapping("/main")
	public String main() throws Exception{
		String url="/delivery/main";
		
		
		return url;
	}
	@RequestMapping("/pickup")
	public String pickUp() {
		String url="/delivery/pickup";
		return url;
	}
	@RequestMapping("/delivery")
	public ModelAndView deliveryList(String orderStatus, ModelAndView mnv) throws Exception{
		String url="/delivery/delivery";
		
		List<LaundryOrderVO> deliveryList =  deliveryService.getDeliveryList(orderStatus);
		
		mnv.addObject("deliveryList",deliveryList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/deliverydetail")
	public ModelAndView deliverydetail(String orderNo, ModelAndView mnv) throws Exception {
		String url="/delivery/delivery_detail";
		
		Map<String, Object> dataMap = deliveryService.getDeliveryByOrderNo(orderNo);
		
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
}
