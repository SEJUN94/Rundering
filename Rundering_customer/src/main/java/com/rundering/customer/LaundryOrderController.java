package com.rundering.customer;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.LaundryOrderReceiveCommand;
import com.rundering.dto.LaundryItemsVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.MemberVO;
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
	public ModelAndView order(LaundryOrderReceiveCommand command, ModelAndView mnv) throws Exception {
		String url="/order/order";
		
		List<LaundryItemsVO> clothingList = laundryItemsService.getClothingList();
		List<LaundryItemsVO> beddingList = laundryItemsService.getBeddingList();
		List<LaundryItemsVO> shoesList = laundryItemsService.getShoesList();
		
		System.out.println(clothingList.get(1));
		
		mnv.addObject("command",command);
		mnv.addObject("clothingList",clothingList);
		mnv.addObject("beddingList",beddingList);
		mnv.addObject("shoesList",shoesList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/comfirm")
	public String comfirm(LaundryOrderReceiveCommand command, HttpServletRequest request) throws Exception {
		String url="/order/order_comfirm1";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		LaundryOrderVO laundryOrder = command.toLaundryOrderVO();
		laundryOrder.setMemberNo(loginUser.getMemberNo());
		
		laundryOrderService.orderReceive(laundryOrder);
		
		return url;
	}

}
