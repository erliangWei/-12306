package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.RateManageVO;


public interface RateManageServiceInter {

	int getRecords();

	void getRateList(List<RateManageVO> rateList, int nowPage, int pageRecords);

	void addRate(RateManageVO rVO);

	void deleteRate(Integer id);

	void updateRate(RateManageVO rVO);

}
