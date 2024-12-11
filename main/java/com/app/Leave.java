package com.app;



public class Leave {
    private int sid;
    private int LeaveID;
	private int id;
	private String empno;
    private String empName;
    private String empEmail;
    private String department;
    private String leaveType;
    private String leaveTo;
    private String leaveFrom;
    private String leaveDescription;
    private String status;


    public Leave(int lid, int id, String empno, String empName, String empEmail, String department,
			String leaveType, String leaveTo, String leaveFrom, String leaveDescription) {
		super();
		this.LeaveID = lid;
		this.id = id;
		this.empno = empno;
		this.empName = empName;
		this.empEmail = empEmail;
		this.department = department;
		this.leaveType = leaveType;
		this.leaveTo = leaveTo;
		this.leaveFrom = leaveFrom;
		this.leaveDescription = leaveDescription;
	}

	public Leave(int sid, int id, String empName, String empEmail,String empno, String department, String leaveType,
                 String leaveTo, String leaveFrom, String leaveDescription, String status) {
        
    	this.sid = sid;
    	this.id = id;
    	this.empName=empName;
        this.empEmail = empEmail;
        this.empno = empno;
        this.department = department;
        this.leaveType = leaveType;
        this.leaveTo = leaveTo;
        this.leaveFrom = leaveFrom;
        this.leaveDescription = leaveDescription;
        this.status = status;
    }


	public Leave() {
		// TODO Auto-generated constructor stub
	}

	public String getEmpno() {
		return empno;
	}

	// Getters and setters for each attribute
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public String getLeaveTo() {
        return leaveTo;
    }

    public void setLeaveTo(String leaveTo) {
        this.leaveTo = leaveTo;
    }

    public String getLeaveFrom() {
        return leaveFrom;
    }

    public void setLeaveFrom(String leaveFrom) {
        this.leaveFrom = leaveFrom;
    }

    public String getLeaveDescription() {
        return leaveDescription;
    }

    public void setLeaveDescription(String leaveDescription) {
        this.leaveDescription = leaveDescription;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    public void setEmpno(String empno) {
        this.empno = empno;
    }

	public int getLeaveID() {
		return LeaveID;
	}

	public void setLeaveID(int lid) {
		LeaveID = lid;
	}
    
    
    
    
    
    
}
