package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.PlanManageDAOInter;
import com.dhorse.control_behide.po.PlanPO;
import com.dhorse.control_behide.vo.PlanVO;
@Transactional
public class PlanManageServiceImpl implements PlanManageServiceInter {
	private PlanManageDAOInter pmDAOi;

	public PlanManageDAOInter getPmDAOi() {
		return pmDAOi;
	}

	public void setPmDAOi(PlanManageDAOInter pmDAOi) {
		this.pmDAOi = pmDAOi;
	}
	
	public void deletePlan(String id) {
		// TODO Auto-generated method stub
		pmDAOi.deletePlan(id);
	}

	public void updatePlan(PlanVO pVO) {
		// TODO Auto-generated method stub
		pmDAOi.updatePlan(VOturnPO(pVO));
		
	}

	public int getRecords() {
		// TODO Auto-generated method stub
		return pmDAOi.getCount();
	}

	public void addPlan(PlanVO pVO) {
		// TODO Auto-generated method stub
		pmDAOi.insertPlan(VOturnPO(pVO));
		
	}

	public void getRateList(List<PlanVO> planList, int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		planList.clear();
		for (PlanPO po : pmDAOi.selectPlanAll(nowPage,pageRecords)) {
			planList.add(POturnVO(po));
		}
	}
	
	public PlanVO POturnVO(PlanPO po){
		PlanVO vo= new PlanVO();
		vo.setCoachNO(po.getCoachNO());
		vo.setEndStation(po.getEndStation());
		vo.setPlanId(po.getPlanId());
		vo.setStartStation(po.getStartStation());
		vo.setTrainId(po.getTrainId());
		vo.setImplementTime(po.getImplementTime());
		vo.setPublishTime(po.getPublishTime());
		return vo;	
	}
	
	public PlanPO VOturnPO(PlanVO vo){
		PlanPO po = new PlanPO();
		po.setCoachNO(vo.getCoachNO());
		po.setEndStation(vo.getEndStation());
		po.setPlanId(vo.getPlanId());
		po.setStartStation(vo.getStartStation());
		po.setTrainId(vo.getTrainId());
		po.setImplementTime(vo.getImplementTime());
		po.setPublishTime(vo.getPublishTime());
		return po;
	}
	
	
}
