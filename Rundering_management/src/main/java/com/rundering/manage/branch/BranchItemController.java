package com.rundering.manage.branch;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rundering.command.BranchCriteria;
import com.rundering.dto.EmployeesVO;
import com.rundering.service.ItemService;

@Controller
@RequestMapping("/branch/item")
public class BranchItemController {
	@Autowired
	ItemService itemService;
	
	@RequestMapping(value="/list",method = RequestMethod.GET)
	private String list(BranchCriteria cri, Model model,HttpSession session) throws Exception {
		String url = "/branch/item/item_list";
		EmployeesVO emp=(EmployeesVO) session.getAttribute("loginEmployee");
		cri.setBranchCode( emp.getBranchCode());
		cri.setPerPageNum(5);
		Map<String, Object> dataMap = null;
		dataMap=itemService.selectItemVOList(cri);
		model.addAttribute("dataMap", dataMap);
		return url;
	}
	@RequestMapping(value="/insertList",method = RequestMethod.GET)
	private ResponseEntity<Map<String, Object>> insertList(BranchCriteria cri,HttpSession session,int page) {
		EmployeesVO emp =(EmployeesVO)session.getAttribute("loginEmployee");
		cri.setPage(page);
		cri.setPerPageNum(5);
		cri.setBranchCode(emp.getBranchCode());
		ResponseEntity<Map<String, Object>> resp = null;
		Map<String, Object> dataMap=null;
		
		try {
			 dataMap = itemService.itemInsertList(cri, "");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		resp=  new ResponseEntity<Map<String,Object>>(dataMap,HttpStatus.OK);	
		
		return resp;
	}
	
	

}
