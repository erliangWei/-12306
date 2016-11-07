package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.PassengerPO;

public interface PassengeManageDAOInter {

	List<PassengerPO> selectPassengerAll(String userId);
	
}
