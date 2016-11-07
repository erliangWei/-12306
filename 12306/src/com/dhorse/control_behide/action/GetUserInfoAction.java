package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.UserManageServiceInter;
import com.dhorse.control_behide.vo.UserVO;

public class GetUserInfoAction {
	private UserVO userInfo;
	private int userId;
	private UserManageServiceInter umsi;
	public String getUserInfoById(){
		userInfo = umsi.getUserInfo(userId);
		return "user";
	}
	
	
	
	public UserManageServiceInter getUmsi() {
		return umsi;
	}
	public void setUmsi(UserManageServiceInter umsi) {
		this.umsi = umsi;
	}
	public UserVO getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(UserVO userInfo) {
		this.userInfo = userInfo;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}

}
