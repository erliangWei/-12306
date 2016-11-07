package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.PlanManageServiceInter;
import com.dhorse.control_behide.vo.PlanVO;
import com.opensymphony.xwork2.ModelDriven;

public class UpdatePlanAction implements ModelDriven<PlanVO>{
	private PlanVO pVO;
	private PlanManageServiceInter pmsi;
	
	public void updatePlan(){
		pmsi.updatePlan(pVO);
	}
	
	
	
	public PlanVO getpVO() {
		return pVO;
	}
	public void setpVO(PlanVO pVO) {
		this.pVO = pVO;
	}
	public PlanManageServiceInter getPmsi() {
		return pmsi;
	}
	public void setPmsi(PlanManageServiceInter pmsi) {
		this.pmsi = pmsi;
	}
	public PlanVO getModel() {
		// TODO Auto-generated method stub
		return pVO;
	}
	
	

}
