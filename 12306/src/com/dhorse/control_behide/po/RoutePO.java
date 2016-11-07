package com.dhorse.control_behide.po;

public class RoutePO {
	private String routeId;
	private String trainId;
	private String stationAll;
	private String leaveTime;
	private String arriveTime;
	private double totalDistance;
	private String totalTime;
	
	public String getRouteId() {
		return routeId;
	}
	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}
	public void setTrainId(String trainId) {
		this.trainId = trainId;
	}

	public String getTrainId() {
		return trainId;
	}
	public String getStationAll() {
		return stationAll;
	}
	public void setStationAll(String stationAll) {
		this.stationAll = stationAll;
	}
	public String getLeaveTime() {
		return leaveTime;
	}
	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}
	public String getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}
	public double getTotalDistance() {
		return totalDistance;
	}
	public void setTotalDistance(double totalDistance) {
		this.totalDistance = totalDistance;
	}
	public String getTotalTime() {
		return totalTime;
	}
	public void setTotalTime(String totalTime) {
		this.totalTime = totalTime;
	}

}
