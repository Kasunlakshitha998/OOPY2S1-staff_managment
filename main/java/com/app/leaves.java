package com.app;

import java.util.List;

import com.payroll.connclass;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class leaves {

	public List<Leave> getAlldetails() {

		List<Leave> leave = new ArrayList<>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();
			Statement st = conn.createStatement();
			String query = "SELECT * FROM `leave`"; // Corrected SQL query
			ResultSet rs = st.executeQuery(query);

			Leave le;

			while (rs.next()) {
				int Lid = rs.getInt("Lid");
				int SID = rs.getInt("SID");
				String ename = rs.getString("empname");
				String empemail = rs.getString("empemail");
				String empno = rs.getString("empno");
				String department = rs.getString("department");
				String leavetype = rs.getString("leavetype");
				String leaveto = rs.getString("leaveto");
				String leavefrom = rs.getString("leavefrom");
				String leavedescription = rs.getString("leavedescription");
				String statues = rs.getString("statues");

				le = new Leave(Lid, SID, ename, empemail, empno, department, leavetype, leaveto, leavefrom,
						leavedescription, statues);
				leave.add(le);
			}

			rs.close();
			conn.close();
		}

		catch (Exception e) {
			System.out.println(e);

		}

		return leave;
	}

	public Leave editleavedetails(int id) {
		
		Leave l = new Leave();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();
			
			String sql1 = "SELECT * FROM `leave` WHERE Lid = ?";
			PreparedStatement pr = conn.prepareStatement(sql1);
			pr.setInt(1, id);

			ResultSet rs = pr.executeQuery();
			if (rs.next()) {
				int Lid = rs.getInt("Lid");
				int SID = rs.getInt("SID");
				String ename = rs.getString("empname");
				String empemail = rs.getString("empemail");
				String empno = rs.getString("empno");
				String department = rs.getString("department");
				String leavetype = rs.getString("leavetype");
				String leaveto = rs.getString("leaveto");
				String leavefrom = rs.getString("leavefrom");
				String leavedescription = rs.getString("leavedescription");
				String statues = rs.getString("statues");
				l = new Leave(Lid, SID, ename, empemail, empno, department, leavetype, leaveto, leavefrom,
						leavedescription, statues);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return l;
	}

}
