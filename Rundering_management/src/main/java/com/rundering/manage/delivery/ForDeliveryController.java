package com.rundering.manage.delivery;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.EmployeesVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.service.DeliveryService;
import com.rundering.util.FileUtil;

@Controller
@RequestMapping("/fordelivery")
public class ForDeliveryController {

	@Autowired
	private DeliveryService deliveryService;
	@Resource(name = "picturePath")
	private String picturePath;
	

	@RequestMapping("/login")
	public String login() {
		String url = "/delivery/login";
		return url;
	}

	@RequestMapping("/main")
	public String main() throws Exception {
		String url = "/delivery/main";

		return url;
	}
	
	// 수거 리스트
	@RequestMapping("/pickup")
	public ModelAndView pickUp(ModelAndView mnv, HttpServletRequest request, LaundryOrderVO laundryOrder)
			throws Exception {
		String url = "/delivery/pickup";

		HttpSession session = request.getSession();
		EmployeesVO emp = (EmployeesVO) session.getAttribute("loginEmployee");

		laundryOrder.setBranchCode(emp.getBranchCode());
		laundryOrder.setPickupEmployeeId(emp.getEmployeeId());

		Map<String, Object> dataMap = deliveryService.getPickupWaitList(laundryOrder);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	// 수거 상세정보
	@RequestMapping("/pickupdetail")
	public ModelAndView pickUpDetail(ModelAndView mnv, String orderNo,String orderStatus) throws Exception {
		String url = null;
		if (orderStatus.equals("01")) {
			url = "/delivery/pickUp_detail";
		} else if (orderStatus.equals("03")) {
			url = "/delivery/pickUpCom_detail";
		}
		Map<String, Object> dataMap = deliveryService.getOrderDetailByOrderNo(orderNo);
			
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
			
		return mnv;
	}
	
	// 수거 완료ㆍ취소 상태변경
	@RequestMapping("/updatePickUpCom")
	public ResponseEntity<String> updatePickUpCom(LaundryOrderVO laundryOrder)throws Exception {
		ResponseEntity<String> ok = null;
		
		try {
			deliveryService.updatePickUpCom(laundryOrder);
			
			ok = new ResponseEntity<String>("OK", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ok;
		
	}
	
	

	@RequestMapping(value ="pictureupload",method = RequestMethod.POST,produces ="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, String>> pictureUpload(MultipartFile multi){
		
		Map<String, String> fileMap = null;
		FileUtil fileUtil = new FileUtil();
		fileMap= fileUtil.saveFile(multi, picturePath);
		ResponseEntity<Map<String, String>> resp = new ResponseEntity<Map<String,String>>(fileMap, HttpStatus.OK);
		return resp;
		
	}
	
	
	// 배송 리스트
	@RequestMapping("/delivery")
	public ModelAndView deliveryList( HttpServletRequest request, LaundryOrderVO laundryOrder, ModelAndView mnv) throws Exception {
		String url = "/delivery/delivery";

		HttpSession session = request.getSession();
		EmployeesVO emp = (EmployeesVO) session.getAttribute("loginEmployee");

		laundryOrder.setBranchCode(emp.getBranchCode());
		laundryOrder.setPickupEmployeeId(emp.getEmployeeId());
		
		Map<String, Object> deliveryList = deliveryService.getDeliveryList(laundryOrder);

		mnv.addObject("deliveryList", deliveryList);
		mnv.setViewName(url);

		return mnv;
	}
	
	// 배송 상세조회
	@RequestMapping(value="/deliverydetail",method = RequestMethod.POST,produces ="application/json;charset=utf-8")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> deliverydetail(String orderNo, ModelAndView mnv, String orderStatus) throws Exception {
		Map<String, Object> dataMap = null;
		ResponseEntity<Map<String, Object>> ok = null;
		
		String url = null;
		if (orderStatus.equals("06")||orderStatus.equals("07")) {
			url = "/delivery/delivery_detail";
			dataMap = deliveryService.getOrderDetailByOrderNo(orderNo);
			dataMap.put("list", "OK");
			ok = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} else if ((orderStatus.equals("08"))||(orderStatus.equals("09"))) {
			url = "/delivery/deliveryCom_detail";
			ok = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
			dataMap = deliveryService.getOrderDetailByOrderNo(orderNo);
			dataMap.put("COM", "COM");
			
		}


		return ok;
	}
}
