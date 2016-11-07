package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.CoachManageVO;

public interface CoachManageServiceInter {
	
	public void getRouteList(List<CoachManageVO> coachList, int nowPage,
			int pageRecords);

	public int getRecords();

	public void addCoach(CoachManageVO cmVO);

	public void deleteCoach(int parseInt);

	public void updateCoach(CoachManageVO cmVO);
	
}
