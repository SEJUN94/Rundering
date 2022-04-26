package com.rundering.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.rundering.command.CustomerListCriteria;
import com.rundering.command.CustomerListPageMaker;
import com.rundering.dao.AsRequestDAO;
import com.rundering.dto.AsRequestVO;

public class AsRequestServiceImpl implements AsRequestService {

	private AsRequestDAO asRequestDAO;

	public void setAsRequestDAO(AsRequestDAO asRequestDAO) {
		this.asRequestDAO = asRequestDAO;
	}

	@Override
	public Map<String, Object> getAsRequestList(CustomerListCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		// 현재 page 번호에 맞게 리스트를 가져오기
		List<AsRequestVO> asRequestList = asRequestDAO.selectSearchAsRequestList(cri);

		// 전체 board 개수
		int totalCount = asRequestDAO.selectSearchAsRequestListCount(cri);

		// PageMaker 생성.
		CustomerListPageMaker pageMaker = new CustomerListPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("asRequestList", asRequestList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

//	@Override
//	public AsRequestVO getAsRequest(int asno) throws SQLException {
//		asRequestDAO.checkAsRequest(asno);
//		
//		AsRequestVO asRequest = asRequestDAO.selectAsRequestByAsno(asno);
//		return asRequest;
//	}

	@Override
	public AsRequestVO getCheck(int asno) throws SQLException {
		asRequestDAO.checkAsRequest(asno);

		AsRequestVO asRequest = asRequestDAO.selectAsRequestByAsno(asno);
		return asRequest;
	}

	@Override
	public AsRequestVO getAsRequestModify(int asno) throws SQLException {
		AsRequestVO asRequest = asRequestDAO.selectAsRequestByAsno(asno);
		return asRequest;
	}

	@Override
	public void regist(AsRequestVO asRequest) throws SQLException {
		asRequestDAO.insertAsRequest(asRequest);
	}

	@Override
	public void getItemList(AsRequestVO asRequest) throws SQLException {
		asRequestDAO.selectItemList(asRequest);
		
	}

	@Override
	public void modify(AsRequestVO asRequest) throws SQLException {
		asRequestDAO.updateAsRequest(asRequest);
	}

	@Override
	public void remove(int asno) throws SQLException {
		asRequestDAO.deleteAsRequest(asno);
	}


}
