package com.dhorse.control_behide.action;


import com.dhorse.control_behide.service.UserManageServiceInter;

public class DeleteUserAction {
	private String delUserId;
	private UserManageServiceInter umsi;
	public String getDelUserId() {
		return delUserId;
	}
	public void deleteUser(){
		for (String id : delUserId.split(",")) {
			umsi.deleteUser(Integer.parseInt(id));
		}
	}
	
	public void setDelUserId(String delUserId) {
		this.delUserId = delUserId;
	}
	public UserManageServiceInter getUmsi() {
		return umsi;
	}
	public void setUmsi(UserManageServiceInter umsi) {
		this.umsi = umsi;
	}
	
	
	

}
