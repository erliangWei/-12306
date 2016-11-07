package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.PassengerVO;

public interface PassengerManageServiceInter {

	void getPassengerList(List<PassengerVO> passengerList, String userId);

}
