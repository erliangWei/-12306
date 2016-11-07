package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.CoachManageServiceInter;
import com.dhorse.control_behide.vo.CoachManageVO;
import com.opensymphony.xwork2.ModelDriven;

public class AddCoachAction implements ModelDriven<CoachManageVO> {
	private CoachManageVO cmVO;
	private CoachManageServiceInter cmsi;
	
	public void addCoach(){
//		System.out.println(cmVO.getCoachTrainId());
		//for(int i = 0;i<30;i++)
		cmsi.addCoach(cmVO);
	}
	
	
	public CoachManageVO getCmVO() {
		return cmVO;
	}
	public void setCmVO(CoachManageVO cmVO) {
		this.cmVO = cmVO;
	}
	public CoachManageServiceInter getCmsi() {
		return cmsi;
	}
	public void setCmsi(CoachManageServiceInter cmsi) {
		this.cmsi = cmsi;
	}
	public CoachManageVO getModel() {
		// TODO Auto-generated method stub
		return cmVO;
	}
	

}
