package com.rundering.manage.branch;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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

}
