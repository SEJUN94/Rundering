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
	public ModelAndView order(LaundryOrderReceiveCommand command, ModelAndView mnv) throws Exception {
		String url="/order/order";

		Map<String, Object> dataMap = laundryItemsService.getlaundryItemsList();
		
		mnv.addObject("command",command);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/comfirm", method = RequestMethod.POST)
	public ModelAndView comfirm(LaundryOrderReceiveCommand command, HttpServletRequest request, ModelAndView mnv) throws Exception {
		String url="/order/order_comfirm";
		
		List<LaundryOrderDetailVO> laundryOrderDetailVOList = command.toLaundryOrderDetailVOList();
		Map<String, Object> dataMap = laundryOrderService.checkOrder(laundryOrderDetailVOList);
		
		mnv.setViewName(url);
		mnv.addObject("command",command);
		mnv.addObject("dataMap", dataMap);
		
		return mnv;
	}
	
	@RequestMapping(value = "/payment", method = RequestMethod.POST)
	public ModelAndView payment(LaundryOrderReceiveCommand command, HttpServletRequest request, ModelAndView mnv) throws Exception {
		
		//주문완료 페이지가 없어 일단 홈화면으로 가도록 함
		String url="/main";
		
		HttpSession session = request.getSession();
		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
		
		MemberAddressVO memberAddress = command.toMemberAddressVO();
		//새로운 주소지일 경우 주소지 등록
		if(command.getAddressNo().equals("0")) {
			memberAddress.setMemberNo(loginUser.getMemberNo());
			memberAddressService.memberAddressRegist(memberAddress);
		}else {
			//새로운 주소지 아닐경우 주소번호로 주소지가져오기
			memberAddress = memberAddressService.getMemberAddress(command.getAddressNo());
			command.setAddress(memberAddress);
		}
		
		LaundryOrderVO laundryOrder = command.toLaundryOrderVO();
		laundryOrder.setMemberNo(loginUser.getMemberNo());
		memberAddress = memberAddressService.getAreaCode(memberAddress);
		laundryOrder.setArea(memberAddress.getArea());
		
		
		mnv.setViewName(url);
		return mnv;
		
		
	}

}
