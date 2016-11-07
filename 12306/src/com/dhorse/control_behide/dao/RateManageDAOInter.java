package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.RatePO;
import com.dhorse.control_behide.vo.RateManageVO;

public interface RateManageDAOInter {

	int getRateCount();

	public List<RatePO> selectRateAll(int nowPage, int pageRecords);

	void insertRate(RatePO ratePO);

	void deleteRate(Integer id);

	void updateRate(RatePO vOturnPO);

}
