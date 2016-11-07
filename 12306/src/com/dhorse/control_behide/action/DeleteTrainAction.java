package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.TrainManageServiceInter;

public class DeleteTrainAction {
	private String delTrainId;
	private TrainManageServiceInter tmsi;
	public String getDelTrainId() {
		return delTrainId;
	}
	public void setDelTrainId(String delTrainId) {
		this.delTrainId = delTrainId;
	}
	public TrainManageServiceInter getTmsi() {
		return tmsi;
	}
	public void setTmsi(TrainManageServiceInter tmsi) {
		this.tmsi = tmsi;
	}
	public void deleteTrain(){
		for(String id : delTrainId.split(","))
		{
			tmsi.delectTrain(id);
		}
	}
}
