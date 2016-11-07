package com.dhorse.control_behide.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;

import com.dhorse.control_behide.po.StationPO;
import com.dhorse.control_behide.po.TrainPO;
import com.dhorse.control_behide.vo.StationManageVO;

public class TrainManageDaoImpl implements TrainManageDaoInter {
	private SessionFactory sf;
	
	
	
	public List<StationPO> selectStationAll() {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from StationPO";
		Query q = session.createQuery(hql);
		List<StationPO> stationList = q.list();
		return stationList;
	}
	
	public List<StationPO> selectStation(String station) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from StationPO where pinYin like ?";
		Query q = session.createQuery(hql);
		q.setString(0, "%"+station+"%");
		List<StationPO> stationList = q.list();
		return stationList;
	}

	/*修改列车信息*/
	public void updateTrain(TrainPO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="update TrainPO set  statrStation=?,endStation=?,startTime=?,endTime=?,totalTime=?" +
				",totalDistance=?,standTicketNum=?,trainBody=?,trainType=?,trainCode =? where trainId=?";  
		Query q = session.createQuery(hql);
		q.setString(0, po.getStatrStation());
		q.setString(1, po.getEndStation());
		q.setString(2, po.getStartTime());
		q.setString(3, po.getEndTime());
		q.setString(4, po.getTotalTime());
		q.setDouble(5, po.getTotalDistance());
		q.setInteger(6, po.getStandTicketNum());
		q.setString(7, po.getTrainBody());
		q.setString(8, po.getTrainType());
		q.setString(9,po.getTrainCode());
		q.setInteger(10, po.getTrainId());  
		q.executeUpdate();
	}
	/*删除列车*/
	public void deleteTrain(String id) {
		Session session = sf.getCurrentSession();
		System.out.println(id);
		String hql="delete TrainPO where trainCode = ?";
		Query q = session.createQuery(hql);
		q.setString(0, id);
		q.executeUpdate();
		
	}
	/*查询列车总记录*/
	public int selectTrainCount() {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="select count(*) from TrainPO";
		Query q = session.createQuery(hql);
		String count = q.list().get(0).toString();
		return Integer.parseInt(count);
	}

	/*插入列车*/
	public void insertTrain(TrainPO po) {
		Session session = sf.getCurrentSession();
		session.save(po);
	}

	/* 查询所有列车*/
	public List<TrainPO> selectAll(int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql = "from TrainPO order by trainId desc";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<TrainPO> tPO = q.list(); 
		return tPO;
	}
	
	
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
}
