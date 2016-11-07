package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.CoachPO;

public interface CoachManageDAOInter {

	public List<CoachPO> selectAllCoach(int nowPage, int pageRecords);

	public int selectCount();

	public void insertCoach(CoachPO po);

	public void deleteCoach(int parseInt);

	public void updateCoach(CoachPO po);
	

}
