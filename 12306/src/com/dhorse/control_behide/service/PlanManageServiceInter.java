package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.PlanVO;

public interface PlanManageServiceInter {

	int getRecords();

	void getRateList(List<PlanVO> planList, int nowPage, int pageRecords);

	void addPlan(PlanVO pVO);

	void updatePlan(PlanVO pVO);

	void deletePlan(String id);

}
