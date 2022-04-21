package com.rundering.dao;
​
import org.apache.ibatis.session.SqlSession;
​
import com.rundering.dto.MemberAddressVO;
​
public class MemberAddressDAOImpl implements MemberAddressDAO {
	
	private SqlSession session;
​
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public void addRegist(MemberAddressVO memberAdd) throws Exception {
		session.update("MemberAddress-Mapper.addRegist",memberAdd);
​
	}
​
}