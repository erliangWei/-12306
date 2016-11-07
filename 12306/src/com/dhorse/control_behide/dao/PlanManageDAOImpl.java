package com.dhorse.control_behide.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;


import com.dhorse.control_behide.po.PlanPO;

public class PlanManageDAOImpl implements PlanManageDAOInter {
	private SessionFactory sf;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

	public int getCount() {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="select count(*) from PlanPO";
		Query q = session.createQuery(hql);
		String count = q.list().get(0).toString();
		return Integer.parseInt(count);
	}
	

	public void deletePlan(String id) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "delete PlanPO where planId = ?";
		Query q = session.createQuery(hql);
		q.setString(0, id);
		q.executeUpdate();
	}

	public void updatePlan(PlanPO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "update PlanPO set trainId = ? ,coachNO = ? ,startStation = ?,endStation =?," +
				"publishTime = ? , implementTime =? where planId =?";
		Query q = session.createQuery(hql);
		q.setString(0, po.getTrainId());
		q.setInteger(1, po.getCoachNO());
		q.setString(2, po.getStartStation());
		q.setString(3, po.getEndStation());
		q.setString(4, po.getPublishTime());
		q.setString(5, po.getImplementTime());
		q.setString(6, po.getPlanId());
		q.executeUpdate();
	}

	public List<PlanPO> selectPlanAll(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from PlanPO order by planId desc";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<PlanPO> pList= q.list();
		return pList;
	}

	public void insertPlan(PlanPO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		session.save(po);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
