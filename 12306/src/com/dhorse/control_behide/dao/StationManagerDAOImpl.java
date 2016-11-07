package com.dhorse.control_behide.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import org.springframework.transaction.annotation.Transactional;

import sun.rmi.log.ReliableLog;

import com.dhorse.control_behide.po.ProCapitalPO;
import com.dhorse.control_behide.po.StationDeptPO;
import com.dhorse.control_behide.po.StationPO;
import com.dhorse.control_behide.vo.AddStationVO;
import com.dhorse.control_behide.vo.ProCapitalVO;
import com.dhorse.control_behide.vo.StationManageVO;

public class StationManagerDAOImpl implements StationManagerDAOInter {
	private SessionFactory sf;
	public SessionFactory getSf() {
		return sf;
	}
	public void setSf(SessionFactory sf) {
		this.sf = sf;
	}
	public void updateStation(StationPO po) {
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="update StationPO set stationName=?,pinYin=?,stationDept=?,stationLev=?,policyDept=?,address=? where stationId=?";
		Query q = session.createQuery(hql);
		q.setString(0, po.getStationName());
		q.setString(1, po.getPinYin());
		q.setString(2, po.getStationDept());
		q.setInteger(3, po.getStationLev());
		q.setString(4, po.getPolicyDept());
		q.setString(5, po.getAddress());
		System.out.println(po.getStationId());
		q.setInteger(6, po.getStationId());
		q.executeUpdate();
	}
	public void deleteStation(int statioId) {			//ͨ��StaitonIdɾ����վ
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="delete StationPO where stationId = ?";
		Query q = session.createQuery(hql);
		q.setInteger(0, statioId);
		q.executeUpdate();
	}
	public List<ProCapitalPO> selectProCapitalAll() {		//��ȡ���ݿ�ʡ����
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="from ProCapitalPO";
		Query q = session.createQuery(hql);
		List<ProCapitalPO> pcPO = q.list();
		return pcPO;
	}
	public List<StationDeptPO> selectStationDeptAll() {			//��ȡ��վ������
		Session session = sf.getCurrentSession();
		String hql="from StationDeptPO";
//		String sql="select * from stationdept";
		Query q = session.createQuery(hql);
//		Query q = session.createSQLQuery(sql);
		List<StationDeptPO> sdPO = q.list();
		return sdPO;
	}
	public List<StationPO> selectStationAll(int nowPage,int pageRecords) throws Exception {		//��ȡ���г�վ��Ϣ
						//nowPage ��ǰ��ҳ��pageCount��ҳ��¼���� 
		Session session = sf.getCurrentSession();
		//String sql="select * from STATION where rownum <= 4 order by stationid";
//		String hql="from StationPO order by stationid";
		String hql="from StationPO order by stationid desc";					//����
//		String hql="from StationPO order by stationid ";
		Query q = session.createQuery(hql);
		q.setFirstResult((nowPage-1)*pageRecords);
		q.setMaxResults(pageRecords);
		List<StationPO> sPO = q.list();
		return sPO;
	}
	public int selectStationCount() {			//��վ��ҳ��
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		String hql="select count(*) from StationPO";
		Query q = session.createQuery(hql);
		String cou=q.list().get(0).toString();
		return Integer.parseInt(cou);
	}
	public void insertStaion(StationPO spo) {			//��ӳ�վ
		// TODO Auto-generated method stub
		Session session = sf.getCurrentSession();
		session.save(spo);
	}


}
