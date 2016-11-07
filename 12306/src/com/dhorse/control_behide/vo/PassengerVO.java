package com.dhorse.control_behide.vo;

import com.dhorse.control_behide.po.PassengerPO;

public class PassengerVO {
	private Integer ID;
	private String POSTAL;
	private PassengerPO USER_PASS_ID;
	private String NAME; 
	private String SEX;
	private String ID_TYPE;
	private	String ID_CODE;
	private String PASSENGER_TYPE;
	private String PHONE;
	private String TELL_PHONE;
	private String EMAIL;
	private String ADDRESS;
	public Integer getID() {
		return ID;
	}
	public void setID(Integer iD) {
		ID = iD;
	}
	public String getPOSTAL() {
		return POSTAL;
	}
	public void setPOSTAL(String pOSTAL) {
		POSTAL = pOSTAL;
	}
	public PassengerPO getUSER_PASS_ID() {
		return USER_PASS_ID;
	}
	public void setUSER_PASS_ID(PassengerPO uSERPASSID) {
		USER_PASS_ID = uSERPASSID;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getSEX() {
		return SEX;
	}
	public void setSEX(String sEX) {
		SEX = sEX;
	}
	public String getID_TYPE() {
		return ID_TYPE;
	}
	public void setID_TYPE(String iDTYPE) {
		ID_TYPE = iDTYPE;
	}
	public String getID_CODE() {
		return ID_CODE;
	}
	public void setID_CODE(String iDCODE) {
		ID_CODE = iDCODE;
	}
	public String getPASSENGER_TYPE() {
		return PASSENGER_TYPE;
	}
	public void setPASSENGER_TYPE(String pASSENGERTYPE) {
		PASSENGER_TYPE = pASSENGERTYPE;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public String getTELL_PHONE() {
		return TELL_PHONE;
	}
	public void setTELL_PHONE(String tELLPHONE) {
		TELL_PHONE = tELLPHONE;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
}
