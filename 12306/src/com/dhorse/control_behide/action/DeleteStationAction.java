package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.StationManagerServiceInter;


public class DeleteStationAction{
	private String delStatioId;
	private StationManagerServiceInter smsi;
	public String getDelStatioId() {
		return delStatioId;
	}
	public void setDelStatioId(String delStatioId) {
		this.delStatioId = delStatioId;
	}
	public StationManagerServiceInter getSmsi() {
		return smsi;
	}
	public void setSmsi(StationManagerServiceInter smsi) {
		this.smsi = smsi;
	}
	public void delectStation(){
		String stationId[] = delStatioId.split(",");  
		for(int i=0;i<stationId.length;i++)
		{	
			smsi.delectStation(Integer.parseInt(stationId[i]));
		}
	}
}
