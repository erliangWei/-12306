package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.RouteManageServiceInter;

public class DeleteRouteAction {
	private String delRouteId;
	private RouteManageServiceInter rmsi;
	
	public void deleteRoute(){
		String routeId[] = delRouteId.split(",");  
		for(int i=0;i<routeId.length;i++)
		{	
			rmsi.delectTrain(Integer.parseInt(routeId[i]));
		}
	}

	public String getDelRouteId() {
		return delRouteId;
	}

	public void setDelRouteId(String delRouteId) {
		this.delRouteId = delRouteId;
	}

	public RouteManageServiceInter getRmsi() {
		return rmsi;
	}

	public void setRmsi(RouteManageServiceInter rmsi) {
		this.rmsi = rmsi;
	}
	
}
