
package com.rundering.scheduler;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.rundering.dao.BranchDAO;
import com.rundering.dao.ComCodeDAO;
import com.rundering.dao.EmployeesDAO;
import com.rundering.dao.ItemOrderDAO;
import com.rundering.dao.LaundryArticlesDAO;
import com.rundering.dao.LaundryGoodsStockDAO;
import com.rundering.dao.LaundryOrderDAO;
import com.rundering.dao.NotificationDAO;
import com.rundering.dto.BranchVO;
import com.rundering.dto.ComCodeVO;
import com.rundering.dto.EmployeesVO;
import com.rundering.dto.ItemOrderDetailVO;
import com.rundering.dto.ItemOrderVO;
import com.rundering.dto.LaundryArticlesVO;
import com.rundering.dto.LaundryGoodsStockVO;
import com.rundering.dto.LaundryOrderVO;
import com.rundering.dto.NotificationVO;
import com.rundering.util.SensSms;

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

	private EmployeesDAO employeesDAO;

	public void setEmployeesDAO(EmployeesDAO employeesDAO) {
		this.employeesDAO = employeesDAO;
	}

	private SensSms sensSms;

	public void setSensSms(SensSms sensSms) {
		this.sensSms = sensSms;
	}

	private NotificationDAO notificationDAO;

	public void setNotificationDAO(NotificationDAO notificationDAO) {
		this.notificationDAO = notificationDAO;
	}

	private LaundryGoodsStockDAO laundryGoodsStockDAO;

	public void setLaundryGoodsStockDAO(LaundryGoodsStockDAO laundryGoodsStockDAO) {
		this.laundryGoodsStockDAO = laundryGoodsStockDAO;
	}

	private ItemOrderDAO itemOrderDAO;

	public void setItemOrderDAO(ItemOrderDAO itemOrderDAO) {
		this.itemOrderDAO = itemOrderDAO;
	}

	private LaundryArticlesDAO laundryArticlesDAO;

	public void setLaundryArticlesDAO(LaundryArticlesDAO laundryArticlesDAO) {
		this.laundryArticlesDAO = laundryArticlesDAO;
	}

	private static final Logger logger = LoggerFactory.getLogger(OrderTaskScheduler.class);

	// ???????????? ????????? ??????
	public Map<String,Object> assignLaundryOrderToBranch() throws Exception {
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		List<ComCodeVO> areaCodeList = comCodeDAO.selectComCodeByComCodeGrp("AREA");
		int assignedOrderCnt = 0;
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
			// ????????? ?????????????????? ????????? ???????????? ???????????????????????? ?????? ??? (?????? ????????? ??????????????? ???)
			if (totalProcessableOrderQuantity > totalOrderQuantityInArea) {
				BranchVO mostThroughputBranch = null;
				LaundryOrderVO orderVO = new LaundryOrderVO();
				for (BranchVO branchVO : branchListByArea) {
					// ?????? ??????????????? ?????? = ???????????????????????? * (??????????????? ?????????????????? / ???????????????????????? ?????????????????? * 100) / 100
					int quantity = (int) (totalOrderQuantityInArea
							* ((double) branchVO.getBranchLndrpcrymslmcoqy() / totalProcessableOrderQuantity * 100)
							/ 100);
					logger.info(comCodeVO.getComCodeNm() + " ????????? ??????????????? : " + totalOrderQuantityInArea
							+ ", ???????????????????????? ?????????????????? : " + totalProcessableOrderQuantity);
					logger.info(branchVO.getBranchName() + "??? ??????????????? : " + branchVO.getBranchLndrpcrymslmcoqy() + ", "
							+ branchVO.getBranchName() + "??? ?????? ?????????"
							+ ((double) branchVO.getBranchLndrpcrymslmcoqy() / totalProcessableOrderQuantity * 100));
					logger.info(branchVO.getBranchName() + "??? ????????? ?????????" + quantity);
					if (mostThroughputBranch == null || (mostThroughputBranch.getBranchLndrpcrymslmcoqy() < branchVO
							.getBranchLndrpcrymslmcoqy())) {
						mostThroughputBranch = branchVO;
					}
					for (int i = cnt + 0; i < cnt + quantity; i++) {
						orderVO = orderListByArea.get(i);
						orderVO.setBranchCode(branchVO.getBranchCode());
						laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
						assignedOrderCnt++;
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
						assignedOrderCnt++;
					}
				}
				logger.info(comCodeVO.getComCodeNm() + " ????????? ???????????? ????????? ????????? : " + remainingOrderQuantity);

			} else { // ????????? ?????????????????? ????????? ???????????? ???????????????????????? ?????? ??? (?????? ??? ???????????? ???????????? ?????? ???)

				for (BranchVO branchVO : branchListByArea) {
					logger.info(comCodeVO.getComCodeNm() + " ????????? ??????????????? : " + totalOrderQuantityInArea
							+ ", ???????????????????????? ?????????????????? : " + totalProcessableOrderQuantity);
					logger.info(branchVO.getBranchName() + "??? ??????????????? : " + branchVO.getBranchLndrpcrymslmcoqy());
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (int i = cnt + 0; i < cnt + branchVO.getBranchLndrpcrymslmcoqy(); i++) {
						orderVO = orderListByArea.get(i);
						orderVO.setBranchCode(branchVO.getBranchCode());
						laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
						assignedOrderCnt++;
					}
					cnt += branchVO.getBranchLndrpcrymslmcoqy();
					remainingOrderQuantity -= cnt;
				}
				logger.info(comCodeVO.getComCodeNm() + " ????????? ???????????? ????????? ????????? : " + remainingOrderQuantity);
			}
		}

		// ?????? ?????? ??? ??????????????? ?????????
		for (ComCodeVO comCodeVO : areaCodeList) {
			List<LaundryOrderVO> orderListByArea = laundryOrderDAO
					.selectLaundryOrderListNotAssignedToBranchByArea(comCodeVO.getComCode());

			if (orderListByArea.size() == 0)
				continue;

			int remainingOrderQuantity = orderListByArea.size();
			int cnt = 0;
			int totalProcessableOrderQuantity = 0;
			if (remainingOrderQuantity > 0) {
				List<String> areaList = getAffordableArea(comCodeVO.getComCode(), remainingOrderQuantity);
				if (areaList.size() == 0) {

					logger.info(comCodeVO.getComCodeNm() + "????????? ??????????????? ????????? ????????? ????????? ?????? ???????????????. ??????????????????.");

				} else if (areaList.size() == 1) { // ????????? 1?????? ??????

					int totalExcessCapacity = branchDAO.selectExcessCapacityOfTomorrowLaundryByArea(areaList.get(0));

					List<BranchVO> branchListOfOtherArea = branchDAO.selectBranchListByArea(areaList.get(0));
					int totalRemainingOrderQuantity = remainingOrderQuantity;
					totalProcessableOrderQuantity = 0;
					for (BranchVO branchVO : branchListOfOtherArea) {
						totalProcessableOrderQuantity += branchVO.getBranchLndrpcrymslmcoqy();
					}
					BranchVO mostThroughputBranch = null;
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (BranchVO branchVO : branchListOfOtherArea) {
						// ?????? ??????????????? ?????? = ??????????????? ??????????????? * (??????????????? ???????????????????????? / ???????????????????????? ???????????????????????? * 100) / 100
						int quantity = (int) (totalRemainingOrderQuantity * ((double) branchDAO
								.selectExcessCapacityOfTomorrowLaundryByBranchCode(branchVO.getBranchCode())
								/ totalExcessCapacity * 100) / 100);
						logger.info(comCodeVO.getComCodeNm() + " ????????? ??????????????? : " + totalRemainingOrderQuantity);
						logger.info(branchVO.getBranchName() + "??? ??????????????? : "
								+ branchDAO.selectExcessCapacityOfTomorrowLaundryByBranchCode(branchVO.getBranchCode())
								+ ", " + branchVO.getBranchName() + "??? ?????? ?????????"
								+ ((double) branchDAO
										.selectExcessCapacityOfTomorrowLaundryByBranchCode(branchVO.getBranchCode())
										/ totalExcessCapacity * 100));
						logger.info(
								branchVO.getBranchName() + "??? ????????? " + comCodeVO.getComCodeNm() + " ????????? ?????????" + quantity);
						if (mostThroughputBranch == null || (mostThroughputBranch.getBranchLndrpcrymslmcoqy() < branchVO
								.getBranchLndrpcrymslmcoqy())) {
							mostThroughputBranch = branchVO;
						}
						for (int i = cnt + 0; i < cnt + quantity; i++) {
							orderVO = orderListByArea.get(i);
							orderVO.setBranchCode(branchVO.getBranchCode());
							laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
							assignedOrderCnt++;
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
							assignedOrderCnt++;
						}
					}
					logger.info(comCodeVO.getComCodeNm() + " ????????? ???????????? ????????? ????????? : " + remainingOrderQuantity);

				} else if (areaList.size() == 2) { // ????????? 2?????? ??????

					BranchVO mostThroughputBranch = null;

					for (String area : areaList) {
						int totalExcessCapacity = branchDAO.selectExcessCapacityOfTomorrowLaundryByArea(area);
						int excessCapacity = branchDAO.selectExcessCapacityOfTomorrowLaundryByArea(area);
						if (excessCapacity >= remainingOrderQuantity)
							excessCapacity = remainingOrderQuantity;
						List<BranchVO> branchListOfOtherArea = branchDAO.selectBranchListByArea(area);
						int totalRemainingOrderQuantity = remainingOrderQuantity;
						LaundryOrderVO orderVO = new LaundryOrderVO();
						for (BranchVO branchVO : branchListOfOtherArea) {
							// ?????? ??????????????? ?????? = ???????????????????????????????????????????????? * (??????????????? ???????????????????????? / ??????????????????????????????????????? * 100) / 100
							int quantity = (int) (excessCapacity * ((double) branchDAO
									.selectExcessCapacityOfTomorrowLaundryByBranchCode(branchVO.getBranchCode())
									/ totalExcessCapacity * 100) / 100);
							logger.info(comCodeVO.getComCodeNm() + " ????????? ??????????????? : " + totalRemainingOrderQuantity);
							logger.info(branchVO.getBranchName() + "??? ????????? " + comCodeVO.getComCodeNm() + " ????????? ?????????"
									+ quantity);
							if (mostThroughputBranch == null
									|| (branchDAO.selectExcessCapacityOfTomorrowLaundryByBranchCode(
											mostThroughputBranch.getBranchCode()) < branchDAO
													.selectExcessCapacityOfTomorrowLaundryByBranchCode(
															branchVO.getBranchCode()))) {
								mostThroughputBranch = branchVO;
							}
							for (int i = cnt + 0; i < cnt + quantity; i++) {
								orderVO = orderListByArea.get(i);
								orderVO.setBranchCode(branchVO.getBranchCode());
								laundryOrderDAO.updateLaundryOrderbranchCode(orderVO);
								assignedOrderCnt++;
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
							assignedOrderCnt++;
						}
					}
					logger.info(comCodeVO.getComCodeNm() + " ????????? ???????????? ????????? ????????? : " + remainingOrderQuantity);
				}

			}
		}

		int remainAllAreaOrder = 0;
		for (ComCodeVO comCodeVO : areaCodeList) {
			List<LaundryOrderVO> orderListByArea = laundryOrderDAO
					.selectLaundryOrderListNotAssignedToBranchByArea(comCodeVO.getComCode());
			remainAllAreaOrder += orderListByArea.size();
		}
		
		//????????? ????????? ?????? ???????????? ??????
		if(assignedOrderCnt > 0) {
			// ?????? ??????????????? ??????
			List<EmployeesVO> employeesList = employeesDAO.selectEmployeesByBranchCode("000000");
			NotificationVO notificationVO = new NotificationVO();
			for (EmployeesVO employeesVO : employeesList) {
				int sequence = notificationDAO.selectNotificationSequenceNextValue();
				notificationVO.setNtcnId(String.valueOf(sequence));
				notificationVO.setEmployeeId(employeesVO.getEmployeeId());
				notificationVO.setNtcnknd("PC"); // ???????????? ???????????? - ????????????
				notificationVO.setNtcncn("????????????, ????????? " + remainAllAreaOrder + "???");
				notificationVO.setNtcnclickhourUrl("'/runderingmanage/admin/laundryorder/list','A010100'");
				notificationDAO.insertNotification(notificationVO);
			}
			
			// ????????? ????????? ?????? ????????? ???????????? ?????? ?????? - ???????????? ??????
			List<BranchVO> branchList = branchDAO.selectBranchList();
			for (BranchVO branch : branchList) {
				if (branch.getBranchCode().equals("000000"))
					continue;
				List<LaundryOrderVO> orderlist = laundryOrderDAO
						.selectLaundryOrderListPickUpRequestDateTodayByBranchCode(branch.getBranchCode());
				if (orderlist.size() < 1)
					continue;
				
				List<EmployeesVO> employeesli = employeesDAO.selectEmployeesByBranchCode(branch.getBranchCode());
				for (EmployeesVO employees2 : employeesli) {
					if (employees2.getDepartment().equals("DE"))
						continue;
					int sequence = notificationDAO.selectNotificationSequenceNextValue();
					notificationVO.setNtcnId(String.valueOf(sequence));
					notificationVO.setEmployeeId(employees2.getEmployeeId());
					notificationVO.setNtcnknd("PC"); // ???????????? ???????????? - ????????????
					notificationVO.setNtcncn("???????????? " + orderlist.size() + "??? ?????????");
					notificationVO.setNtcnclickhourUrl("'/runderingmanage/branch/laundrysituatuion/list','B010100'");
					notificationDAO.insertNotification(notificationVO);
				}
			}
		}

		dataMap.put("assignedOrderCnt",assignedOrderCnt);
		dataMap.put("remainAllAreaOrder",remainAllAreaOrder);
		return dataMap;

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
		excessCapacityOfFirstArea = branchDAO.selectExcessCapacityOfTomorrowLaundryByArea(firstArea);
		excessCapacityOfSecondArea = branchDAO.selectExcessCapacityOfTomorrowLaundryByArea(secondArea);
		if (remainQuantity > (excessCapacityOfFirstArea + excessCapacityOfSecondArea)) {
			return AffordableArea;
		}
		if (remainQuantity <= excessCapacityOfFirstArea && excessCapacityOfFirstArea >= excessCapacityOfSecondArea) {
			AffordableArea.add(firstArea);
		} else if (remainQuantity <= excessCapacityOfSecondArea
				&& excessCapacityOfFirstArea < excessCapacityOfSecondArea) {
			AffordableArea.add(secondArea);
		} else {
			AffordableArea.add(firstArea);
			AffordableArea.add(secondArea);
		}
		return AffordableArea;
	}

	// ???????????? ??????
	public void assignPickupEmployee() throws Exception {
		List<ComCodeVO> areaCodeList = comCodeDAO.selectComCodeByComCodeGrp("AREA");

		for (ComCodeVO comCodeVO : areaCodeList) {
			List<BranchVO> branchListByArea = branchDAO.selectBranchListByArea(comCodeVO.getComCode());
			for (BranchVO branchVO : branchListByArea) {
				List<LaundryOrderVO> orderListByBranchCode = laundryOrderDAO
						.selectLaundryOrderListPickUpRequestDateTodayByBranchCode(branchVO.getBranchCode());
				List<EmployeesVO> deliveryDepartmentEmployees = employeesDAO
						.selectDeliveryDepartmentEmployeesByBranchCode(branchVO.getBranchCode());

				if (orderListByBranchCode.size() == 0)
					continue;
				if (deliveryDepartmentEmployees.size() == 0) {
					logger.info(branchVO.getBranchName() + "??? ??????????????? ????????????.");
					continue;
				}

				int numberOfEmployees = deliveryDepartmentEmployees.size();
				int numberOfOrder = orderListByBranchCode.size();

				int cnt = 0;

				int quantity = (int) ((double) numberOfOrder / numberOfEmployees);
				for (EmployeesVO employeesVO : deliveryDepartmentEmployees) {
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (int i = cnt + 0; i < cnt + quantity; i++) {
						orderVO = orderListByBranchCode.get(i);
						orderVO.setPickupEmployeeId(employeesVO.getEmployeeId());
						laundryOrderDAO.updateLaundryOrderPickupEmployeeId(orderVO);
						orderVO.setOrderStatus("02");
						laundryOrderDAO.updateLaundryOrderStatusByOrderNo(orderVO);

					}
					cnt += quantity;
					logger.info(branchVO.getBranchName() + "??? " + employeesVO.getEmployeeId() + " ???????????? ?????? ????????? "
							+ numberOfOrder + "??? ??? " + quantity + "??? ?????????");
				}
				if ((numberOfOrder - cnt) > 0) {
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (int i = cnt + 0; i < cnt + (numberOfOrder - cnt); i++) {
						orderVO = orderListByBranchCode.get(i);
						orderVO.setPickupEmployeeId(deliveryDepartmentEmployees.get(0).getEmployeeId());
						laundryOrderDAO.updateLaundryOrderPickupEmployeeId(orderVO);
						orderVO.setOrderStatus("02");
						laundryOrderDAO.updateLaundryOrderStatusByOrderNo(orderVO);
					}
					logger.info(branchVO.getBranchName() + "??? " + deliveryDepartmentEmployees.get(0).getEmployeeId()
							+ " ???????????? " + (numberOfOrder - cnt) + "??? ?????? ?????????");
				}
			}
		}
	}

	// ???????????? ??????
	public void assignDeliveryEmployee() throws Exception {
		List<ComCodeVO> areaCodeList = comCodeDAO.selectComCodeByComCodeGrp("AREA");

		for (ComCodeVO comCodeVO : areaCodeList) {
			List<BranchVO> branchListByArea = branchDAO.selectBranchListByArea(comCodeVO.getComCode());
			for (BranchVO branchVO : branchListByArea) {
				List<LaundryOrderVO> orderListByBranchCode = laundryOrderDAO
						.selectCompletedLaundryOrderListByBranchCode(branchVO.getBranchCode());
				List<EmployeesVO> deliveryDepartmentEmployees = employeesDAO
						.selectDeliveryDepartmentEmployeesByBranchCode(branchVO.getBranchCode());

				if (orderListByBranchCode.size() == 0)
					continue;
				if (deliveryDepartmentEmployees.size() == 0) {
					logger.info(branchVO.getBranchName() + "??? ??????????????? ????????????.");
					continue;
				}

				int numberOfEmployees = deliveryDepartmentEmployees.size();
				int numberOfOrder = orderListByBranchCode.size();

				int cnt = 0;

				int quantity = (int) ((double) numberOfOrder / numberOfEmployees);
				for (EmployeesVO employeesVO : deliveryDepartmentEmployees) {
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (int i = cnt + 0; i < cnt + quantity; i++) {
						orderVO = orderListByBranchCode.get(i);
						orderVO.setDeliveryEmployeeId(employeesVO.getEmployeeId());
						laundryOrderDAO.updateLaundryOrderDeliveryEmployeeId(orderVO);
						orderVO.setOrderStatus("07");
						laundryOrderDAO.updateLaundryOrderStatusByOrderNo(orderVO);
						// ????????????
						try {
							sensSms.sendSMS(orderVO.getContactNumber().trim(), "[Rundering]\n???????????? ????????? ???????????? ?????? ?????? 7??? ?????? ????????? ???????????????.");
						} catch (Exception e) {
							logger.warn("???????????? "+orderVO.getOrderNo()+" ???????????? ?????? ????????????");
						}

					}
					cnt += quantity;
					logger.info(branchVO.getBranchName() + "??? " + employeesVO.getEmployeeId() + " ???????????? ?????? ????????? "
							+ numberOfOrder + "??? ??? " + quantity + "??? ?????????");
				}
				if ((numberOfOrder - cnt) > 0) {
					LaundryOrderVO orderVO = new LaundryOrderVO();
					for (int i = cnt + 0; i < cnt + (numberOfOrder - cnt); i++) {
						orderVO = orderListByBranchCode.get(i);
						orderVO.setDeliveryEmployeeId(deliveryDepartmentEmployees.get(0).getEmployeeId());
						laundryOrderDAO.updateLaundryOrderDeliveryEmployeeId(orderVO);
						orderVO.setOrderStatus("07");
						laundryOrderDAO.updateLaundryOrderStatusByOrderNo(orderVO);
					}
					logger.info(branchVO.getBranchName() + "??? " + deliveryDepartmentEmployees.get(0).getEmployeeId()
							+ " ???????????? " + (numberOfOrder - cnt) + "??? ?????? ?????????");
				}

			}
		}
	}
	
	//??????????????? ????????? ?????? ?????????????????? ???????????? ??????
	public Map<String,Object> assignLaundryOrderToBranchDeliveryEmployee(String branchCode) throws Exception{
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		int assignedOrderCnt = 0;
		int numberOfDeliveryEmployees = 0;
		
		BranchVO branchVO = branchDAO.getBranchByCode(branchCode);
		
		List<LaundryOrderVO> orderListByBranchCode = laundryOrderDAO.selectCompletedLaundryOrderListByBranchCode(branchCode);
		List<EmployeesVO> deliveryDepartmentEmployees = employeesDAO.selectDeliveryDepartmentEmployeesByBranchCode(branchCode);
		numberOfDeliveryEmployees = deliveryDepartmentEmployees.size();
		
		if (orderListByBranchCode.size() == 0) {
			dataMap.put("assignedOrderCnt",assignedOrderCnt);
			dataMap.put("numberOfDeliveryEmployees",numberOfDeliveryEmployees);
			return dataMap;
		}
		if (deliveryDepartmentEmployees.size() == 0) {
			dataMap.put("assignedOrderCnt",assignedOrderCnt);
			dataMap.put("numberOfDeliveryEmployees",numberOfDeliveryEmployees);
			return dataMap;
		}

		int numberOfEmployees = deliveryDepartmentEmployees.size();
		int numberOfOrder = orderListByBranchCode.size();

		int cnt = 0;

		int quantity = (int) ((double) numberOfOrder / numberOfEmployees);
		for (EmployeesVO employeesVO : deliveryDepartmentEmployees) {
			LaundryOrderVO orderVO = new LaundryOrderVO();
			for (int i = cnt + 0; i < cnt + quantity; i++) {
				orderVO = orderListByBranchCode.get(i);
				orderVO.setDeliveryEmployeeId(employeesVO.getEmployeeId());
				laundryOrderDAO.updateLaundryOrderDeliveryEmployeeId(orderVO);
				orderVO.setOrderStatus("07");
				laundryOrderDAO.updateLaundryOrderStatusByOrderNo(orderVO);
				assignedOrderCnt++;
				// ???????????? ????????????
				try {
					sensSms.sendSMS(orderVO.getContactNumber().trim(), "[Rundering]\n???????????? ????????? ???????????? ?????? ?????? 7??? ?????? ????????? ???????????????.");
				} catch (Exception e) {
					logger.warn("???????????? "+orderVO.getOrderNo()+" ???????????? ?????? ????????????");
				}

			}
			cnt += quantity;
			logger.info(branchVO.getBranchName() + "??? " + employeesVO.getEmployeeId() + " ???????????? ?????? ????????? "
					+ numberOfOrder + "??? ??? " + quantity + "??? ?????????");
		}
		if ((numberOfOrder - cnt) > 0) {
			LaundryOrderVO orderVO = new LaundryOrderVO();
			for (int i = cnt + 0; i < cnt + (numberOfOrder - cnt); i++) {
				orderVO = orderListByBranchCode.get(i);
				orderVO.setDeliveryEmployeeId(deliveryDepartmentEmployees.get(0).getEmployeeId());
				laundryOrderDAO.updateLaundryOrderDeliveryEmployeeId(orderVO);
				orderVO.setOrderStatus("07");
				laundryOrderDAO.updateLaundryOrderStatusByOrderNo(orderVO);
				assignedOrderCnt++;
			}
			logger.info(branchVO.getBranchName() + "??? " + deliveryDepartmentEmployees.get(0).getEmployeeId()
					+ " ???????????? " + (numberOfOrder - cnt) + "??? ?????? ?????????");
		}
		
		dataMap.put("assignedOrderCnt",assignedOrderCnt);
		dataMap.put("numberOfDeliveryEmployees",numberOfDeliveryEmployees);
		return dataMap;
	}

	public void autoOrder() throws Exception {
		List<BranchVO> branchList = branchDAO.selectBranchList();
		
		
		/* ??? : ????????? ?????? ?????? ????????? ?????? */
		Map<String, Integer> articlesPrice = new HashMap<String, Integer>();
		// ?????? ????????????
		

		List<LaundryArticlesVO> laundrArticlesList = laundryArticlesDAO.selectLandryArticlesStock();
		// ??????????????? ??????
		for (LaundryArticlesVO laundryArticles : laundrArticlesList) {

			articlesPrice.put(laundryArticles.getArticlesCode(), laundryArticles.getPrice());

		}
		for (BranchVO branch : branchList) {
			autoOrderMethod(branch.getBranchCode(),articlesPrice,laundryGoodsStockDAO,itemOrderDAO);
		}
	}
	
	public void autoOrderMethod(String branchCode,Map<String,Integer> articlesPrice,LaundryGoodsStockDAO laundryGoodsStockDAO, ItemOrderDAO itemOrderDAO) throws Exception {
		
		
		List<LaundryGoodsStockVO> goodList = laundryGoodsStockDAO.selectLaundryGoodsStockByBranchCode(branchCode);

		int sum = 0;
		for (LaundryGoodsStockVO laundryGoodsStock : goodList) {

			int supplyCount = laundryGoodsStock.getSupplyCount();
			int point = laundryGoodsStock.getAutoOrderPoint();
			Date autoLastDay = laundryGoodsStock.getAutoOrderLastDate();
			Date sysdate = new Date();

			// 14??? ??????
			if (supplyCount < point) {
				if ((sysdate.getTime() - autoLastDay.getTime()) / (1000 * 60 * 60 * 24) >= 14) {
					// ?????? * ??????
					sum += articlesPrice.get(laundryGoodsStock.getArticlesCode())
							* laundryGoodsStock.getAutoOrderCount();
					// ?????? ????????? ?????????
				}
			}

		}
		// SEQ ????????????
		
		// ?????? ??????
		if (sum > 0) {
			String seq = itemOrderDAO.seq();
			ItemOrderVO itemOrder = new ItemOrderVO();
			itemOrder.setBranchCode(branchCode);
			itemOrder.setOrdercode(seq);
			itemOrder.setItemOrderPaymentPrice(sum);
			itemOrderDAO.insertItemOrderByItmeOrder(itemOrder);

			// ?????? ?????? ??????
			int detailSeq = 1;

			for (LaundryGoodsStockVO laundryGoodsStock : goodList) {
				if(laundryGoodsStock.getBranchCode().equals("000000")) {
					continue;
				}
				
				int supplyCount = laundryGoodsStock.getSupplyCount();
				int point = laundryGoodsStock.getAutoOrderPoint();
				Date autoLastDay = laundryGoodsStock.getAutoOrderLastDate();
				Date sysdate = new Date();

				// 14??? ??????
				if (supplyCount < point) {
					if ((sysdate.getTime() - autoLastDay.getTime()) / (1000 * 60 * 60 * 24) >= 14) {
						ItemOrderDetailVO detail = new ItemOrderDetailVO();
						// ?????? ??????
						detail.setPrice(articlesPrice.get(laundryGoodsStock.getArticlesCode())
								* laundryGoodsStock.getAutoOrderCount());
						detail.setOrdercode(seq);
						detail.setArticlesCode(laundryGoodsStock.getArticlesCode());
						detail.setSeq(detailSeq);
						detail.setOrderCount(laundryGoodsStock.getAutoOrderCount());
						itemOrderDAO.insertItemOrderDetailByItmeOrderDetail(detail);
						// ??????????????????
						laundryGoodsStockDAO.updateLaundryGoodsStockLastDateAuto(laundryGoodsStock);

						detailSeq++;

					}
				}
			}
		}
	}

}
