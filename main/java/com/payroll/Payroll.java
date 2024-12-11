package com.payroll;

public class Payroll {
	private int rid;
	private int empid;
	private String fdate ;
    private String tdate;
    private double bonus ;
    private double ot;
    private double deduc ;
    private double bsalary;
    private double netSalary;
	
	
	
	
	
	
	public Payroll(int rid, int empid, String fdate, String tdate, double bonus, double ot, double deduc,
			double bsalary, double netSalary) {
		super();
		this.rid = rid;
		this.empid = empid;
		this.fdate = fdate;
		this.tdate = tdate;
		this.bonus = bonus;
		this.ot = ot;
		this.deduc = deduc;
		this.bsalary = bsalary;
		this.netSalary = netSalary;
	}

	public Payroll(int empid, String fdate, String tdate, double bonus, double ot, double deduc, double bsalary) {
		super();
		this.empid = empid;
		this.fdate = fdate;
		this.tdate = tdate;
		this.bonus = bonus;
		this.ot = ot;
		this.deduc = deduc;
		this.bsalary = bsalary;
	}
	public Payroll(int rid, int empid, String fdate, String tdate, double bonus, double ot, double deduc, double bsalary) {
		super();
		this.rid = rid;
		this.empid = empid;
		this.fdate = fdate;
		this.tdate = tdate;
		this.bonus = bonus;
		this.ot = ot;
		this.deduc = deduc;
		this.bsalary = bsalary;
	}
	
	public Payroll() {
		// TODO Auto-generated constructor stub
	}

	

	public double calsalary(double Bouns, double OT, double Deduc, double bSalary) {
		Double nsal = 0.0;
		
		nsal = bSalary + OT + Bouns - Deduc;
		
		return nsal;
	}
 
	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public String getFdate() {
		return fdate;
	}
	public void setFdate(String fdate) {
		this.fdate = fdate;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public double getBonus() {
		return bonus;
	}
	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	public double getOt() {
		return ot;
	}
	public void setOt(double ot) {
		this.ot = ot;
	}
	public double getDeduc() {
		return deduc;
	}
	public void setDeduc(double deduc) {
		this.deduc = deduc;
	}
	public double getBsalary() {
		return bsalary;
	}
	public void setBsalary(double bsalary) {
		this.bsalary = bsalary;
	}
	public double getNetSalary() {
		return netSalary;
	}
	public void setNetSalary(double netSalary) {
		this.netSalary = netSalary;
	}
	
}
