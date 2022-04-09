package com.rundering.service;

import com.rundering.dao.TestDAOBean;
import com.rundering.dto.TestVO;

public class TestServiceImpl implements TestService {
	
	TestDAOBean testDAOBean;
	
	public void setTestDAOBean(TestDAOBean testDAOBean) {
		this.testDAOBean = testDAOBean;
	}
	
	@Override
	public TestVO getTest(String id) throws Exception {
		return testDAOBean.selectTestById(id);
	}

}
