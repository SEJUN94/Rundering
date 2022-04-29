package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.MyOrderCriteria;
import com.rundering.dto.FAQVO;

public class FAQDAOImpl implements FAQDAO {
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<FAQVO> selectSearchFAQList(MyOrderCriteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<FAQVO> faqList = session.selectList("FAQ-mapper.selectSearchFAQList", cri, rowBounds);
		return faqList;
	}

	@Override
	public int selectSearchFAQListCount(MyOrderCriteria cri) throws SQLException {
		return session.selectOne("FAQ-mapper.selectSearchFAQListCount", cri);
	}

	@Override
	public int selectFAQSequenceNextValue() throws SQLException {
		return session.selectOne("FAQ-mapper.selecFAQSequenceNextValue");
	}
	
	@Override
	public void insertFAQ(FAQVO FAQ) throws SQLException {
		session.update("FAQ-mapper.insertFAQ", FAQ);
	}
	
	@Override
	public FAQVO selectFAQByFaqno(int faqno) throws SQLException {
		return session.selectOne("FAQ-mapper.selectFAQByFaqno", faqno);
	}
	
	@Override
	public void updateFAQ(FAQVO FAQ) throws SQLException {
		session.update("FAQ-mapper.updateFAQ", FAQ);
	}
	
	@Override
	public void deleteFAQ(int faqno) throws SQLException {
		session.update("FAQ-mapper.deleteFAQ", faqno);
	}
	
	/* 아코디언 */	
	@Override
	public List<FAQVO> selectFrequentlyList(MyOrderCriteria cri) throws SQLException {
		
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<FAQVO> frequentlyList = session.selectList("FAQ-mapper.selectFrequentlyList", cri, rowBounds);
		return frequentlyList;
	}

	@Override
	public int selectFrequentlyListCount(MyOrderCriteria cri) throws SQLException {
		return session.selectOne("FAQ-mapper.selectFrequentlyListCount", cri);
	}

}
