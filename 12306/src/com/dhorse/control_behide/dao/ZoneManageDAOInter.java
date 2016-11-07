package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.RatePO;
import com.dhorse.control_behide.po.ZonePO;



public interface ZoneManageDAOInter {

	public List<ZonePO> selectZoneAll(int nowPage, int pageRecords);

	public int getCount();

	public void insertZone(ZonePO po);

	public void updateZone(ZonePO po);

	public void deleteZone(int id);
	

}
