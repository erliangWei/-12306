package com.dhorse.control_behide.action;

import java.util.List;

import com.dhorse.control_behide.service.UserManageServiceInter;
import com.dhorse.control_behide.vo.UserVO;

public class UserManageAction {
	private List<UserVO> userList;
	private UserManageServiceInter umsi;
	private int pageCount;							//总页数
	private int nowPage = 1;						//当前页
	private int[] pageList;
	private int pageRecords = 20;			//页面记录
	private String nowPageMark;
	public String getUserPage(){
//		turnNowPage();
		int records = umsi.getRecords();			//总记录
		int flag=records%pageRecords;			//计算总页数，求余，判断页数是否为商+1
		if(flag==0)
			pageCount = records/pageRecords;		
		else
			pageCount = records/pageRecords+1;
		//获取总页数
		if(pageCount<10)
			pageList = new int[pageCount];
		else 
			pageList = new int[10];
		
		//获取当前页
		for(int i = 0 ; i<pageList.length ; i++){
			if(nowPage>5 && nowPage<=pageCount-5)
				pageList[i] = nowPage-5+i;
			else if(nowPage>pageCount-5 && pageCount>10)
				pageList[i] = pageCount-9+i;
			else
				pageList[i] = i+1;
		}
		return "page";
	}
	
	public String userList(){
		turnNowPage();
		
		umsi.userList(userList,nowPage,pageRecords);
//		for(RouteVO vo : routeList)
//			System.out.println(vo.getRouteId());
		return "show";
	}
	
	public void turnNowPage(){
		if(nowPageMark==null){
			setNowPage(1);
		}
		else if(nowPageMark.equals("首页"))
			setNowPage(1);
		else if(nowPageMark.equals("上一页")){
			if(nowPage!=1)
				setNowPage(--nowPage);
			else
				setNowPage(nowPage);
		}
		else if(nowPageMark.equals("下一页")){
			if(nowPage!=pageCount)
				setNowPage(++nowPage);
			else
				setNowPage(pageCount);
		}
		else if(nowPageMark.equals("尾页"))
			setNowPage(pageCount);
		else{
			setNowPage(Integer.parseInt(nowPageMark));
		}
	}
	

	
	
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int[] getPageList() {
		return pageList;
	}

	public void setPageList(int[] pageList) {
		this.pageList = pageList;
	}

	public int getPageRecords() {
		return pageRecords;
	}

	public void setPageRecords(int pageRecords) {
		this.pageRecords = pageRecords;
	}

	public String getNowPageMark() {
		return nowPageMark;
	}

	public void setNowPageMark(String nowPageMark) {
		this.nowPageMark = nowPageMark;
	}

	
	public List<UserVO> getUserList() {
		return userList;
	}

	public void setUserList(List<UserVO> userList) {
		this.userList = userList;
	}

	public UserManageServiceInter getUmsi() {
		return umsi;
	}
	public void setUmsi(UserManageServiceInter umsi) {
		this.umsi = umsi;
	}
	
	

}
