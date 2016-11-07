package com.dhorse.control_behide.action;
import java.util.List;

import com.dhorse.control_behide.service.StationManagerServiceInter;
import com.dhorse.control_behide.vo.ProCapitalVO;

public class GetProCapitalAction{
	private List<ProCapitalVO> proCapicalList;
	private StationManagerServiceInter smsi; 
	public List<ProCapitalVO> getProCapicalList() {
		return proCapicalList;
	}
	public void setProCapicalList(List<ProCapitalVO> proCapicalList) {
		this.proCapicalList = proCapicalList;
	}
	public StationManagerServiceInter getSmsi() {
		return smsi;
	}
	public void setSmsi(StationManagerServiceInter smsi) {
		this.smsi = smsi;
	}
	public String proCapitalList(){
		// TODO Auto-generated method stub
		smsi.getProCapitalList(proCapicalList);
		return "province";
	}
}
