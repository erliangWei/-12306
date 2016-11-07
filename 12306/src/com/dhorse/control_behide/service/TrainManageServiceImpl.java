package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.TrainManageDaoInter;
import com.dhorse.control_behide.po.StationPO;
import com.dhorse.control_behide.po.TrainPO;
import com.dhorse.control_behide.vo.StationManageVO;
import com.dhorse.control_behide.vo.TrainVO;

@Transactional
public class TrainManageServiceImpl implements TrainManageServiceInter {
	private TrainManageDaoInter tmdi;
	
	
	
	public void getStationList(List<StationManageVO> stationList) {
		// TODO Auto-generated method stub
		stationList.clear();
		for(StationPO po : tmdi.selectStationAll()){
			StationManageVO vo = new StationManageVO();
			vo.setStationId( po.getStationId());
			vo.setStationName(po.getStationName());
			stationList.add(vo);
		}
		
	}

	/*修改列车*/
	public void updateTrain(TrainVO tVO) {
		// TODO Auto-generated method stub
		tmdi.updateTrain(VOturnPO(tVO));
	}

	/*删除列车*/
	public void delectTrain(String id) {
		// TODO Auto-generated method stub
		tmdi.deleteTrain(id);
	}
	

	public void getQueryStationList(List<StationManageVO> stationList, String station) {
		// TODO Auto-generated method stub
		stationList.clear();
		for(StationPO po : tmdi.selectStation(station)){
			StationManageVO vo = new StationManageVO();
			vo.setStationId( po.getStationId());
			vo.setStationName(po.getStationName());
			stationList.add(vo);
		}
	}

	/*获取列车总记录*/
	public int getRecords() {
		// TODO Auto-generated method stub
		return tmdi.selectTrainCount();
	}
	
	/*添加列车*/
	public void addTrain(TrainVO tVO) {
		// TODO Auto-generated method stub
		tmdi.insertTrain(VOturnPO(tVO));
	}
	

	/* 获取列车列表 */
	public void getTrainList(List<TrainVO> trainList, int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		trainList.clear();
		for (TrainPO po : tmdi.selectAll(nowPage,pageRecords)) {
			trainList.add(POturnVO(po));
		}
	}
	public TrainPO VOturnPO(TrainVO tVO){
		TrainPO po = new TrainPO();
//		po.setTrainId(tVO.getTrainId());
		po.setEndStation(tVO.getEndStation());
		po.setEndTime(tVO.getEndTime());
		po.setStandTicketNum(tVO.getStandTicketNum());
		po.setStartTime(tVO.getStartTime());
		po.setStatrStation(tVO.getStatrStation());
		po.setTotalDistance(tVO.getTotalDistance());
		po.setTotalTime(tVO.getTotalTime());
		po.setTrainBody(tVO.getTrainBody());
		po.setTrainType(tVO.getTrainType());
		po.setTrainCode(tVO.getTrainCode());
		return po;
	}
	
	public TrainVO POturnVO(TrainPO po){
		TrainVO vo = new TrainVO();
//		vo.setTrainId(po.getTrainId());
		vo.setEndStation(po.getEndStation());
		vo.setEndTime(po.getEndTime());
		vo.setStandTicketNum(po.getStandTicketNum());
		vo.setStartTime(po.getStartTime());
		vo.setStatrStation(po.getStatrStation());
		vo.setTotalDistance(po.getTotalDistance());
		vo.setTotalTime(po.getTotalTime());
		vo.setTrainBody(po.getTrainBody());
		vo.setTrainType(po.getTrainType());
		vo.setTrainCode(po.getTrainCode());
		return vo;
	}

	public TrainManageDaoInter getTmdi() {
		return tmdi;
	}
	public void setTmdi(TrainManageDaoInter tmdi) {
		this.tmdi = tmdi;
	}
	

}
