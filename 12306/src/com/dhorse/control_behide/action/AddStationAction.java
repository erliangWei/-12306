package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.StationManagerServiceInter;
import com.dhorse.control_behide.vo.AddStationVO;
import com.opensymphony.xwork2.ModelDriven;

public class AddStationAction implements ModelDriven<AddStationVO>{
	private AddStationVO asVO ;	//获取添加车站对象
	private StationManagerServiceInter smsi;
	public AddStationVO getAsVO() {
		return asVO;
	}
	public void setAsVO(AddStationVO asVO) {
		this.asVO = asVO;
	}
	public StationManagerServiceInter getSmsi() {
		return smsi;
	}
	public void setSmsi(StationManagerServiceInter smsi) {
		this.smsi = smsi;
	}
	public void stationAddInfo(){			//添加车站
//		System.out.println(asVO);
//		System.out.println(asVO.getAddStationAddress());
//		System.out.println("9999"+asVO.getAddStationName());
		
//		for(int i = 0;i<200;i++)
			smsi.addStation(asVO);
	}
	public AddStationVO getModel() {
		// TODO Auto-generated method stub
		return asVO;
	}
}
