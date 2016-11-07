package com.dhorse.control_behide.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.dhorse.control_behide.po.PassengerPO;

public class PassengeManageDAOImpl implements PassengeManageDAOInter {
	SessionFactory sf ;
	
	public List<PassengerPO> selectPassengerAll(String userId) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "from PassengerPO where USER_PASS_ID = ?";
		Query q = session.createQuery(hql);
		q.setString(0, userId);
		List<PassengerPO> pList = q.list();
		return pList;
	}
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
}
