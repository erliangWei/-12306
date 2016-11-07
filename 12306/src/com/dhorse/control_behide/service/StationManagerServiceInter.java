package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.AddStationVO;
import com.dhorse.control_behide.vo.ProCapitalVO;
import com.dhorse.control_behide.vo.StationDeptListVO;
import com.dhorse.control_behide.vo.StationManageVO;
import com.dhorse.control_behide.vo.UpdateStationVO;

public interface StationManagerServiceInter {
//	public void getStationList(List<StationManageVO> stationList, int nowPage,int pageRecords);
	public void getStationList(List<StationManageVO> stationList, int nowPage,int pageRecords);

	public void addStation(AddStationVO asVO);

	public void getStationDeptList(List<StationDeptListVO> sdVO);

	public void getProCapitalList(List<ProCapitalVO> proCapicalList);

	public void delectStation(int stationId);

	public void updateStation(UpdateStationVO vo);

	public int getRecords();




}
