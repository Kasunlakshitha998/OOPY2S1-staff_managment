package com.Staff;

public class Shift {
	protected int sID;
	protected String sName;
	protected String sDate;
	protected String sTime;
	protected String eTime;
	protected String Description;
	protected String Status;
	
	
	public Shift() {
		super();
	}

	

	public Shift(int sID, String sName, String sDate, String sTime, String eTime, String description, String status) {
		super();
		this.sID = sID;
		this.sName = sName;
		this.sDate = sDate;
		this.sTime = sTime;
		this.eTime = eTime;
		this.Description = description;
		this.Status = status;
	}



	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		this.Status = status;
	}

	public int getsID() {
		return sID;
	}

	public void setsID(int sID) {
		this.sID = sID;
	}

	public String getsName() {
		return sName;
	}

	public void setsName(String sName) {
		this.sName = sName;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String getsTime() {
		return sTime;
	}

	public void setsTime(String sTime) {
		this.sTime = sTime;
	}

	public String geteTime() {
		return eTime;
	}

	public void seteTime(String eTime) {
		this.eTime = eTime;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}
	
	
	
}
