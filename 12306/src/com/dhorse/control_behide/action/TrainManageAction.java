package com.dhorse.control_behide.action;

import java.util.List;

import com.dhorse.control_behide.service.TrainManageServiceInter;
import com.dhorse.control_behide.vo.TrainVO;

public class TrainManageAction {
	private List<TrainVO> trainList;
	private TrainManageServiceInter tmsi;
	private int pageCount;							//��ҳ��
	private int nowPage = 1;						//��ǰҳ
	private int[] pageList;
	private int pageRecords = 20;			//ҳ���¼
	private String nowPageMark;
	
	/************** ��ҳ  *******************/
	public String getTrainPage(){
//		turnNowPage();
		int records = tmsi.getRecords();			//�ܼ�¼
		int flag=records%pageRecords;			//������ҳ�������࣬�ж�ҳ���Ƿ�Ϊ��+1
		if(flag==0)
			pageCount = records/pageRecords ;		
		else
			pageCount = records/pageRecords+1;
		//��ȡ��ҳ��
		if(pageCount<10)
			pageList = new int[pageCount];
		else 
			pageList = new int[10];
		
		//��ȡ��ǰҳ
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
	
	
	/*�г��б�*/
	public String trainList(){
		turnNowPage();
		tmsi.getTrainList(trainList,nowPage,pageRecords);
		return "show";
	}
	
	public void turnNowPage(){
		if(nowPageMark==null){
			setNowPage(1);
		}
		else if(nowPageMark.equals("��ҳ"))
			setNowPage(1);
		else if(nowPageMark.equals("��һҳ")){
			if(nowPage!=1)
				setNowPage(--nowPage);
			else
				setNowPage(nowPage);
		}
		else if(nowPageMark.equals("��һҳ")){
			if(nowPage!=pageCount)
				setNowPage(++nowPage);
			else
				setNowPage(pageCount);
		}
		else if(nowPageMark.equals("βҳ"))
			setNowPage(pageCount);
		else{
			setNowPage(Integer.parseInt(nowPageMark));
		}
	}
	
	public List<TrainVO> getTrainList() {
		return trainList;
	}
	public void setTrainList(List<TrainVO> trainList) {
		this.trainList = trainList;
	}
	public TrainManageServiceInter getTmsi() {
		return tmsi;
	}
	public void setTmsi(TrainManageServiceInter tmsi) {
		this.tmsi = tmsi;
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
	
}
