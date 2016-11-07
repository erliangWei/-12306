package com.dhorse.control_behide.vo;

public class PlanVO {
	private String planId;
	private String trainId;
	private Integer coachNO;
	private String startStation;
	private String endStation;
	private String publishTime;
	private String implementTime;
	public String getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(String publishTime) {
		this.publishTime = publishTime;
	}
	public String getImplementTime() {
		return implementTime;
	}
	public void setImplementTime(String implementTime) {
		this.implementTime = implementTime;
	}
	public String getPlanId() {
		return planId;
	}
	public void setPlanId(String planId) {
		this.planId = planId;
	}
	public String getTrainId() {
		return trainId;
	}
	public void setTrainId(String trainId) {
		this.trainId = trainId;
	}
	public Integer getCoachNO() {
		return coachNO;
	}
	public void setCoachNO(Integer coachNO) {
		this.coachNO = coachNO;
	}
	public String getStartStation() {
		return startStation;
	}
	public void setStartStation(String startStation) {
		this.startStation = startStation;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	

}
