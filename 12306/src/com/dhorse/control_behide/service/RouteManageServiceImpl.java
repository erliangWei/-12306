package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.RouteManageDAOInter;
import com.dhorse.control_behide.po.RoutePO;
import com.dhorse.control_behide.vo.RouteVO;
@Transactional
@Service("RouteManageServiceImpl")
public class RouteManageServiceImpl implements RouteManageServiceInter {
	private RouteManageDAOInter rmDAO;
	private List<RoutePO> rList;
	
	
	/********  修改路线  *********/
	public void updateRoute(RouteVO rVO) {
		// TODO Auto-generated method stub
		rmDAO.updateRoute(VOturnPO(rVO));
	}
	/***********  删除路线   **********/
	public void delectTrain(int parseInt) {
		// TODO Auto-generated method stub
		rmDAO.deleteRoute(parseInt);
	}
	/*******  添加路线  ******/
	public void addRoute(RouteVO rVO) {
		// TODO Auto-generated method stub
		rmDAO.insertRoute(VOturnPO(rVO));
	}
	public int getRecords() {
		// TODO Auto-generated method stub
		return rmDAO.getRecord();
	}
	
	/*****  获取路线列表  ******/
	public void getRouteList(List<RouteVO> routeList, int nowPage,
			int pageRecords) {
		// TODO Auto-generated method stub
		rList=rmDAO.selectAllRoute(nowPage,pageRecords);
		routeList.clear();
		for (RoutePO po : rList) {
			routeList.add(POturnVO(po));
		}
		
	}
	public RoutePO VOturnPO(RouteVO rVO){
		RoutePO po = new RoutePO();
		po.setRouteId(rVO.getRouteId());
		po.setArriveTime(rVO.getArriveTime());
		po.setLeaveTime(rVO.getLeaveTime());
		po.setStationAll(rVO.getStationAll());
		po.setTotalDistance(rVO.getTotalDistance());
		po.setTotalTime(rVO.getTotalTime());
		po.setTrainId(rVO.getTrainId());
//		System.out.println(po.getTrainId());
		return po;
	}
	public RouteVO POturnVO(RoutePO rPO){
		RouteVO vo= new RouteVO();
		vo.setArriveTime(rPO.getArriveTime());
		vo.setLeaveTime(rPO.getLeaveTime());
		vo.setRouteId(rPO.getRouteId());
		vo.setStationAll(rPO.getStationAll());
		vo.setTotalDistance(rPO.getTotalDistance());
		vo.setTotalTime(rPO.getTotalTime());
		vo.setTrainId(rPO.getTrainId());
		return vo;
		
	}
	public RouteManageDAOInter getRmDAO() {
		return rmDAO;
	}
	public void setRmDAO(RouteManageDAOInter rmDAO) {
		this.rmDAO = rmDAO;
	}


	
}
