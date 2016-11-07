package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.ProCapitalPO;
import com.dhorse.control_behide.po.StationDeptPO;
import com.dhorse.control_behide.po.StationPO;

public interface StationManagerDAOInter {

	public List<StationPO> selectStationAll(int nowPage,int pageRecords) throws Exception;

	public void insertStaion(StationPO spo);

	public List<StationDeptPO> selectStationDeptAll();

	public List<ProCapitalPO> selectProCapitalAll();

	public void deleteStation(int statioId);

	public void updateStation(StationPO po);

	public int selectStationCount();

	
}
