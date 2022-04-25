package com.rundering.service;

import java.sql.SQLException;
import java.util.Map;

import com.rundering.customer.Criteria;

public interface FAQService {

	public Map<String, Object> getFAQList(Criteria cri) throws SQLException;
	
}
