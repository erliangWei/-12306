package com.dhorse.control_behide.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.dhorse.control_behide.po.CoachPO;

public class CoachManageDAOImpl implements CoachManageDAOInter {
	
	private SessionFactory sf;
	
	/****************  删除记录   ***************/
	public void updateCoach(CoachPO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "update CoachPO set coachTrainId=?,coachNo=?,seat=?,coachType=?" +
				",seatType=? where coachId=?";
		Query q = session.createQuery(hql);
		q.setInteger(0, po.getCoachTrainId());
		q.setInteger(1, po.getCoachNo());
		q.setInteger(2, po.getSeat());
		q.setString(3, po.getCoachType());
		q.setString(4, po.getSeatType());
		q.setInteger(5, po.getCoachId());
		q.executeUpdate();
		
	}
	
	/****************  删除记录   ***************/
	public void deleteCoach(int parseInt) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="delete CoachPO where coachId=? ";
		Query q = session.createQuery(hql);
		q.setInteger(0, parseInt);
		q.executeUpdate();
		
	}
	/****************  插入记录   ***************/
	public void insertCoach(CoachPO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		session.save(po);
	}
	/***********  获取记录总数*****************/
	public int selectCount() {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="select count(*) from CoachPO ";
		Query q = session.createQuery(hql);
		String count = q.list().get(0).toString();
		return Integer.parseInt(count);
	}
	/***********  获取记录*****************/
	public List<CoachPO> selectAllCoach(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from CoachPO order by coachId desc";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<CoachPO> cList = q.list();
		return cList;
	}

	

	
	
	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}



}
