package com.payroll;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class PayManager {

	public List<Payroll> PayList() throws ClassNotFoundException {

		List<Payroll> pay = new ArrayList<>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String sql1 = "SELECT * FROM payroll";
			PreparedStatement pr = conn.prepareStatement(sql1);
			ResultSet rs = pr.executeQuery();
			Payroll py;
			while (rs.next()) {

				int rid = rs.getInt("Ref");
				int eid = rs.getInt("empid");
				String fdate = rs.getString("Date_from");
				String tdate = rs.getString("Date_to");
				double bonus = rs.getDouble("bonus");
				double OT = rs.getDouble("OT");
				double Deduc = rs.getDouble("deduction");
				double bsalary = rs.getDouble("basicSalary");
				double netsalary = rs.getDouble("netSalary");

				py = new Payroll(rid, eid, fdate, tdate, bonus, OT, Deduc, bsalary, netsalary);
				pay.add(py);
			}

			rs.close();
			pr.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return pay;
	}

	public Payroll EditPay(int id) throws ClassNotFoundException {

		Payroll p = new Payroll();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String sql1 = "SELECT * FROM payroll Where Ref =?";
			PreparedStatement pr = conn.prepareStatement(sql1);
			pr.setInt(1, id);
			ResultSet rs = pr.executeQuery();
			while (rs.next()) {
				int empid = rs.getInt("empid");
				String fdate = rs.getString("Date_from");
				String tdate = rs.getString("Date_to");
				double bonus = rs.getDouble("bonus");
				double ot = rs.getDouble("OT");
				double deduc = rs.getDouble("deduction");
				double bsalary = rs.getDouble("basicSalary");
				p = new Payroll(id, empid, fdate, tdate, bonus, ot, deduc, bsalary);

			}

			rs.close();
			pr.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return p;
	}

	public boolean updatePay(Payroll b) {
		boolean a = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();
			int id = b.getRid();
			Payroll py = new Payroll();
			double netSalary = py.calsalary(b.getBonus(), b.getOt(), b.getDeduc(), b.getBsalary());
			
			String sql2 = "UPDATE payroll SET empid=?, Date_from=?, Date_to=?, bonus=?, OT=?, deduction=?, basicSalary=?, netSalary =? Where Ref = ?";
			PreparedStatement pr = conn.prepareStatement(sql2);
			pr.setInt(9, id);
			pr.setInt(1, b.getEmpid());
			pr.setString(2, b.getFdate());
			pr.setString(3, b.getTdate());
			pr.setDouble(4, b.getBonus());
			pr.setDouble(5, b.getOt());
			pr.setDouble(6, b.getDeduc());
			pr.setDouble(7, b.getBsalary());
			pr.setDouble(8, netSalary);
			
			int i = pr.executeUpdate();
			if (i == 1) {
				a = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

	public boolean deletePay(int id) {
		boolean a = false;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "0000");

			String sql3 = "delete from payroll where Ref=?";
			PreparedStatement pr = conn.prepareStatement(sql3);
			pr.setInt(1, id);

			int i = pr.executeUpdate();
			if (i == 1) {
				a = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}

}
