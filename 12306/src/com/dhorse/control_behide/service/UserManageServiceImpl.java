package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.UserManageDAOInter;
import com.dhorse.control_behide.po.UserPO;
import com.dhorse.control_behide.vo.UserVO;
@Transactional
public class UserManageServiceImpl implements UserManageServiceInter {
	private UserManageDAOInter uDAOi;
	public UserManageDAOInter getuDAOi() {
		return uDAOi;
	}
	public void setuDAOi(UserManageDAOInter uDAOi) {
		this.uDAOi = uDAOi;
	}
	public int getRecords() {
		// TODO Auto-generated method stub
		return uDAOi.getCount();
	}
	public void userList(List<UserVO> userList, int nowPage, int pageRecords) {
		// TODO Auto-generated method stub
		userList.clear();
		for (UserPO po : uDAOi.selectUserAll(nowPage,pageRecords)) {
			userList.add(POturnVO(po));
		}
	}
	
	
	public UserVO getUserInfo(int userId) {
		// TODO Auto-generated method stub
		
		return POturnVO(uDAOi.selectUserInfo(userId));
	}
	public void deleteUser(int id) {
		// TODO Auto-generated method stub
		uDAOi.deleteUser(id);
		
	}
	public UserVO POturnVO (UserPO po){
		UserVO vo = new UserVO();
		vo.setADDRESS(po.getADDRESS());
		vo.setBORNDAY(po.getBORNDAY());
		vo.setEMAIL(po.getEMAIL());
		vo.setIDCARD(po.getIDCARD());
		vo.setIDCARDTYPE(po.getIDCARDTYPE());
		vo.setNAME(po.getNAME());
		vo.setPASSENGERTYPE(po.getPASSENGERTYPE());
		vo.setPASSWARD(po.getPASSWARD());
		vo.setPHONE(po.getPHONE());
		vo.setPOSTCODE(po.getPOSTCODE());
		vo.setRECENTLOGTIME(po.getRECENTLOGTIME());
		vo.setSEX(po.getSEX());
		vo.setTELEPHONE(po.getTELEPHONE());
		vo.setUSERID(po.getUSERID());
		vo.setUSERNAME(po.getUSERNAME());
		return vo;
	}
	public UserPO VOturnPO (UserVO vo){
		UserPO po = new UserPO();
		po.setADDRESS(vo.getADDRESS());
		po.setBORNDAY(vo.getBORNDAY());
		po.setEMAIL(vo.getEMAIL());
		po.setIDCARD(vo.getIDCARD());
		po.setIDCARDTYPE(vo.getIDCARDTYPE());
		po.setNAME(vo.getNAME());
		po.setPASSENGERTYPE(vo.getPASSENGERTYPE());
		po.setPASSWARD(vo.getPASSWARD());
		po.setPHONE(vo.getPHONE());
		po.setPOSTCODE(vo.getPOSTCODE());
		po.setRECENTLOGTIME(vo.getRECENTLOGTIME());
		po.setSEX(vo.getSEX());
		po.setTELEPHONE(vo.getTELEPHONE());
		po.setUSERID(vo.getUSERID());
		po.setUSERNAME(vo.getUSERNAME());
		return po;
	}
	
	
	
	
}
