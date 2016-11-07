package com.dhorse.control_behide.action;

import com.dhorse.control_behide.service.RouteManageServiceInter;
import com.dhorse.control_behide.vo.RouteVO;
import com.opensymphony.xwork2.ModelDriven;

public class UpdateRouteAction implements ModelDriven<RouteVO>{
	private RouteManageServiceInter rmsi;
	private RouteVO rVO;
	
	public void updateRoute(){
		System.out.println(rVO);
		rmsi.updateRoute(rVO);
	}
	
	
	
	public RouteManageServiceInter getRmsi() {
		return rmsi;
	}
	public void setRmsi(RouteManageServiceInter rmsi) {
		this.rmsi = rmsi;
	}
	public RouteVO getrVO() {
		return rVO;
	}
	public void setrVO(RouteVO rVO) {
		this.rVO = rVO;
	}
	public RouteVO getModel() {
		// TODO Auto-generated method stub
		return rVO;
	}
	

}
