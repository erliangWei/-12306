package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.aop.aspectj.AspectJAdviceParameterNameDiscoverer.AmbiguousBindingException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.StationManagerDAOInter;
import com.dhorse.control_behide.po.ProCapitalPO;
import com.dhorse.control_behide.po.StationDeptPO;
import com.dhorse.control_behide.po.StationPO;
import com.dhorse.control_behide.vo.AddStationVO;
import com.dhorse.control_behide.vo.ProCapitalVO;
import com.dhorse.control_behide.vo.StationDeptListVO;
import com.dhorse.control_behide.vo.StationManageVO;
import com.dhorse.control_behide.vo.UpdateStationVO;

@Transactional
@Service("stationManagerServiceImpl")
public class StationManagerServiceImpl implements StationManagerServiceInter {
	private List<StationPO> sPO;			//车站列表PO
	private StationPO stationPO;
	private List<StationDeptPO> sdPO;		//铁路局PO
	private List<ProCapitalPO> pcPO;		//省会简称PO
	private StationManagerDAOInter smDAOi;	//车站管理DAO接口对象
	//private List<StationManageVO> smVO;
	
	public void updateStation(UpdateStationVO vo){	//修改车站信息
		StationPO po = new StationPO();
		po.setStationId(vo.getUdateStationId());
		po.setStationName(vo.getUpdateStationName());
		po.setStationDept(vo.getUpdateStationDept());
		po.setStationLev(vo.getUpdateStationLevel());
		po.setAddress(vo.getUpdateAddress());
		po.setPinYin(vo.getUpdateStationNamePY());
		po.setPolicyDept(vo.getUpdateStationProvinceDept());
		smDAOi.updateStation(po);
	}
	public void delectStation(int stationId) { 	//删除车站
		// TODO Auto-generated method stub
		smDAOi.deleteStation(stationId);
	}
	public void getProCapitalList(List<ProCapitalVO> proCapicalList) {		//获取省会简称列表
		// TODO Auto-generated method stub
		proCapicalList.clear();
		setPcPO(smDAOi.selectProCapitalAll());
		for (ProCapitalPO po : pcPO) {
			ProCapitalVO vo = new ProCapitalVO();
			vo.setPROID(po.getPROID());
			vo.setPROCAPITAL(po.getPROCAPITAL());
			vo.setPRONAME(po.getPRONAME());
			proCapicalList.add(vo);
		}
	}
	public void getStationList(List<StationManageVO> stationList,int nowPage,int pageRecords){  //获取车站列表
		// TODO Auto-generated method stub
		try {
			stationList.clear();
			setsPO(smDAOi.selectStationAll(nowPage, pageRecords));
			for (StationPO po : sPO) {
				StationManageVO vo= new StationManageVO();
				vo.setAddress(po.getAddress());
				vo.setPinYin(po.getPinYin());
				vo.setPolicyDept(po.getPolicyDept());
				vo.setStationDept(po.getStationDept());
				vo.setStationId(po.getStationId());
				vo.setStationLev(po.getStationLev());
				vo.setStationName(po.getStationName());
				stationList.add(vo);				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int getRecords() {						//获取车站总页数
		// TODO Auto-generated method stub
		return smDAOi.selectStationCount();
	}
	public void addStation(AddStationVO asVO) {		//添加车站
		// TODO Auto-generated method stub
		StationPO spo= new StationPO();
		spo.setStationId(asVO.getAddStationId());
		spo.setAddress(asVO.getAddStationAddress());
		spo.setPinYin(asVO.getAddStationNamepy());
		spo.setPolicyDept(asVO.getAddStationPolicyDept());
		spo.setStationLev(asVO.getAddStationLevel());
		spo.setStationName(asVO.getAddStationName());
		spo.setStationDept(asVO.getAddStationDept());
		smDAOi.insertStaion(spo);
	}
	public void getStationDeptList(List<StationDeptListVO> sdVO) {
		sdVO.clear();
		setSdPO(smDAOi.selectStationDeptAll());
		for (StationDeptPO po : sdPO) {
			StationDeptListVO vo = new StationDeptListVO();
			vo.setDeptId(po.getDeptID());
			vo.setStationDept(po.getDeptName());
			sdVO.add(vo);
		}
	}
	public StationManagerDAOInter getSmDAOi() {
		return smDAOi;
	}
	public void setSmDAOi(StationManagerDAOInter smDAOi) {
		this.smDAOi = smDAOi;
	}
	public List<StationPO> getsPO() {
		return sPO;
	}
	public void setsPO(List<StationPO> sPO) {
		this.sPO = sPO;
	}
	public List<StationDeptPO> getSdPO() {
		return sdPO;
	}
	public void setSdPO(List<StationDeptPO> sdPO) {
		this.sdPO = sdPO;
	}
	public List<ProCapitalPO> getPcPO() {
		return pcPO;
	}
	public void setPcPO(List<ProCapitalPO> pcPO) {
		this.pcPO = pcPO;
	}

	public StationPO getStationPO() {
		return stationPO;
	}

	public void setStationPO(StationPO stationPO) {
		this.stationPO = stationPO;
	}
	
}
