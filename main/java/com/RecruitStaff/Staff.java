package com.RecruitStaff;

public class Staff {
	
	private int staffID;
	private String FullName;
	private String UserName;
	 private String dateOfBirth;
	 private String gender;
	 private String email;
	 private String phone;
	 private String address;
	 private String department;
	 private String position;
	 private  String HireDate;
	 private String bankAccount;
	 private String officeLocation;
	 private String uType;
	 private String password;
	 
	 public String getFullName() {
		return FullName;
	}

	public void setFullName(String fullName) {
		FullName = fullName;
	}

	public String getUserName() {
		return UserName;
	}

	public void setUserName(String userName) {
		UserName = userName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getHireDate() {
		return HireDate;
	}

	public void setHireDate(String hireDate) {
		HireDate = hireDate;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getOfficeLocation() {
		return officeLocation;
	}

	public void setOfficeLocation(String officeLocation) {
		this.officeLocation = officeLocation;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	 public Staff(int staffID,String fullName, String userName, String dateOfBirth, String gender, String email, String phone,
			String address, String department, String position, String hireDate, String bankAccount,
			String officeLocation, String uType, String password) {
		
		 this.staffID =staffID;
		this.FullName = fullName;
		this.UserName = userName;
		this.dateOfBirth = dateOfBirth;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.department = department;
		this.position = position;
		HireDate = hireDate;
		this.bankAccount = bankAccount;
		this.officeLocation = officeLocation;
		this.uType = uType;
		this.password = password;
	}


	public Staff() {
		// TODO Auto-generated constructor stub
	}

	public int getStaffID() {
		return staffID;
	}

	public void setStaffID(int staffID) {
		this.staffID = staffID;
	}

	public String getuType() {
		return uType;
	}

	public void setuType(String uType) {
		this.uType = uType;
	}

	
}
