package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.ZoneManageDAOInter;
import com.dhorse.control_behide.po.RatePO;
import com.dhorse.control_behide.po.ZonePO;
import com.dhorse.control_behide.vo.ZoneManageVO;
@Transactional
public class ZoneManageServiceImpl implements ZoneManageServiceInter {
	private ZoneManageDAOInter zmDAOi;

	/************删除记录 **************/
	public void deleteCoach(int id) {
		// TODO Auto-generated method stub
		zmDAOi.deleteZone(id);
		
	}
	
	
	/************ 修改记录 **************/
	public void updateZone(ZoneManageVO zVO) {
		// TODO Auto-generated method stub
		zmDAOi.updateZone(VOturnPO(zVO));
		
	}
	
	


	/************ 插入记录 **************/
	public void addZone(ZoneManageVO zVO) {
		// TODO Auto-generated method stub
		zmDAOi.insertZone(VOturnPO(zVO));
	}
	

	/************ 获取记录总数  **************/
	public int getRecords() {
		// TODO Auto-generated method stub
		return zmDAOi.getCount();
	} 
	
	/************ 获取列表  **************/
	public void getZoneList(List<ZoneManageVO> zoneList, int nowPage,
			int pageRecords) {
		// TODO Auto-generated method stub
		zoneList.clear();
		for (ZonePO po : zmDAOi.selectZoneAll(nowPage,pageRecords)){
			zoneList.add(POturnVO(po));
		}
		
	}
	
	public ZonePO VOturnPO(ZoneManageVO vo){
		ZonePO po = new ZonePO();
		po.setZoneAmount(vo.getZoneAmount());
		po.setZoneDistance(vo.getZoneDistance());
		po.setZoneFrom(vo.getZoneFrom());
		po.setZoneId(vo.getZoneId());
		po.setZoneTo(vo.getZoneTo());
		return po;
	}
	
	public ZoneManageVO POturnVO(ZonePO po){
		ZoneManageVO vo = new ZoneManageVO();
		vo.setZoneAmount(po.getZoneAmount());
		vo.setZoneDistance(po.getZoneDistance());
		vo.setZoneFrom(po.getZoneFrom());
		vo.setZoneId(po.getZoneId());
		vo.setZoneTo(po.getZoneTo());
		return vo;
		
	}



	public ZoneManageDAOInter getZmDAOi() {
		return zmDAOi;
	}
	public void setZmDAOi(ZoneManageDAOInter zmDAOi) {
		this.zmDAOi = zmDAOi;
	}
	
	
}
