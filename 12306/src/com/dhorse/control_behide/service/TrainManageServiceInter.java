package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.StationManageVO;
import com.dhorse.control_behide.vo.TrainVO;

public interface TrainManageServiceInter {

	void getTrainList(List<TrainVO> trainList, int nowPage, int pageRecords);

	void addTrain(TrainVO tVO);

	int getRecords();

	void delectTrain(String id);

	void updateTrain(TrainVO tVO);

	void getStationList(List<StationManageVO> stationList);

	void getQueryStationList(List<StationManageVO> stationList, String station);

}
