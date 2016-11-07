package com.dhorse.control_behide.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.dhorse.control_behide.dao.CoachManageDAOInter;
import com.dhorse.control_behide.po.CoachPO;
import com.dhorse.control_behide.vo.CoachManageVO;
@Transactional
public class CoachManageServiceImpl implements CoachManageServiceInter {
	private CoachManageDAOInter cmDAOi;


	
	/**************  ���ļ�¼  *******************/
	public void updateCoach(CoachManageVO cmVO) {
		// TODO Auto-generated method stub
		cmDAOi.updateCoach(VOturnPO(cmVO));
		
	}
	
	
	/**************  ��Ӽ�¼  *******************/
	public void addCoach(CoachManageVO cmVO) {
		// TODO Auto-generated method stub
//		CoachPO po = new CoachPO();
//		System.out.println(po);
//		po.setCoachId(cmVO.getCoachId());
//		po.setCoachNo(cmVO.getCoachNo());
//		po.setCoachType(cmVO.getCoachType());
//		po.setSeatType(cmVO.getSeatType());
//		po.setCoachTrainId(cmVO.getCoachTrainId());
//		po.setSeat(cmVO.getSeat());
		cmDAOi.insertCoach(VOturnPO(cmVO));
	}



	/**************  ɾ����¼  *******************/
	public void deleteCoach(int parseInt) {
		// TODO Auto-generated method stub
		cmDAOi.deleteCoach(parseInt);
		
	}

	/**************  ��ȡ��¼����  *******************/
	public int getRecords() {
		// TODO Auto-generated method stub
		return cmDAOi.selectCount();
	}

	/***************  ��ȡCoach�б�  *************/
	public void getRouteList(List<CoachManageVO> coachList, int nowPage,
			int pageRecords) {
		List<CoachPO> cList = cmDAOi.selectAllCoach(nowPage,pageRecords);
		coachList.clear();
		for (CoachPO po : cList) {
			coachList.add(POturnVO(po));
		}
		// TODO Auto-generated method stub
	}
	
	
	public CoachPO VOturnPO(CoachManageVO vo){
		CoachPO po = new CoachPO();
		po.setCoachId(vo.getCoachId());
		po.setCoachNo(vo.getCoachNo());
		po.setCoachType(vo.getCoachType());
		po.setSeatType(vo.getSeatType());
		po.setCoachTrainId(vo.getCoachTrainId());
		po.setSeat(vo.getSeat());
		System.out.println(vo.getCoachId());
		
		return po;
	}
	
	public CoachManageVO POturnVO(CoachPO po){
		CoachManageVO vo =  new CoachManageVO();
		vo.setCoachId(po.getCoachId());
		vo.setCoachNo(po.getCoachNo());
		vo.setCoachTrainId(po.getCoachTrainId());
		vo.setCoachType(po.getCoachType());
		vo.setSeat(po.getSeat());
		vo.setSeatType(po.getSeatType());
		return vo;
	}
	public CoachManageDAOInter getCmDAOi() {
		return cmDAOi;
	}
	public void setCmDAOi(CoachManageDAOInter cmDAOi) {
		this.cmDAOi = cmDAOi;
	}


	
}
