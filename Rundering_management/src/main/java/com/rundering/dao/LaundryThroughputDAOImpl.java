package com.rundering.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.rundering.dto.LaundryThroughPutVO;

public class LaundryThroughputDAOImpl implements LaundryThroughputDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<LaundryThroughPutVO> throughputList() throws Exception {
		
		List<LaundryThroughPutVO> throughputList = session.selectList("LaundryThroughput-Mapper.laundryQuotaList");
		
		return throughputList;
	}

	@Override
	public LaundryThroughPutVO selectLaundryQuatoByThroughputNo(String throughputNo) throws Exception {
		
		LaundryThroughPutVO throughput = session.selectOne("LaundryThroughput-Mapper.laundryQuotaDetail", throughputNo);
		
		return throughput;
	}
	
}
