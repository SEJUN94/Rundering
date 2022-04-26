package com.rundering.scheduler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rundering.dao.BranchDAO;
import com.rundering.dao.ComCodeDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.ComCodeVO;
import com.rundering.dto.LaundryOrderVO;

public class OrderTaskScheduler {

	private BranchDAO branchDAO;

	public void setBranchDAO(BranchDAO branchDAO) {
		this.branchDAO = branchDAO;
	}

	private LaundryOrderDAO laundryOrderDAO;

	public void setLaundryOrderDAO(LaundryOrderDAO laundryOrderDAO) {
		this.laundryOrderDAO = laundryOrderDAO;
	}

	private ComCodeDAO comCodeDAO;

	public void setComCodeDAO(ComCodeDAO comCodeDAO) {
		this.comCodeDAO = comCodeDAO;
	}

	private static final Logger logger = LoggerFactory.getLogger(OrderTaskScheduler.class);

	// 세탁주문 지점에 할당
	public void assignLaundryOrderToBranch() throws Exception {
		List<ComCodeVO> areaCodeList = comCodeDAO.selectComCodeByComCodeGrp("AREA");

		for (ComCodeVO comCodeVO : areaCodeList) {
			List<BranchVO> branchListByArea = branchDAO.selectBranchListByArea(comCodeVO.getComCode());
			List<LaundryOrderVO> orderListByArea = laundryOrderDAO.selectLaundryOrderListNotAssignedToBranchByArea(comCodeVO.getComCode());

			if (orderListByArea.size() == 0)
				continue;

			int totalOrderQuantityInArea = orderListByArea.size();
			int remainingOrderQuantity = orderListByArea.size();
			int cnt = 0;
			int totalProcessableOrderQuantity = 0;
			for (BranchVO branchVO : branchListByArea) {
				totalProcessableOrderQuantity += branchVO.getBranchLndrpcrymslmcoqy();
			}
			// 지역의 전체주문수가 지역내 지점들의 세탁가능수량보다 적을 때 (지역 내에서 감당가능할 때)
			if (totalProcessableOrderQuantity > totalOrderQuantityInArea) {
				BranchVO mostThroughputBranch = null;
				LaundryOrderVO orderVO = new LaundryOrderVO();
				for (BranchVO branchVO : branchListByArea) {
					// 지점 주문할당할 개수 = 지역내전체주문수 * (해당지점의 세탁가능수량 / 지역내모든지점의 세탁가능수량 * 100) / 100
					int quantity = (int) (totalOrderQuantityInArea
							* ((double) branchVO.getBranchLndrpcrymslmcoqy() / totalProcessableOrderQuantity * 100)
							/ 100);
					logger.info(comCodeVO.getComCodeNm() + " 지역의 전체주문수 : " + totalOrderQuantityInArea
							+ ", 지역내모든지점의 총세탁가능량 : " + totalProcessableOrderQuantity);
					logger.info(branchVO.getBranchName() + "의 세탁가능량 : " + branchVO.getBranchLndrpcrymslmcoqy() + ", "
							+ branchVO.getBranchName() + "의 할당 퍼센트"
							+ ((double) branchVO.getBranchLndrpcrymslmcoqy() / totalProcessableOrderQuantity * 100));
					logger.info(branchVO.getBranchName() + "에 할당될 주문수" + quantity);
					if (mostThroughputBranch == null || (mostThroughputBranch.getBranchLndrpcrymslmcoqy() < branchVO
							.getBranchLndrpcrymslmcoqy())) {
						mostThroughputBranch = branchVO;
					}
					for (int i = cnt + 0; i < cnt + quantity; i++) {
						orderVO = orderListByArea.get(i);
						orderVO.setBranchCode(branchVO.getBranchCode());
						laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
					}
					cnt += quantity;
					remainingOrderQuantity -= quantity;
				}
				if (remainingOrderQuantity > 0) {
					for (int i = cnt + 0; i < cnt + remainingOrderQuantity; i++) {
						orderVO = orderListByArea.get(i);
						orderVO.setBranchCode(mostThroughputBranch.getBranchCode());
						laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
						remainingOrderQuantity -= 1;
					}
				}
				logger.info(comCodeVO.getComCodeNm() + " 지역의 담당지점 미할당 주문수 : " + remainingOrderQuantity);

				
			} else { // 지역의 전체주문수가 지역내 지점들의 세탁가능수량보다 많을 때 (지역 내 지점들로 감당하지 못할 때)
				
				for (BranchVO branchVO : branchListByArea) {
					logger.info(comCodeVO.getComCodeNm() + " 지역의 전체주문수 : " + totalOrderQuantityInArea
							+ ", 지역내모든지점의 총세탁가능량 : " + totalProcessableOrderQuantity);
					logger.info(branchVO.getBranchName() + "의 세탁가능량 : " + branchVO.getBranchLndrpcrymslmcoqy());
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (int i = cnt + 0; i < cnt + branchVO.getBranchLndrpcrymslmcoqy() ; i++) {
						orderVO = orderListByArea.get(i);
						orderVO.setBranchCode(branchVO.getBranchCode());
						laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
					}
					cnt += branchVO.getBranchLndrpcrymslmcoqy();
					remainingOrderQuantity -= cnt;
				}
				logger.info(comCodeVO.getComCodeNm() + " 지역의 담당지점 미할당 주문수 : " + remainingOrderQuantity);
			}
		}
		
		//초과 주문 타 지역지점에 넘기기
		for (ComCodeVO comCodeVO : areaCodeList) {
			List<LaundryOrderVO> orderListByArea = laundryOrderDAO.selectLaundryOrderListNotAssignedToBranchByArea(comCodeVO.getComCode());

			if (orderListByArea.size() == 0)
				continue;

			int remainingOrderQuantity = orderListByArea.size();
			int cnt = 0;
			int totalProcessableOrderQuantity = 0;
			if (remainingOrderQuantity > 0) {
				List<String> areaList = getAffordableArea(comCodeVO.getComCode(), remainingOrderQuantity);
				if(areaList.size() == 0 ) {
					
					logger.info(comCodeVO.getComCodeNm() + "지역의 초과주문을 이관할 적당한 지역을 찾지 못했습니다. 확인바랍니다.");
					
				}else if (areaList.size() == 1) { //타지역 1곳에 할당
					
					List<BranchVO> branchListOfOtherArea = branchDAO.selectBranchListByArea(areaList.get(0));
					int totalRemainingOrderQuantity = remainingOrderQuantity;
					totalProcessableOrderQuantity = 0;
					for (BranchVO branchVO : branchListOfOtherArea) {
						totalProcessableOrderQuantity += branchVO.getBranchLndrpcrymslmcoqy();
					}
					BranchVO mostThroughputBranch = null;
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (BranchVO branchVO : branchListOfOtherArea) {
						// 지점 주문할당할 개수 = 다른지역의 남은주문수 * (해당지점의 세탁가능수량 / 지역내모든지점의 세탁가능수량 * 100) / 100
						int quantity = (int) (totalRemainingOrderQuantity * ((double) branchVO.getBranchLndrpcrymslmcoqy() / totalProcessableOrderQuantity * 100) / 100);
						logger.info(comCodeVO.getComCodeNm() + " 지역의 초과주문수 : " + totalRemainingOrderQuantity);
						logger.info(branchVO.getBranchName() + "의 세탁가능량 : " + branchVO.getBranchLndrpcrymslmcoqy() + ", "	+ branchVO.getBranchName() + "의 할당 퍼센트"+ ((double) branchVO.getBranchLndrpcrymslmcoqy() / totalProcessableOrderQuantity * 100));
						logger.info(branchVO.getBranchName() + "에 할당될 "+comCodeVO.getComCodeNm() + " 지역의 주문수" + quantity);
						if (mostThroughputBranch == null || (mostThroughputBranch.getBranchLndrpcrymslmcoqy() < branchVO.getBranchLndrpcrymslmcoqy())) {
							mostThroughputBranch = branchVO;
						}
						for (int i = cnt + 0; i < cnt + quantity; i++) {
							orderVO = orderListByArea.get(i);
							orderVO.setBranchCode(branchVO.getBranchCode());
							laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
						}
						cnt += quantity;
						remainingOrderQuantity -= quantity;
					}
					if (remainingOrderQuantity > 0) {
						for (int i = cnt + 0; i < cnt + remainingOrderQuantity; i++) {
							orderVO = orderListByArea.get(i);
							orderVO.setBranchCode(mostThroughputBranch.getBranchCode());
							laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
							remainingOrderQuantity -= 1;
						}
					}
					logger.info(comCodeVO.getComCodeNm() + " 지역의 담당지점 미할당 주문수 : " + remainingOrderQuantity);
					
				}else if (areaList.size() == 2) { //타지역 2곳에 할당
					
					BranchVO mostThroughputBranch = null;
					
					for (String area : areaList) {
						int totalExcessCapacity = branchDAO.selectExcessCapacityOfTodayLaundryByArea(area);
						int excessCapacity = branchDAO.selectExcessCapacityOfTodayLaundryByArea(area);
						if(excessCapacity >= remainingOrderQuantity) excessCapacity = remainingOrderQuantity;
						List<BranchVO> branchListOfOtherArea = branchDAO.selectBranchListByArea(area);
						int totalRemainingOrderQuantity = remainingOrderQuantity;
						LaundryOrderVO orderVO = new LaundryOrderVO();
						for (BranchVO branchVO : branchListOfOtherArea) {
							// 지점 주문할당할 개수 = 할당받을다른지역의세탁처리초과량 * (해당지점의 남은세탁가능수량 / 지역의남은세탁처리가능수량 * 100) / 100
							int quantity = (int) (excessCapacity * ((double) branchDAO.selectExcessCapacityOfTodayLaundryByBranchCode(branchVO.getBranchCode()) / totalExcessCapacity * 100) / 100);
							logger.info(comCodeVO.getComCodeNm() + " 지역의 초과주문수 : " + totalRemainingOrderQuantity);
							logger.info(branchVO.getBranchName() + "에 할당될 "+comCodeVO.getComCodeNm() + " 지역의 주문수" + quantity);
							if (mostThroughputBranch == null || (branchDAO.selectExcessCapacityOfTodayLaundryByBranchCode(mostThroughputBranch.getBranchCode())< branchDAO.selectExcessCapacityOfTodayLaundryByBranchCode(branchVO.getBranchCode()))) {
								mostThroughputBranch = branchVO;
							}
							for (int i = cnt + 0; i < cnt + quantity; i++) {
								orderVO = orderListByArea.get(i);
								orderVO.setBranchCode(branchVO.getBranchCode());
								laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
							}
							cnt += quantity;
							remainingOrderQuantity -= quantity;
						}
					}
					if (remainingOrderQuantity > 0) {
						LaundryOrderVO orderVO = new LaundryOrderVO();
						for (int i = cnt + 0; i < cnt + remainingOrderQuantity; i++) {
							orderVO = orderListByArea.get(i);
							orderVO.setBranchCode(mostThroughputBranch.getBranchCode());
							laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
							remainingOrderQuantity -= 1;
						}
					}
					logger.info(comCodeVO.getComCodeNm() + " 지역의 담당지점 미할당 주문수 : " + remainingOrderQuantity);
				}
					
			}
		}

	}

	private List<String> getAffordableArea(String area, int remainQuantity) throws Exception {
		List<String> AffordableArea = new ArrayList<String>();
		int excessCapacityOfFirstArea = 0;
		int excessCapacityOfSecondArea = 0;
		String firstArea = "";
		String secondArea = "";
		switch (area) {
		case "0601":
			firstArea = "0602";
			secondArea = "0605";
			break;
		case "0602":
			firstArea = "0601";
			secondArea = "0603";
			break;
		case "0603":
			firstArea = "0602";
			secondArea = "0604";
			break;
		case "0604":
			firstArea = "0603";
			secondArea = "0605";
			break;
		case "0605":
			firstArea = "0604";
			secondArea = "0601";
			break;
		default:
			return AffordableArea;
		}
		excessCapacityOfFirstArea = branchDAO.selectExcessCapacityOfTodayLaundryByArea(firstArea);
		excessCapacityOfSecondArea = branchDAO.selectExcessCapacityOfTodayLaundryByArea(secondArea);
		if (remainQuantity > (excessCapacityOfFirstArea + excessCapacityOfSecondArea)) {
			return AffordableArea;
		}
		if (remainQuantity <= excessCapacityOfFirstArea && excessCapacityOfFirstArea >= excessCapacityOfSecondArea) {
			AffordableArea.add(firstArea);
		} else if (remainQuantity <= excessCapacityOfSecondArea && excessCapacityOfFirstArea < excessCapacityOfSecondArea) {
			AffordableArea.add(secondArea);
		}else {
			AffordableArea.add(firstArea);
			AffordableArea.add(secondArea);
		}
		return AffordableArea;
	}

}
