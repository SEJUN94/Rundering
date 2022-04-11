package com.rundering.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.catalina.Session;

import com.jsp.command.Criteria;
import com.rundering.dto.ArticlesLaundryVO;

public interface OrderGoodsDAO {
	List<ArticlesLaundryVO> orderGoods(Session session, Criteria cri) throws SQLException;
}
