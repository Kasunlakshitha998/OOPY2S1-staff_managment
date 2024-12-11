package com.RecruitStaff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.payroll.connclass;

public class staffDButil {
	
	private static ResultSet rs = null;
	public static boolean isSucess;

	// view stored data
	public List<Staff> getstfdetails() {

		List<Staff> stf = new ArrayList<>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
			Connection conn = obj.getConnection();
			String sql = "select * From staffadd";
			PreparedStatement pr = conn.prepareStatement(sql);
			rs = pr.executeQuery();
			Staff s1;
			while (rs.next()) {
				int staffID = rs.getInt(1);
				String FullName = rs.getString(2);
				String UserName1 = rs.getString(3);
				String dateOfBirth = rs.getString(4);
				String gender = rs.getString(5);
				String email = rs.getString(6);
				String phone = rs.getString(7);
				String address = rs.getString(8);
				String department = rs.getString(9);
				String position = rs.getString(10);
				String HireDate = rs.getString(11);
				String bankAccount = rs.getString(12);
				String officeLocation = rs.getString(13);
				String uType = rs.getString(14);
				String password1 = rs.getString(15);

				s1 = new Staff(staffID, FullName, UserName1, dateOfBirth, gender, email, phone, address,
						department, position, HireDate, bankAccount, officeLocation, uType, password1);
				stf.add(s1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stf;

	}
	public Staff EditUsers(int id) throws ClassNotFoundException {

		Staff stf = new Staff();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
			Connection conn = obj.getConnection();
			String sql = "select * From staffadd Where EmployeeID ='" + id + "' ";
			PreparedStatement pr = conn.prepareStatement(sql);
			rs = pr.executeQuery();
			if (rs.next()) {
				int staffID = rs.getInt(1);
				String FullName = rs.getString(2);
				String UserName1 = rs.getString(3);
				String dateOfBirth = rs.getString(4);
				String gender = rs.getString(5);
				String email = rs.getString(6);
				String phone = rs.getString(7);
				String address = rs.getString(8);
				String department = rs.getString(9);
				String position = rs.getString(10);
				String HireDate = rs.getString(11);
				String bankAccount = rs.getString(12);
				String officeLocation = rs.getString(13);
				String uType = rs.getString(14);
				String password1 = rs.getString(15);

				stf = new Staff(staffID, FullName, UserName1, dateOfBirth, gender, email, phone, address,
						department, position, HireDate, bankAccount, officeLocation, uType, password1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stf;
	}

	// update detalis

	public static boolean UpdateStaff(int staffID, String FullName, String UserName, String dateOfBirth, String gender, String email,
			String phone, String address, String department, String position, String HireDate, String bankAccount,
			String officeLocation, String uType, String password ) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
			Connection conn = obj.getConnection();
			
			String sql = "update staffadd set EmployeeID= ?, FullName ='" + FullName + "', UserName = '" + UserName
					+ "', dateOfBirth = '" + dateOfBirth + "', gender ='" + gender + "', email = '" + email
					+ "' , phone ='" + phone + "', address='" + address + "', department ='" + department
					+ "', position ='" + position + "', HireDate = '" + HireDate + "', bankAccount= '" + bankAccount
					+ "', officeLocation = '" + officeLocation + "' ,uType ='" + uType + "', pass ='" + password
					+ "'" + "where EmployeeID= ? ";
			PreparedStatement pr = conn.prepareStatement(sql);
			pr.setInt(1, staffID);
			pr.setInt(2, staffID);
			int rs = pr.executeUpdate();

			if (rs > 0) {
				isSucess = true;

			} else {
				isSucess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSucess;
	}

	// detele Staff details

	public static boolean DeleteStaff(int staffid) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
			Connection conn = obj.getConnection();
			Statement stmt = conn.createStatement();
			stmt = conn.createStatement();
			String sql = "delete from staffadd where EmployeeID='" + staffid + "'";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSucess = true;

			} else {
				isSucess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSucess;
	}
}
