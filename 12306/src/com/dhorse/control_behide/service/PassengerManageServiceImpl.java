package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.PassengeManageDAOInter;
import com.dhorse.control_behide.po.PassengerPO;
import com.dhorse.control_behide.vo.PassengerVO;
@Transactional
public class PassengerManageServiceImpl implements PassengerManageServiceInter {
	private PassengeManageDAOInter pmDAOi;
	

	public void getPassengerList(List<PassengerVO> passengerList,String userId) {
		// TODO Auto-generated method stub
		passengerList.clear();
		for (PassengerPO po : pmDAOi.selectPassengerAll(userId)) {
			passengerList.add(POturnVO(po));
		}
	}
	
	public PassengerPO VOturnPO(PassengerVO vo){
		PassengerPO po = new PassengerPO();
		po.setADDRESS(vo.getADDRESS());
		po.setEMAIL(vo.getEMAIL());
		po.setID(vo.getID());
		po.setID_CODE(vo.getID_CODE());
		po.setID_TYPE(vo.getID_TYPE());
		po.setNAME(po.getNAME());
		po.setPASSENGER_TYPE(po.getPASSENGER_TYPE());
		po.setPHONE(vo.getPHONE());
		po.setPOSTAL(vo.getPOSTAL());
		po.setSEX(vo.getSEX());
		po.setTELL_PHONE(vo.getTELL_PHONE());
//		po.setUSER_PASS_ID(vo.getUSER_PASS_ID());
		return po;
	}
	public PassengerVO POturnVO(PassengerPO po){
		PassengerVO vo = new PassengerVO();
		vo.setADDRESS(po.getADDRESS());
		vo.setEMAIL(po.getEMAIL());
		vo.setID(po.getID());
		vo.setID_CODE(po.getID_CODE());
		vo.setID_TYPE(po.getID_TYPE());
		vo.setNAME(po.getNAME());
		vo.setPASSENGER_TYPE(po.getPASSENGER_TYPE());
		vo.setPHONE(po.getPHONE());
		vo.setPOSTAL(po.getPOSTAL());
		vo.setSEX(po.getSEX());
		vo.setTELL_PHONE(po.getTELL_PHONE());
//		vo.setUSER_PASS_ID(po.getUSER_PASS_ID());
		return vo;
	}
	
	
	
	public PassengeManageDAOInter getPmDAOi() {
		return pmDAOi;
	}
	public void setPmDAOi(PassengeManageDAOInter pmDAOi) {
		this.pmDAOi = pmDAOi;
	}
	
}
