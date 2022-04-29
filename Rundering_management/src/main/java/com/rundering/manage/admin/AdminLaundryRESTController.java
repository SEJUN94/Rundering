package com.rundering.manage.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rundering.command.AdminLaundryOrderListCriteria;
import com.rundering.dao.BranchDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.PaymentVO;
import com.rundering.service.LaundryOrderService;

@RestController
@RequestMapping("/admin/laundryorder")
public class AdminLaundryRESTController {
	
	@Autowired
	LaundryOrderService laundryOrderService;
	
	//할당 정보확인
	@RequestMapping(value = "/confirmAssignment", method = RequestMethod.POST, consumes="application/json;")
	public ResponseEntity<Map<String,Object>> confirmAssignment(@RequestBody AdminLaundryOrderListCriteria cri,Model model) throws Exception {
		if(cri.getArea()  !=null          ) System.out.println(cri.getArea());
		if(cri.getBranchCode()   !=null    ) System.out.println(cri.getBranchCode());
		if(cri.getPickupRequestDate() !=null) System.out.println(cri.getPickupRequestDate());
		if(cri.getOrderNo()     !=null     ) System.out.println(cri.getOrderNo());
		if(cri.getListSelectOrderNo()   !=null ) System.out.println(cri.getListSelectOrderNo());
		if(cri.getListOrderStatus()   !=null  ) System.out.println(cri.getListOrderStatus());
		if(cri.getSelectAllOrderNo()   !=null  ) System.out.println(cri.getSelectAllOrderNo());
		ResponseEntity<Map<String,Object>> result = null;
		Map<String, Object> dataMap = new HashMap<>();
		
		try {
			dataMap = laundryOrderService.getConfirmOrderAssignmentInfo(cri);
			
			
				result = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return result;
	}
	

		
}
