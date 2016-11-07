package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.StationManagerServiceInter;
import com.dhorse.control_behide.vo.UpdateStationVO;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateStationAction implements ModelDriven<UpdateStationVO>{
	private UpdateStationVO usVO;
	private StationManagerServiceInter smsi;
	public void updateStation(){
//		System.out.println(usVO.getUdateStationId());
//		System.out.println(usVO.getUpdateStationName());
//		System.out.println(usVO.getUpdateStationDept());
//		System.out.println(usVO.getUpdateStationNamePY());
//		System.out.println(usVO.getUpdateStationProvinceDept());
//		System.out.println(usVO.getUpdateStationLevel());
//		System.out.println(usVO.getUpdateAddress());
		smsi.updateStation(usVO);
	}

	public StationManagerServiceInter getSmsi() {
		return smsi;
	}

	public void setSmsi(StationManagerServiceInter smsi) {
		this.smsi = smsi;
	}

	public UpdateStationVO getUsVO() {
		return usVO;
	}

	public void setUsVO(UpdateStationVO usVO) {
		this.usVO = usVO;
	}
	
	public UpdateStationVO getModel() {
		// TODO Auto-generated method stub
		return usVO;
	}
}
