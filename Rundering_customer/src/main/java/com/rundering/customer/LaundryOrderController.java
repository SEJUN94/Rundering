package com.rundering.customer;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.LaundryOrderReceiveCommand;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.MemberAddressVO;
import com.rundering.dto.MemberVO;
import com.rundering.service.LaundryItemsService;
import com.rundering.service.LaundryOrderService;
import com.rundering.service.MemberAddressService;
import com.rundering.util.FormatUtil;

@Controller
@RequestMapping("/order")
public class LaundryOrderController {
	
	@Resource(name = "laundryOrderService")
	private LaundryOrderService laundryOrderService;
	@Resource(name = "laundryItemsService")
	private LaundryItemsService laundryItemsService;
	@Resource(name="memberAddressService")
	private MemberAddressService memberAddressService;
	
	
	@RequestMapping("")
	public ModelAndView checkInformation(HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url="/order/order_essential";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		String hyphenationPhoneNum = FormatUtil.hyphenationPhoneNum(loginUser.getPhone());
		mnv.addObject("phone",hyphenationPhoneNum);
		
		MemberAddressVO defaultMemberAddress = memberAddressService.getDefaultMemberAddress(loginUser.getMemberNo());
		mnv.addObject("defaultMemberAddress",defaultMemberAddress);
		
		List<MemberAddressVO> memberAddressList = memberAddressService.getMemberAddressList(loginUser.getMemberNo());
		mnv.addObject("memberAddressList",memberAddressList);
		
		mnv.setViewName(url);
		
		return mnv;
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
	public String comfirm(LaundryOrderReceiveCommand command, HttpServletRequest request) throws Exception {
		String url="/order/order_comfirm1";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		LaundryOrderVO laundryOrder = command.toLaundryOrderVO();
		laundryOrder.setMemberNo(loginUser.getMemberNo());
		
		List<LaundryOrderDetailVO> laundryOrderDetailVOList = command.toLaundryOrderDetailVOList();
		
		laundryOrderService.orderReceive(laundryOrder, laundryOrderDetailVOList);
		
		
		
		return url;
	}

}
