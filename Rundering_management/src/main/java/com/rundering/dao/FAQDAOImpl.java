package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.rundering.command.Criteria;
import com.rundering.dto.FAQVO;

public class FAQDAOImpl implements FAQDAO {
	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<FAQVO> selectSearchFAQList(Criteria cri) throws SQLException {

		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<FAQVO> faqList = session.selectList("FAQ-mapper.selectSearchFAQList", cri, rowBounds);
		return faqList;
	}

	@Override
	public int selectSearchFAQListCount(Criteria cri) throws SQLException {
		return session.selectOne("FAQ-mapper.selectSearchFAQListCount", cri);
	}

	@Override
	public int selectFAQSequenceNextValue() throws SQLException {
		return session.selectOne("FAQ-mapper.selecFAQSequenceNextValue");
	}
	
	@Override
	public FAQVO selectFAQByFaqno(int faqno) throws SQLException {
		return session.selectOne("FAQ-mapper.selectFAQByFaqno", faqno);
	}
	
	@Override
	public void replyFAQ(FAQVO FAQ) throws SQLException {
		session.update("FAQ-mapper.replyFAQ", FAQ);
	}
	
	/* 아코디언 */	
	@Override
	public List<FAQVO> selectFrequentlyList(Criteria cri) throws SQLException {

		List<FAQVO> frequentlyList = session.selectList("FAQ-mapper.selectFrequentlyList", cri);
		return frequentlyList;
	}

	@Override
	public void updateFrequently(FAQVO FAQ) throws SQLException {
		session.update("FAQ-mapper.updateFrequently", FAQ);
	}	
	
	@Override
	public void deleteFrequently(int faqno) throws SQLException {
		session.update("FAQ-mapper.deleteFrequently", faqno);
	}

}
