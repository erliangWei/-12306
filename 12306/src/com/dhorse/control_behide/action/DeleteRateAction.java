package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.RateManageServiceInter;

public class DeleteRateAction {
	private String delRateId;
	private RateManageServiceInter rmsi;
	
	public void deleteRate(){
		for (String id : delRateId.split(",")) {
			System.out.println(id);
			rmsi.deleteRate(Integer.parseInt(id));
			
		}
	}
	
	
	public String getDelRateId() {
		return delRateId;
	}
	public void setDelRateId(String delRateId) {
		this.delRateId = delRateId;
	}
	public RateManageServiceInter getRmsi() {
		return rmsi;
	}
	public void setRmsi(RateManageServiceInter rmsi) {
		this.rmsi = rmsi;
	}
	

}
