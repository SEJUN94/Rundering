package com.rundering.manage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.command.MemberAddCommand;
import com.rundering.dto.MemberAddressVO;
import com.rundering.dto.MemberVO;
import com.rundering.service.MemberAddressService;
import com.rundering.service.MemberService;
import com.rundering.util.FormatUtil;
import com.rundering.util.SensSms;
import com.rundering.util.PhoneResDTO.SendSmsResponse;

@RequestMapping("common")
@Controller
public class CommonController {
	
	@Autowired
	private SensSms sensSms;
	
	@Autowired
	private MemberService memberService;
	
	@Resource(name="memberAddressService")
	private MemberAddressService memberAddressService;
	
	@RequestMapping("/loginform")
	public String loginForm() {
		String url = "common/worker_login";
		
		return url;
		
	}
	
	@RequestMapping("/application")
	public String application() {
		String url = "common/worker_register";
		
		return url;
		
	}
	
	@RequestMapping("/application_success")
	@ResponseBody
	public ResponseEntity<String> application_success(MemberAddCommand mac) throws Exception, IOException {
		ResponseEntity<String> entity = null;
			
		MemberVO member = mac.toMember();
		
		MemberAddressVO memberAdd;
		
		try {
			
			memberService.applicationEmployee(member);
			
			member = memberService.getMemberNo(member.getPhone());
			
			mac.setMemberNo(member.getMemberNo());
			
			memberAdd = mac.toAddr();
			
			memberAddressService.memberAddressRegist(memberAdd);
			
			entity = new ResponseEntity<String>("OK", HttpStatus.OK);
			
		} catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
	//문자인증
	@ResponseBody
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
	

}
