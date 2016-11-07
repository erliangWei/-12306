package com.dhorse.control_behide.po;

import java.util.HashSet;
import java.util.Set;

public class RouteStationPO {
	private String ID;
	private Set<RoutePO> routeID = new HashSet<RoutePO>();
	private Set<StationPO> stationID = new HashSet<StationPO>();
	private String startTime;
	private String endTime;
   private Integer sequence;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public Set<RoutePO> getRouteID() {
		return routeID;
	}
	public void setRouteID(Set<RoutePO> routeID) {
		this.routeID = routeID;
	}
	public Set<StationPO> getStationID() {
		return stationID;
	}
	public void setStationID(Set<StationPO> stationID) {
		this.stationID = stationID;
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
	public Integer getSequence() {
		return sequence;
	}
	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}
	

}
