package com.dhorse.control_behide.dao;


import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.dhorse.control_behide.po.RatePO;

public class RateManageDAOImpl implements RateManageDAOInter {
	private SessionFactory sf ;

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	/*************  ���¼�¼  ***************/
	public void updateRate(RatePO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "update RatePO set  ticketType = ?, ticketRate = ?, ratIO = ? where rateId = ?";
		Query q = session.createQuery(hql);
		q.setString(0, po.getTicketType());
		q.setDouble(1, po.getTicketRate());
		q.setDouble(2, po.getRatIO());
		q.setInteger(3, po.getRateId());
		
		q.executeUpdate();          
	}

	/*************  ɾ����¼  ***************/
	public void deleteRate(Integer id) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "delete RatePO where rateId=?";
		Query q = session.createQuery(hql);
		q.setInteger(0, id);
		q.executeUpdate();
	}

	/*************  �����¼  ***************/
	public void insertRate(RatePO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		Serializable s = session.save(po);
	}

	/*************  ��ȡ��¼����   ***************/
	public int getRateCount() {
		// TODO Auto-generated method stub
		Session sesion = sf.getCurrentSession();
		String hql="select count(*) from RatePO";
		Query q = sesion.createQuery(hql);
		String count = q.list().get(0).toString();
		return Integer.parseInt(count);
	}
	/*************  ��ȡ��¼   ***************/
	public List<RatePO> selectRateAll(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from RatePO order by rateId desc";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<RatePO> rList = q.list();
		return rList;
	}
	
	
	
	
	
	
}
