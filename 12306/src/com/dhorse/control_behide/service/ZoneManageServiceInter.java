package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.ZoneManageVO;



public interface ZoneManageServiceInter {

	void getZoneList(List<ZoneManageVO> zoneList, int nowPage, int pageRecords);

	int getRecords();

	void addZone(ZoneManageVO zVO);

	void updateZone(ZoneManageVO zVO);

	void deleteCoach(int id);

	
}
