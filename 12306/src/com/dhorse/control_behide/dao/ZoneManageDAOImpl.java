package com.dhorse.control_behide.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import com.dhorse.control_behide.po.ZonePO;

public class ZoneManageDAOImpl implements ZoneManageDAOInter {
	
	private SessionFactory sf;
	
	/************ 删除记录 ****************/
	public void deleteZone(int id) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "delete ZonePO where zoneId=?";
		Query q = session.createQuery(hql);
		q.setInteger(0, id);
		q.executeUpdate();
	}
	
	/************ 插入记录 ****************/
	public void updateZone(ZonePO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="update ZonePO set zoneAmount=?,zoneFrom=?,zoneTo=?,zoneDistance=? where zoneId=?";
		Query q = session.createQuery(hql);
		q.setInteger(0 , po.getZoneAmount());
		q.setInteger(1 , po.getZoneFrom());
		q.setInteger(2 , po.getZoneTo());
		q.setInteger(3 , po.getZoneDistance());
		q.setInteger(4 , po.getZoneId());
		q.executeUpdate();
	}
	




	/************ 插入记录 ****************/
	public void insertZone(ZonePO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		session.save(po);		
	}
	

	/************ 获取记录总数  **************/
	public int getCount() {
		Session session = sf.getCurrentSession();
		String hql = "select count(*) from ZonePO";
		Query q = session.createQuery(hql);
		String count = q.list().get(0).toString();
		// TODO Auto-generated method stub
		return Integer.parseInt(count);
	}


	/************ 获取列表  **************/
	public List<ZonePO> selectZoneAll(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "from ZonePO order by zoneId desc";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<ZonePO> zList = q.list();
		return zList;
	}

	public SessionFactory getSf() {
		return sf;
	}

	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}

}
