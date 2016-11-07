package com.dhorse.control_behide.action;

import java.util.List;

import com.dhorse.control_behide.service.StationManagerServiceImpl;
import com.dhorse.control_behide.service.TrainManageServiceInter;
import com.dhorse.control_behide.vo.StationManageVO;
import com.dhorse.control_behide.vo.TrainVO;
import com.opensymphony.xwork2.ModelDriven;

public class AddTrainAction implements ModelDriven<TrainVO> {
	private TrainVO tVO;
	private List<StationManageVO> stationList; 
	private TrainManageServiceInter tmsi;
	private String station;
	
	public void addTrain(){
		//for(int i = 0 ; i < 30 ; i++)
		tmsi.addTrain(tVO);
	}
	
	public String stationList(){
		tmsi.getStationList(stationList);
		return "station";
	}
	
	public String queryStationList(){
		tmsi.getQueryStationList(stationList,station);
		return "queryStation";
	}
	
	
	
	
	public List<StationManageVO> getStationList() {
		return stationList;
	}
	public void setStationList(List<StationManageVO> stationList) {
		this.stationList = stationList;
	}
	public TrainVO gettVO() {
		return tVO;
	}
	public void settVO(TrainVO tVO) {
		this.tVO = tVO;
	}
	public TrainManageServiceInter getTmsi() {
		return tmsi;
	}
	public void setTmsi(TrainManageServiceInter tmsi) {
		this.tmsi = tmsi;
	}
	public TrainVO getModel() {
		// TODO Auto-generated method stub
		return tVO;
	}

	public String getStation() {
		return station;
	}

	public void setStation(String station) {
		this.station = station;
	}	

	
	
	
	
	
}
