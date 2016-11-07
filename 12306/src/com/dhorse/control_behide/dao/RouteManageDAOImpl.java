package com.dhorse.control_behide.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import com.dhorse.control_behide.po.RoutePO;

public class RouteManageDAOImpl implements RouteManageDAOInter {
	private SessionFactory sf ;
	
	/************  修改记录   ****************/
	public void updateRoute(RoutePO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();     
		String hql="update RoutePO set trainId=?,stationAll=?,leaveTime=?,arriveTime=?,totalDistance=?" +
				",totalTime=? where routeId=?";
		Query q = session.createQuery(hql);
		System.out.println(po.getRouteId());
		q.setString(0, po.getTrainId());
		q.setString(1, po.getStationAll());
		q.setString(2, po.getLeaveTime());
		q.setString(3, po.getArriveTime());
		q.setDouble(4, po.getTotalDistance());
		q.setString(5, po.getTotalTime());
		q.setString(6, po.getRouteId());
		q.executeUpdate();
//		System.out.println(i);
	}
	
	
	
	
	/***********删除记录   ************/
	public void deleteRoute(int parseInt) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="delete RoutePO where routeId = ?";
		Query q = session.createQuery(hql);
		q.setInteger(0, parseInt);
		q.executeUpdate();
	}


	/**********  插入记录  ************/
	public void insertRoute(RoutePO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		
		session.save(po);
	}

	/******  查询记录  **********/
	public int getRecord() {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="select count(*) from RoutePO";
		Query q = session.createQuery(hql);
		String count = q.list().get(0).toString();
		return Integer.parseInt(count);
	}
	
	/****  查询所有 路线  ****/
	public List<RoutePO> selectAllRoute(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from RoutePO order by routeId desc";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<RoutePO> rList = q.list();
		return rList;
	}
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

}
