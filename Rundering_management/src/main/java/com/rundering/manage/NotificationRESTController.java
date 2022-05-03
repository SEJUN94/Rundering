package com.rundering.manage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.rundering.dto.EmployeesVO;
import com.rundering.service.NotificationService;

@RestController
@RequestMapping("/notification")
public class NotificationRESTController {
	
	@Autowired
	NotificationService notificationService;

	// 알림 가져오기
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getNotification(HttpServletRequest request) throws Exception {
		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> dataMap = new HashMap<>();
		
		HttpSession session = request.getSession();
		EmployeesVO loginEmployee = (EmployeesVO) session.getAttribute("loginEmployee");
		try {
			dataMap = notificationService.getNotification(loginEmployee.getEmployeeId());
			result = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			result = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return result;
	}

}
