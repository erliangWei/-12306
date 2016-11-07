package com.dhorse.control_behide.dao;

import java.util.List;

import com.dhorse.control_behide.po.RoutePO;

public interface RouteManageDAOInter {

	public List<RoutePO> selectAllRoute(int nowPage, int pageRecords);

	public int getRecord();

	public void insertRoute(RoutePO po);

	public void deleteRoute(int parseInt);

	public void updateRoute(RoutePO po);

}
