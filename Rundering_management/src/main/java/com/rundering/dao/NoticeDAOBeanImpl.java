package com.rundering.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.jsp.command.Criteria;
import com.rundering.dto.NoticeVO;


public class NoticeDAOBeanImpl implements NoticeDAOBean {

	private SqlSession session;
	
	
	public void setSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<NoticeVO> selectSearchNoticeList(Criteria cri) throws SQLException {
		int startRow=cri.getStartRowNum();
		int endRow=cri.getPerPageNum();		
		
		
		  Map<String,Object> dataParam = new HashMap<String,Object>();
		  dataParam.put("startRow", startRow); dataParam.put("endRow", endRow);
		  dataParam.put("searchType",cri.getSearchType()); dataParam.put("keyword",
		  cri.getKeyword());
		
		
		List<NoticeVO> noticeList=
				session.selectList("Notice-Mapper.selectSearchNoticeList",cri);
		
		return noticeList;
	}

	@Override
	public int selectSearchNoticeListCount(Criteria cri) throws SQLException {
		int count=session.selectOne("Notice-Mapper.selectSearchNoticeListCount",cri);
		return count;
	}

	@Override
	public NoticeVO selectNoticeByNno(int nno) throws SQLException {
		NoticeVO notice=session.selectOne("Notice-Mapper.selectNoticeByNno",nno);
		return notice;
	}

	@Override
	public void increaseViewCount(int nno) throws SQLException {
		session.update("Notice-Mapper.increaseViewCount",nno);
		
	}

	@Override
	public int selectNoticeSequenceNextValue() throws SQLException {
		int seq_num=session.selectOne("Notice-Mapper.selectNoticeSequenceNextValue");
		return seq_num;
	}

	@Override
	public void insertNotice(NoticeVO notice) throws SQLException {
		System.out.println("dao:"+notice);
		session.update("Notice-Mapper.insertNotice",notice);
		
	}
	
	@Override
	public void updateNotice(NoticeVO notice) throws SQLException {
		session.update("Notice-Mapper.updateNotice",notice);
	}

	@Override
	public void deleteNotice(int nno) throws SQLException {
		session.update("Notice-Mapper.deleteNotice",nno);
	}
	
	@Override
	public NoticeVO selectNoticeByImage(String imageFile) throws SQLException {
		NoticeVO notice 
			= session.selectOne("Notice-Mapper.selectNoticeByImage",imageFile);
		return notice;
	}


}
