package com.dhorse.control_behide.po;

public class CoachPO {
	
	private Integer coachId;  //列车编组编码
	private Integer coachTrainId;   //车次代码
	private Integer coachNo;      //车厢号
	private Integer seat;        //车厢座席数量
	private String coachType;    //车厢类型
	private String seatType;      //车厢座席类型
	public Integer getCoachId() {
		return coachId;
	}

	public void setCoachId(Integer coachId) {
		this.coachId = coachId;
	}

	public void setCoachTrainId(Integer coachTrainId) {
		this.coachTrainId = coachTrainId;
	}

	public Integer getCoachNo() {
		return coachNo;
	}

	public void setCoachNo(Integer coachNo) {
		this.coachNo = coachNo;
	}

	public Integer getSeat() {
		return seat;
	}

	public void setSeat(Integer seat) {
		this.seat = seat;
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public Integer getCoachTrainId() {
		return coachTrainId;
	}
	
	
}
