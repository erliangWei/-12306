package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.CoachManageServiceInter;

public class DeleteCoachAction {
	private String delCoachId;
	private CoachManageServiceInter cmsi;
	
	public void deleteCoach(){
		String routeId[] = delCoachId.split(",");  
		for(int i=0;i<routeId.length;i++)
		{	
			cmsi.deleteCoach(Integer.parseInt(routeId[i]));
		}
	}
	
	
	public String getDelCoachId() {
		return delCoachId;
	}
	public void setDelCoachId(String delCoachId) {
		this.delCoachId = delCoachId;
	}
	public CoachManageServiceInter getCmsi() {
		return cmsi;
	}
	public void setCmsi(CoachManageServiceInter cmsi) {
		this.cmsi = cmsi;
	}
	
	

}
