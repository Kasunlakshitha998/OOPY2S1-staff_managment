package com.sDash;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.payroll.Payroll;
import com.payroll.connclass;

public class SalaryManage {
	public List<Payroll> salaryList(int id) throws ClassNotFoundException {

		List<Payroll> pay = new ArrayList<>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();
			
			String sql1 = "SELECT * FROM payroll Where empid=?";
			PreparedStatement pr = conn.prepareStatement(sql1);
			pr.setInt(1, id);
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
}
