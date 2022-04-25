package com.rundering.manage.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.rundering.command.BranchInfoDetailCommand;
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
	public ModelAndView pointInfodetail(ModelAndView mnv, String branchCode) throws Exception{
		String url="admin/branchinfo/branch_info_detail";
		
		BranchInfoDetailCommand branchDetail = laundryThroughputService.getBranchDetail(branchCode);
		
		mnv.addObject("branchDetail", branchDetail);
		mnv.setViewName(url);
		
		return mnv;
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
		
		Map<String, Object> dataMap = laundryThroughputService.getLaundryQuatoByThroughputNo(throughputNo);
		
		//mnv.addObject("throughput",throughput);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/chart")
	public ResponseEntity<Map<String, Object>> chartjs(String throughputNo)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String, Object> dataMap= laundryThroughputService.getLaundryQuatoByThroughputNo(throughputNo);
		
		entity = new ResponseEntity<Map<String, Object>>(dataMap ,HttpStatus.CREATED);
		
		return entity;
	}
}
