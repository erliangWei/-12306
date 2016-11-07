package com.dhorse.control_behide.action;

import java.util.List;

import com.dhorse.control_behide.service.ZoneManageServiceInter;
import com.dhorse.control_behide.vo.RateManageVO;
import com.dhorse.control_behide.vo.ZoneManageVo;
import com.opensymphony.xwork2.ModelDriven;

public class ZoneAction implements ModelDriven<ZoneManageVo>{
	
	private List<ZoneManageVo> zoneList;
	private ZoneManageServiceInter zonelistservice;
	private int nowpage;
	private int count;
	private ZoneManageVo zVO=new ZoneManageVo();
	
	public List<ZoneManageVo> getZonelist() {
		return zoneList;
	}
	public void setZonelist(List<ZoneManageVo> zonelist) {
		this.zoneList = zonelist;
	}
	public ZoneManageServiceInter getZonelistservice() {
		return zonelistservice;
	}
	public void setZonelistservice(ZoneManageServiceInter zonelistservice) {
		this.zonelistservice = zonelistservice;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public String zoneList(){
		int pageCount=15;
		setNowpage(0);
		int flag=zonelistservice.getPage()%pageCount;
		if(flag==1)
			setCount(zonelistservice.getPage()/pageCount);
		else
			setCount(zonelistservice.getPage()/pageCount+1);
		zonelistservice.selectallZone(zoneList, nowpage, pageCount);
		return "showzone";
		
	}
	
	public void insertZone(){
		//System.out.println(rVO);
		zonelistservice.insertZone(zVO);
	}
	
	public ZoneManageVo getModel() {
		// TODO Auto-generated method stub
		return zVO;
	}

}
