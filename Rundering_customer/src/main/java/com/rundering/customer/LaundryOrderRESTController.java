package com.rundering.customer;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.rundering.dao.PaymentDAO;
import com.rundering.dto.PaymentVO;
import com.rundering.util.FormatUtil;
import com.rundering.util.PhoneResDTO.SendSmsResponse;
import com.rundering.util.SensSms;

@RestController
@RequestMapping("/order")
public class LaundryOrderRESTController {
	
	
	@Autowired
	private SensSms sensSms;
	@Autowired
	private PaymentDAO paymentDAO;
	
	//문자인증
	@RequestMapping(value = "/certifyPhoneNum", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> certifyPhoneNum(String phoneNumber) throws Exception {
		
		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = new HashMap<>();
		
		String randomNum = String.format("[%06d]", (int)(Math.random() * 999999));
		
		try {
			SendSmsResponse sendSmsResponse = sensSms.sendSMS(phoneNumber, randomNum+" Rundering에서 보낸 인증번호 입니다.");
			if(sendSmsResponse.getStatusCode().equals("202") || sendSmsResponse.getStatusCode().equals("200")) {
				dataMap.put("randomNum", FormatUtil.RemoveSpecialChar(randomNum));
				result = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
			}
		} catch (Exception e) {
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return result;
	}
	
	//결제
	@RequestMapping(value = "/payment", method = RequestMethod.POST, consumes="application/json;")
	public ResponseEntity<Map<String, Object>> payment(@RequestBody PaymentVO payment) throws Exception {
		
		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = new HashMap<>();
		
		try {
			paymentDAO.insertPayment(payment);
			String insertResult = "success";
			dataMap.put("insertResult",insertResult);
			result = new ResponseEntity<Map<String, Object>>(dataMap,HttpStatus.OK);
		} catch (SQLException e) {
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return result;
	}
	
		
}
