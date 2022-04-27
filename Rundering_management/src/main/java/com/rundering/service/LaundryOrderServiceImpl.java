package com.rundering.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.BranchCriteria;
import com.rundering.command.BranchPageMaker;
import com.rundering.command.Criteria;
import com.rundering.command.PageMaker;
import com.rundering.dao.AttachDAO;
import com.rundering.dao.BranchDAO;
import com.rundering.dao.ComCodeDAO;
import com.rundering.dao.LaundryItemsDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dao.LaundryOrderDetailDAO;
import com.rundering.dao.MemberDAO;
import com.rundering.dao.ReplyDAO;
import com.rundering.dto.AttachVO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.LaundryOrderDetailVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.MemberVO;
import com.rundering.util.ComCodeUtil;
import com.rundering.util.FormatUtil;

public class LaundryOrderServiceImpl implements LaundryOrderService {
	
	private LaundryOrderDAO laundryOrderDAO;
	public void setLaundryOrderDAO(LaundryOrderDAO laundryOrderDAO) {
		this.laundryOrderDAO = laundryOrderDAO;
	}
	private LaundryOrderDetailDAO laundryOrderDetailDAO;
	public void setLaundryOrderDetailDAO(LaundryOrderDetailDAO laundryOrderDetailDAO) {
		this.laundryOrderDetailDAO = laundryOrderDetailDAO;
	}
	private LaundryItemsDAO laundryItemsDAO;
	public void setLaundryItemsDAO(LaundryItemsDAO laundryItemsDAO) {
		this.laundryItemsDAO = laundryItemsDAO;
	}
	private ReplyDAO replyDAO;
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	private ComCodeDAO comCodeDAO;
	public void setComCodeDAO(ComCodeDAO comCodeDAO) {
		this.comCodeDAO = comCodeDAO;
	}
	private BranchDAO branchDAO;
	public void setBranchDAO(BranchDAO branchDAO) {
		this.branchDAO = branchDAO;
	}
	private MemberDAO memberDAO;
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	private AttachDAO attachDAO;
	public void setAttachDAO(AttachDAO attachDAO) {
		this.attachDAO = attachDAO;
	}
	@Override
	public Map<String,Object> laundryOrderList(BranchCriteria cri) throws Exception{
		ComCodeUtil comCodeUtil =new ComCodeUtil();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String,String> orderCodeMap = new HashMap<String, String>();
		Map<String,String> laundryCodeMap = new HashMap<String, String>();
		comCodeUtil.getCodeMap("LAUNDRY_STATUS", laundryCodeMap, comCodeDAO);
		comCodeUtil.getUpperCodeMap("ORDER_STATUS", orderCodeMap, comCodeDAO);
		List<LaundryOrderVO> laundryOrderList = laundryOrderDAO.selectLaundryOrderList(cri);
		Map<String, Object> detailMap = new HashMap<String, Object>();
		
		for (LaundryOrderVO laundryOrder : laundryOrderList) {
			List<LaundryOrderDetailVO> LaundryOrderDetailList = laundryOrderDetailDAO.selectlaundryOrderDetailListByOrderNo(laundryOrder.getOrderNo());
			detailMap.put(laundryOrder.getOrderNo(), LaundryOrderDetailList);
		}
		
		// 전체 board 개수
		int totalCount = laundryOrderDAO.selectCount(cri);

		// PageMaker 생성.
		BranchPageMaker pageMaker = new BranchPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("laundryOrderList", laundryOrderList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("laundryCodeMap",laundryCodeMap);
		dataMap.put("orderCodeMap",orderCodeMap);
		dataMap.put("detailMap",detailMap);

		return dataMap;
	}
	@Override
	public void updateStatus(List<LaundryOrderVO> laundryOrderList) throws Exception{
		for (LaundryOrderVO laundryOrder : laundryOrderList) {
			laundryOrderDAO.updateLaundryOrderStatusByOrderNo(laundryOrder);
		}
	}
	@Override
	public List<AttachVO> selectAttachList(String attchNo) throws Exception{
		return attachDAO.selectAttachVOByFileNo(attchNo);
	}
	@Override
	public Map<String, Object> getAdminlaundryOrderList(Criteria cri) throws Exception {
		ComCodeUtil comCodeUtil =new ComCodeUtil();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String,String> orderCodeMap = new HashMap<String, String>();
		Map<String,String> areaCodeMap = new HashMap<String, String>();
		Map<String,String> branchNameMap = new HashMap<String, String>();
		comCodeUtil.getUpperCodeMap("ORDER_STATUS", orderCodeMap, comCodeDAO);
		comCodeUtil.getCodeMap("AREA", areaCodeMap, comCodeDAO);
		
		List<BranchVO> branchList = branchDAO.selectBranchList();
		for (BranchVO branchVO : branchList) {
			branchNameMap.put(branchVO.getBranchCode(), branchVO.getBranchName());
		}
		
		List<LaundryOrderVO> laundryOrderList = laundryOrderDAO.selectAdminLaundryOrderList(cri);
		
		int totalCount = laundryOrderDAO.selectCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("laundryOrderList", laundryOrderList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("orderCodeMap",orderCodeMap);
		dataMap.put("areaCodeMap",areaCodeMap);
		dataMap.put("branchNameMap",branchNameMap);
		return dataMap;
	}
	@Override
	public Map<String, Object> getlaundryOrderByOrderNo(String orderNo) throws Exception {
		ComCodeUtil comCodeUtil =new ComCodeUtil();
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String,String> orderCodeMap = new HashMap<String, String>();
		Map<String,String> areaCodeMap = new HashMap<String, String>();
		Map<String,String> branchNameMap = new HashMap<String, String>();
		comCodeUtil.getUpperCodeMap("ORDER_STATUS", orderCodeMap, comCodeDAO);
		comCodeUtil.getCodeMap("AREA", areaCodeMap, comCodeDAO);
		
		LaundryOrderVO laundryOrder = laundryOrderDAO.selectLaundryOrderByOrderNo(orderNo);
		List<LaundryOrderDetailVO> laundryOrderDetailList = laundryOrderDetailDAO.selectlaundryOrderDetailListByOrderNo(orderNo);
		if(laundryOrder==null) {
			return null;
		}
		
		if(laundryOrder.getBranchCode() != null) {
			BranchVO branch = branchDAO.selectBranchByBranchCode(laundryOrder.getBranchCode());
			laundryOrder.setBranchCode(branch.getBranchName());
		}
		MemberVO member = memberDAO.selectMemberByMemberNo(laundryOrder.getMemberNo());
		laundryOrder.setMemberNo(member.getName());
		
		laundryOrder.setContactNumber(FormatUtil.hyphenationPhoneNum(laundryOrder.getContactNumber()));
		
		dataMap.put("orderCodeMap",orderCodeMap);
		dataMap.put("areaCodeMap",areaCodeMap);
		dataMap.put("branchNameMap",branchNameMap);
		dataMap.put("laundryOrder", laundryOrder);
		dataMap.put("laundryOrderDetailList", laundryOrderDetailList);
		return dataMap;
	}
	@Override 
	public String selectGetBranchCode(String branchCode) {
		String result=null;
		try {
			BranchVO branch=branchDAO.selectBranchByBranchCode(branchCode);
			result= branch.getBranchName();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
}
