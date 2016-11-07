package com.dhorse.control_behide.vo;

public class AddStationVO {
	private int id;
	private Integer addStationId;			//车站ID
	private String addStationName;			//车站名
	private String addStationNamepy;		//车站拼音
	private String addStationDept;			//车站所属铁路局
	private Integer addStationLevel;		//车站等级
	private String addStationPolicyDept;			//所属行政区域
//	private String addStationProvince;		//省
//	private String addStationCity;			//市
//	private String addStationCounty;		//县
	private String addStationAddress;			//地址
	private String addressCode;			//地址代码
	public String getAddressCode() {
		return addressCode;
	}
	public void setAddressCode(String addressCode) {
		this.addressCode = addressCode;
	}
	public int getId() {
		return id;
	}
	public String getAddStationAddress() {
		return addStationAddress;
	}
	public void setAddStationAddress(String addStationAddress) {
		this.addStationAddress = addStationAddress;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Integer getAddStationId() {
		return addStationId;
	}
	public void setAddStationId(Integer addStationId) {
		this.addStationId = addStationId;
	}
	public String getAddStationName() {
		return addStationName;
	}
	public void setAddStationName(String addStationName) {
		this.addStationName = addStationName;
	}
	public String getAddStationNamepy() {
		return addStationNamepy;
	}
	public void setAddStationNamepy(String addStationNamepy) {
		this.addStationNamepy = addStationNamepy;
	}
	public String getAddStationDept() {
		return addStationDept;
	}
	public void setAddStationDept(String addStationDept) {
		this.addStationDept = addStationDept;
	}
	public Integer getAddStationLevel() {
		return addStationLevel;
	}
	public void setAddStationLevel(Integer addStationLevel) {
		this.addStationLevel = addStationLevel;
	}
	public String getAddStationPolicyDept() {
		return addStationPolicyDept;
	}
	public void setAddStationPolicyDept(String addStationPolicyDept) {
		this.addStationPolicyDept = addStationPolicyDept;
	}
//	public String getAddStationProvince() {
//		return addStationProvince;
//	}
//	public void setAddStationProvince(String addStationProvince) {
//		this.addStationProvince = addStationProvince;
//	}
//	public String getAddStationCity() {
//		return addStationCity;
//	}
//	public void setAddStationCity(String addStationCity) {
//		this.addStationCity = addStationCity;
//	}
//	public String getAddStationCounty() {
//		return addStationCounty;
//	}
//	public void setAddStationCounty(String addStationCounty) {
//		this.addStationCounty = addStationCounty;
//	}
}
