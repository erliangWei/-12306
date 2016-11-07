package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.StationPO;
import com.dhorse.control_behide.po.TrainPO;

public interface TrainManageDaoInter {

	List<TrainPO> selectAll(int nowPage, int pageRecords);

	void insertTrain(TrainPO po);

	int selectTrainCount();

	void deleteTrain(String id);

	void updateTrain(TrainPO po);

	List<StationPO> selectStationAll();

	List<StationPO> selectStation(String station);

}
