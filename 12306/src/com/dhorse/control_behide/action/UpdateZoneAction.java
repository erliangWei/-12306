package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.ZoneManageServiceInter;
import com.dhorse.control_behide.vo.ZoneManageVO;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateZoneAction implements ModelDriven<ZoneManageVO>{
	private ZoneManageVO zVO;
	private ZoneManageServiceInter zmsi;
	
	public void updateZone(){
		zmsi.updateZone(zVO);
	}
	
	
	public ZoneManageVO getModel() {
		// TODO Auto-generated method stub
		return zVO;
	}
	public ZoneManageVO getzVO() {
		return zVO;
	}
	public void setzVO(ZoneManageVO zVO) {
		this.zVO = zVO;
	}
	public ZoneManageServiceInter getZmsi() {
		return zmsi;
	}
	public void setZmsi(ZoneManageServiceInter zmsi) {
		this.zmsi = zmsi;
	}

}
