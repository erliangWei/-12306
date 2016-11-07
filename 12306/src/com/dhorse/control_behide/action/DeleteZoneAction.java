package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.ZoneManageServiceInter;

public class DeleteZoneAction {
	private String delZoneId;
	private ZoneManageServiceInter zmsi;
	
	public void deleteZone(){
		String zoneId[] = delZoneId.split(",");  
		for (String id : zoneId) 
		{
			zmsi.deleteCoach(Integer.parseInt(id));
		}
	}
	
	
	public String getDelZoneId() {
		return delZoneId;
	}
	public void setDelZoneId(String delZoneId) {
		this.delZoneId = delZoneId;
	}
	public ZoneManageServiceInter getZmsi() {
		return zmsi;
	}
	public void setZmsi(ZoneManageServiceInter zmsi) {
		this.zmsi = zmsi;
	}
}
