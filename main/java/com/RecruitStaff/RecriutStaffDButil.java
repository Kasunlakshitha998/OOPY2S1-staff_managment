package com.RecruitStaff;

import com.payroll.connclass;
import java.sql.Statement;
import java.sql.Connection;


public class RecriutStaffDButil {
	

	public static boolean staffadd(String fullname, String userName, String dateofBirth, String gender, String email, String phone, String address, String department, String position, String hireDate, String bankAccount, String officeLocation, String uType, String pass ) {

	    boolean isSuccess = false;

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");
	        connclass obj = new connclass();
	        Connection conn = obj.getConnection();
	        Statement stmt = conn.createStatement();

	        String sql = "INSERT INTO staffadd (Fullname, UserName, dateofBirth, gender, email, phone, address, department, position, hireDate, bankAccount, officeLocation, uType ,pass) " +
	                     "VALUES ('" + fullname + "','" + userName + "', '" + dateofBirth + "','" + gender + "','" + email + "','" + phone + "','" + address + "','" + department + "','" + position + "','" + hireDate + "','" + bankAccount + "','" + officeLocation + "','" + uType + "','" + pass + "')";

	        int rs = stmt.executeUpdate(sql);

	        if (rs > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}
		

}
