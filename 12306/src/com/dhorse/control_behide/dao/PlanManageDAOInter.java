package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.PlanPO;

public interface PlanManageDAOInter {

	int getCount();

	List<PlanPO> selectPlanAll(int nowPage, int pageRecords);

	void insertPlan(PlanPO vOturnPO);

	void updatePlan(PlanPO vOturnPO);

	void deletePlan(String id);

}
