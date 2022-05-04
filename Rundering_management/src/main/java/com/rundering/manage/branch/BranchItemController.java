package com.rundering.manage.branch;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rundering.command.BranchCriteria;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.ItemVO;
import com.rundering.dto.LaundryGoodsStockVO;
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
	@RequestMapping(value="autouse",method = RequestMethod.POST)
	private String autouse(LaundryGoodsStockVO laundryGoodsStock,HttpSession session) throws Exception{
		String url = "redirect:/branch/item/list";
		EmployeesVO emp=(EmployeesVO) session.getAttribute("loginEmployee");
		laundryGoodsStock.setBranchCode(emp.getBranchCode());
		itemService.useAutoYn(laundryGoodsStock);
		
		
		return url;
	}
	
	@RequestMapping(value="chart",method =RequestMethod.GET,produces = "application/json;charset=utf-8")
	@ResponseBody
	private ResponseEntity<List<ItemVO>> chart(int chartDay,String articlesCode,HttpSession session){
		ItemVO item = new ItemVO();
		item.setArticlesCode(articlesCode);
		EmployeesVO emp = (EmployeesVO)session.getAttribute("loginEmployee");
		item.setBranchCode(emp.getBranchCode());
		
		List<ItemVO> itemList = new ArrayList<ItemVO>();
		ResponseEntity<List<ItemVO>> resp =null;
		
			try {
				if(chartDay == 1) {
					itemList=itemService.selectDDItemByItem(item);
				}
				if(chartDay == 30) {
					itemList=itemService.selectMMItemByItem(item);
				}
				if(chartDay == 90) {
					itemList=itemService.select3MItemByItem(item);
				}
				if(chartDay == 365) {
					itemList=itemService.selectYYItemByItem(item);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		resp= new ResponseEntity<List<ItemVO>>(itemList, HttpStatus.OK);
		
		
		return resp;
		
	}
	

}
