package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.TrainManageServiceInter;
import com.dhorse.control_behide.vo.TrainVO;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateTrainAction implements ModelDriven<TrainVO> {
	private TrainVO tVO;
	private TrainManageServiceInter tmsi;
	public void updateTrain(){
//		System.out.println(tVO);
//		System.out.println(tVO.getEndTime());
//		System.out.println(tVO.getStandTicketNum());
//		System.out.println(tVO.getTrainBody());
//		System.out.println(tVO.getTrainType());
//		System.out.println(tVO.getEndStation());
//		System.out.println(tVO.getTrainId());
		tmsi.updateTrain(tVO);
	}
	public TrainVO gettVO() {
		return tVO;
	}
	public void settVO(TrainVO tVO) {
		this.tVO = tVO;
	}
	public TrainManageServiceInter getTmsi() {
		return tmsi;
	}
	public void setTmsi(TrainManageServiceInter tmsi) {
		this.tmsi = tmsi;
	}
	public TrainVO getModel() {
		// TODO Auto-generated method stub
		return tVO;
	}

}
