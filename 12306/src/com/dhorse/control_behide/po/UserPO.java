package com.dhorse.control_behide.po;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class UserPO {
    private Integer USERID;
	private String EMAIL;
	private String PASSWARD;
	private String NAME;
	private String SEX;
	private String IDCARD;
	private String PHONE;
	private Date RECENTLOGTIME;
	private String IDCARDTYPE;
	private String BORNDAY;
	private String ADDRESS;
	private String PASSENGERTYPE;
	private String USERNAME;
	private String POSTCODE;
	private String TELEPHONE;
	private Set<PassengerPO> passengers = new HashSet<PassengerPO>();
	
	public Set<PassengerPO> getPassengers() {
		return passengers;
	}
	public void setPassengers(Set<PassengerPO> passengers) {
		this.passengers = passengers;
	}
	public Integer getUSERID() {
		return USERID;
	}
	public void setUSERID(Integer uSERID) {
		USERID = uSERID;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPASSWARD() {
		return PASSWARD;
	}
	public void setPASSWARD(String pASSWARD) {
		PASSWARD = pASSWARD;
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
	public String getIDCARD() {
		return IDCARD;
	}
	public void setIDCARD(String iDCARD) {
		IDCARD = iDCARD;
	}
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public Date getRECENTLOGTIME() {
		return RECENTLOGTIME;
	}
	public void setRECENTLOGTIME(Date rECENTLOGTIME) {
		RECENTLOGTIME = rECENTLOGTIME;
	}
	public String getIDCARDTYPE() {
		return IDCARDTYPE;
	}
	public void setIDCARDTYPE(String iDCARDTYPE) {
		IDCARDTYPE = iDCARDTYPE;
	}
	public String getBORNDAY() {
		return BORNDAY;
	}
	public void setBORNDAY(String bORNDAY) {
		BORNDAY = bORNDAY;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getPASSENGERTYPE() {
		return PASSENGERTYPE;
	}
	public void setPASSENGERTYPE(String pASSENGERTYPE) {
		PASSENGERTYPE = pASSENGERTYPE;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getPOSTCODE() {
		return POSTCODE;
	}
	public void setPOSTCODE(String pOSTCODE) {
		POSTCODE = pOSTCODE;
	}
	public String getTELEPHONE() {
		return TELEPHONE;
	}
	public void setTELEPHONE(String tELEPHONE) {
		TELEPHONE = tELEPHONE;
	}
}
