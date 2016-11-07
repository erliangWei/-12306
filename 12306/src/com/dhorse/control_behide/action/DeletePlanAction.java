package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.PlanManageServiceInter;

public class DeletePlanAction {
	private String delPlanId;
	private PlanManageServiceInter pmsi;
	
	public void deletePlan(){
		for (String id : delPlanId.split(",")) {
			pmsi.deletePlan(id);
			
		}
	}
	
	
	public String getDelPlanId() {
		return delPlanId;
	}
	public void setDelPlanId(String delPlanId) {
		this.delPlanId = delPlanId;
	}
	public PlanManageServiceInter getPmsi() {
		return pmsi;
	}
	public void setPmsi(PlanManageServiceInter pmsi) {
		this.pmsi = pmsi;
	}
	

}
