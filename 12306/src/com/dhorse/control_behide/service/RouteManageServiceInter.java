package com.dhorse.control_behide.service;

import java.util.List;

import com.dhorse.control_behide.vo.RouteVO;

public interface RouteManageServiceInter {

	void getRouteList(List<RouteVO> routeList, int nowPage, int pageRecords);

	int getRecords();

	void addRoute(RouteVO rVO);

	void delectTrain(int parseInt);

	void updateRoute(RouteVO rVO);


}
