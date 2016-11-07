package com.dhorse.control_behide.action;

import java.util.List;

import com.dhorse.control_behide.service.StationManagerServiceInter;
import com.dhorse.control_behide.vo.StationDeptListVO;
public class GetStationDeptAction{
	private List<StationDeptListVO> deptList;
	private StationManagerServiceInter smsi;
	public List<StationDeptListVO> getDeptList() {
		return deptList;
	}
	public void setDeptList(List<StationDeptListVO> deptList) {
		this.deptList = deptList;
	}
	public StationManagerServiceInter getSmsi() {
		return smsi;
	}
	public void setSmsi(StationManagerServiceInter smsi) {
		this.smsi = smsi;
	}
	public String stationDeptList(){
		smsi.getStationDeptList(deptList);
		return "dept";
	}
	
}
