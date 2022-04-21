package com.rundering.manage.branch;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.EmployeesVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.manage.Criteria;
import com.rundering.service.LaundryOrderService;
import com.rundering.util.BranchCriteria;

@Controller
@RequestMapping("/branch/laundrysituatuion")
public class LaundrySituatuionController {
	@Autowired
	LaundryOrderService laundryOrderService;
	
	@RequestMapping("/list")
	private String situatuionList(Model model,BranchCriteria cri,HttpSession session) throws Exception {
		Map<String, Object> dataMap=null;
		cri.setPerPageNum(5);
		String url = "branch/laundrysituatuion/situatuion_list";
		EmployeesVO emp = (EmployeesVO)session.getAttribute("loginEmployee");
		cri.setBranchCode(emp.getBranchCode());
		dataMap= laundryOrderService.laundryOrderList(cri);
		model.addAttribute("dataMap", dataMap);
		return url;
	}
	

	@RequestMapping(value = "/modify",method = RequestMethod.POST)
	private String situatuonModify(String[] orderNo ,String orderStatus) throws Exception{
		String url = "redirect:/branch/laundrysituatuion/list";
		List<LaundryOrderVO> laundryOrderList = new ArrayList<LaundryOrderVO>();
		for (String no : orderNo) {
			LaundryOrderVO laundryOrder = new LaundryOrderVO();
			laundryOrder.setOrderNo(no);
			laundryOrder.setOrderStatus(orderStatus);
			laundryOrderList.add(laundryOrder);
		}
		laundryOrderService.updateStatus(laundryOrderList);
		return url;
	}
	@RequestMapping("/detail")
	private String situatuonDetail() {
		String url = "branch/laundrysituatuion/situatuion_modify";
		return url; 
	}
}
