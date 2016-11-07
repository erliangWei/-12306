package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.RouteManageServiceInter;
import com.dhorse.control_behide.vo.RouteVO;
import com.opensymphony.xwork2.ModelDriven;

public class AddRouteAction implements ModelDriven<RouteVO> {
	private RouteVO rVO;
	private RouteManageServiceInter rmsi;	
	public void addRoute(){
//		System.out.println(rVO.getTrainId());
//		System.out.println(rVO);
//		for(int i = 0 ; i < 30 ; i++)
			rmsi.addRoute(rVO);
	}
	public RouteVO getrVO() {
		return rVO;
	}
	public void setrVO(RouteVO rVO) {
		this.rVO = rVO;
	}
	public RouteManageServiceInter getRmsi() {
		return rmsi;
	}
	public void setRmsi(RouteManageServiceInter rmsi) {
		this.rmsi = rmsi;
	}
	public RouteVO getModel() {
		// TODO Auto-generated method stub
		return rVO;
	}
}
