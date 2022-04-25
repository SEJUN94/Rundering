package com.rundering.scheduler;

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
			List<LaundryOrderVO> orderListByArea = laundryOrderDAO
					.selectLaundryOrderListNotAssignedToBranchByArea(comCodeVO.getComCode());

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
				System.out.println(comCodeVO.getComCodeNm() + " 지역의 담당지점 미할당 주문수 : " + remainingOrderQuantity);

				// 지역의 전체주문수가 지역내 지점들의 세탁가능수량보다 많을 때 (지역 내 지점들로 감당하지 못할 때)
			} else {
				
			}

		}

	}

	private String getAffordableArea(String area) throws Exception {
		List<BranchVO> firstBranchList = null;
		List<BranchVO> secondBranchList = null;
		switch (area) {
		case "0601":
			firstBranchList = branchDAO.selectBranchListByArea("0602");
			secondBranchList = branchDAO.selectBranchListByArea("0605");
			break;
//			case "0602":
//				0601
//				0603
//				break;
//			case "0603":
//				0602
//				0604
//				break;
//			case "0604":
//				0603
//				0605
//				break;
//			case "0605":
//				0601
//				0604
//				break;

		default:
			break;
		}
		return area;

	}

}
