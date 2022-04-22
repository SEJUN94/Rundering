package com.rundering.manage.admin;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.dto.LaundryThroughPutVO;
import com.rundering.service.LaundryThroughputService;

@Controller
@RequestMapping("/admin/branchinfo")
public class BranchController {
	
	@Resource(name = "laundryThroughputService")
	private LaundryThroughputService laundryThroughputService;
	
	@RequestMapping("/information")
	public String pointInfo() {
		return "admin/branchinfo/branch_info";
	}
	
	@RequestMapping("/infodetail")
	public String pointInfodetail() {
		return "admin/branchinfo/branch_info_detail";
	}
	@RequestMapping("/detail")
	public String pointDetail() {
		return "admin/branchinfo/branch_detail";
	}
	@RequestMapping("/amount")
	public String pointAmount() {
		return "admin/branchinfo/branch_amount";
	}
	
	@RequestMapping("/quota")
	public ModelAndView branchQuota(ModelAndView mnv) throws Exception{
		String url="/admin/branchinfo/branch_quota";
		
		List<LaundryThroughPutVO> throughputList = laundryThroughputService.getThroughputList();
		
		mnv.addObject("throughputList", throughputList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/quotadetail")
	public ModelAndView branchQuotaDetail(String throughputNo, ModelAndView mnv) throws Exception{ 
		String url="/admin/branchinfo/branch_quota_detail";
		
		LaundryThroughPutVO throughput = laundryThroughputService.getLaundryQuatoByThroughputNo(throughputNo);
		
		mnv.addObject("throughput",throughput);
		mnv.setViewName(url);
		
		return mnv;
	}
}
