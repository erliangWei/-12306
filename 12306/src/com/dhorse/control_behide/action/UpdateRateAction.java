package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.RateManageServiceInter;
import com.dhorse.control_behide.vo.RateManageVO;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateRateAction implements ModelDriven<RateManageVO>{
	private RateManageVO rVO;
	private RateManageServiceInter rmsi;
	
	public void updateRate(){
		rmsi.updateRate(rVO);
	}
	
	
	public RateManageVO getModel() {
		// TODO Auto-generated method stub
		return rVO;
	}
	public RateManageVO getrVO() {
		return rVO;
	}
	public void setrVO(RateManageVO rVO) {
		this.rVO = rVO;
	}
	public RateManageServiceInter getRmsi() {
		return rmsi;
	}
	public void setRmsi(RateManageServiceInter rmsi) {
		this.rmsi = rmsi;
	}
	

}
