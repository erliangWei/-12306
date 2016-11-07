package com.dhorse.control_behide.vo;

public class TrainVO {
	private Integer trainId;
	private String statrStation;
	private String endStation;
	private String startTime;
	private String endTime;
	private String totalTime;
	private double totalDistance;
	private Integer standTicketNum;
	private String trainCode;
	private String trainBody;
	private String trainType;


	
	public Integer getTrainId() {
		return trainId;
	}
	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}
	public String getTrainCode() {
		return trainCode;
	}
	public void setTrainCode(String trainCode) {
		this.trainCode = trainCode;
	}
	public void setStandTicketNum(Integer standTicketNum) {
		this.standTicketNum = standTicketNum;
	}
	public String getStatrStation() {
		return statrStation;  
	}
	public void setStatrStation(String statrStation) {
		this.statrStation = statrStation;
	}
	public String getEndStation() {
		return endStation;
	}
	public void setEndStation(String endStation) {
		this.endStation = endStation;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}
	public double getTotalDistance() {
		return totalDistance;
	}
	public void setTotalDistance(double totalDistance) {
		this.totalDistance = totalDistance;
	}
	public int getStandTicketNum() {
		return standTicketNum;
	}
	public void setStandTicketNum(int standTicketNum) {
		this.standTicketNum = standTicketNum;
	}
	public String getTrainBody() {
		return trainBody;
	}
	public void setTrainBody(String trainBody) {
		this.trainBody = trainBody;
	}
	public String getTrainType() {
		return trainType;
	}
	public void setTrainType(String trainType) {
		this.trainType = trainType;
	}

}



