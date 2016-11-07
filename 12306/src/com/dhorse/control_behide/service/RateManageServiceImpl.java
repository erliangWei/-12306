package com.dhorse.control_behide.service;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.RateManageDAOInter;
import com.dhorse.control_behide.po.RatePO;
import com.dhorse.control_behide.vo.RateManageVO;
@Transactional
public class RateManageServiceImpl implements RateManageServiceInter {
	private RateManageDAOInter rmDAOi;
	public RateManageDAOInter getRmDAOi() {
		return rmDAOi;
	}
	public void setRmDAOi(RateManageDAOInter rmDAOi) {
		this.rmDAOi = rmDAOi;
	}
	
	
	
	/************* 更新纪录   ***************/
	public void updateRate(RateManageVO rVO) {
		// TODO Auto-generated method stub
		rmDAOi.updateRate(VOturnPO(rVO));
		
	}
	/************* 删除纪录   ***************/
	public void deleteRate(Integer id) {
		// TODO Auto-generated method stub
		rmDAOi.deleteRate(id);
	}
	/************* 添加纪录   ***************/
	public void addRate(RateManageVO rVO) {
		// TODO Auto-generated method stub
		rmDAOi.insertRate(VOturnPO(rVO));
	}
	
	/*************  获取记录总数   ***************/
	public int getRecords() {
		// TODO Auto-generated method stub
		return rmDAOi.getRateCount();
	}
	
	/*************  获取记录   ***************/
	public void getRateList(List<RateManageVO> rateList, int nowPage,
			int pageRecords) {
		// TODO Auto-generated method stub
		rateList.clear();
		for (RatePO po : rmDAOi.selectRateAll(nowPage,pageRecords)) {
			rateList.add(POturnVO(po));
		}
	}
	
	
	public RatePO VOturnPO(RateManageVO vo){
		RatePO po = new RatePO();
		po.setRateId(vo.getRateId());
		po.setRatIO(vo.getRatIO());
		po.setTicketRate(vo.getTicketRate());
		po.setTicketType(vo.getTicketType());
		return po;
	}
	public RateManageVO POturnVO(RatePO po){
		RateManageVO vo = new RateManageVO();
		vo.setRateId(po.getRateId());
		vo.setRatIO(po.getRatIO());
		vo.setTicketType(po.getTicketType());
		vo.setTicketRate(po.getTicketRate());
		return vo;
	}
	
	
	

}
