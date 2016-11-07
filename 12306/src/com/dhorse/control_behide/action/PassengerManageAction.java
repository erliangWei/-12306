package com.dhorse.control_behide.action;

import java.util.List;

import com.dhorse.control_behide.service.PassengerManageServiceInter;
import com.dhorse.control_behide.service.UserManageServiceInter;
import com.dhorse.control_behide.vo.PassengerVO;

public class PassengerManageAction {
	private List<PassengerVO> passengerList;
	private PassengerManageServiceInter pmsi;
	private String userId;
	
	public String passengerList(){
//		pmsi.getPassengerList(userId);
		pmsi.getPassengerList(passengerList,userId);
		return "passenger";
	}
	
	
	public List<PassengerVO> getPassengerList() {
		return passengerList;
	}
	public void setPassengerList(List<PassengerVO> passengerList) {
		this.passengerList = passengerList;
	}
	public PassengerManageServiceInter getPmsi() {
		return pmsi;
	}
	public void setPmsi(PassengerManageServiceInter pmsi) {
		this.pmsi = pmsi;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	

}
