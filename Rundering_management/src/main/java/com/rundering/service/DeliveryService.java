package com.rundering.service;

import java.util.Map;

import com.rundering.command.Criteria;

public interface DeliveryService {
	
	Map<String, Object> getDeliveryList(Criteria cri) throws Exception;
}
