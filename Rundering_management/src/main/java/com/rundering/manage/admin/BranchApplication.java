package com.rundering.manage.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.Criteria;
import com.rundering.service.BranchApplicationService;
import com.rundering.service.BranchService;

@RequestMapping("/admin/branchapplication")
@Controller
public class BranchApplication {

	@Autowired
	BranchApplicationService branchApplicationService;
	
	@RequestMapping("/contract")
	public ModelAndView branchContract(ModelAndView mnv,Criteria cri) {
		Map<String, Object> dataMap=null;
		try {
			dataMap=branchApplicationService.selectBranchApplicationList(cri);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName("/admin/branchapplication/contract_evaluation");
		return mnv;
	}
}
