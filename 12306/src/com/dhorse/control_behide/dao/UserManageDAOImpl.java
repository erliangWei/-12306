package com.dhorse.control_behide.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.dhorse.control_behide.po.UserPO;

public class UserManageDAOImpl implements UserManageDAOInter {
	SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	
	public UserPO selectUserInfo(int userId) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from UserPO where USERID= ?";
		Query q = session.createQuery(hql);
		q.setInteger(0, userId);
		UserPO upo = (UserPO) q.uniqueResult();
		return upo;
	}
	public void deleteUser(int id) {
		// TODO Auto-generated method stub

		Session session = sf.getCurrentSession();
		String hql = "delete UserPO where USERID=?";
		Query q = session.createQuery(hql);
		q.setInteger(0, id);
		q.executeUpdate();
	}
	public int getCount() {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="select count(*) from UserPO";
		Query q = session.createQuery(hql);
		String count = q.list().get(0).toString();
		return Integer.parseInt(count);
	}
	public List<UserPO> selectUserAll(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from UserPO";
		Query q = session.createQuery(hql);
		List<UserPO> uList = q.list();
		return uList;
	}
}
