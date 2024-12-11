package com.Staff;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.payroll.connclass;

public class ShiftManager {

	public List<Shift> selectList() throws ClassNotFoundException {

		List<Shift> shifts = new ArrayList<>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String sql1 = "SELECT * FROM shift order by sID DESC";
			PreparedStatement pr = conn.prepareStatement(sql1);
			ResultSet rs = pr.executeQuery();
			Shift sh;
			while (rs.next()) {

				int id = rs.getInt("sID");
				String name = rs.getString("sname");
				String date = rs.getString("sdate");
				String sTime = rs.getString("stime");
				String eTime = rs.getString("etime");
				String Description = rs.getString("description");
				String Status = rs.getString("status");
				sh = new Shift(id, name, date, sTime, eTime, Description,Status);
				shifts.add(sh);
			}

			rs.close();
			pr.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return shifts;
	}

	public Shift EditUsersDetails(int id) throws ClassNotFoundException {

		Shift b=new Shift();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String sql1 = "SELECT * FROM shift Where sID =?";
			PreparedStatement pr = conn.prepareStatement(sql1);
			pr.setInt(1, id);
			ResultSet rs = pr.executeQuery();
			while (rs.next()) {

				String name = rs.getString("sname");
				String date = rs.getString("sdate");
				String sTime = rs.getString("stime");
				String eTime = rs.getString("etime");
				String Description = rs.getString("description");
				String Status = rs.getString("status");
				b = new Shift(id, name, date, sTime, eTime, Description,Status);
				
			}

			rs.close();
			pr.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return b;
	}
	
	public boolean updateShift(Shift b) {
		boolean a=false;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();
			
			String sql2 = "UPDATE shift SET sname=?, sdate=?, stime=?, etime=?, description=?, status=? WHERE sID=?";
			PreparedStatement pr = conn.prepareStatement(sql2);
			pr.setInt(7, b.getsID());
			pr.setString(1, b.getsName());
			pr.setString(2, b.getsDate());
			pr.setString(3, b.getsTime());
			pr.setString(4, b.geteTime());
			pr.setString(5, b.getDescription());
			pr.setString(6, b.getStatus());
			
			int i = pr.executeUpdate();
			if(i==1) {
				a=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
	public boolean deleteShift(int id) {
		boolean a=false;
		
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();
			
			String sql3 = "delete from shift where sID=?";
			PreparedStatement pr = conn.prepareStatement(sql3);
			pr.setInt(1, id);
			
			int i = pr.executeUpdate();
			if(i==1) {
				a=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	
	
	public List<AssignEmp> selectassignList() throws ClassNotFoundException {

		List<AssignEmp> as = new ArrayList<>();

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String sql1 = "SELECT * FROM shiftemp";
			PreparedStatement pr = conn.prepareStatement(sql1);
			ResultSet rs = pr.executeQuery();
			AssignEmp sh;
			while (rs.next()) {

				int id = rs.getInt("seid");
				int sid = rs.getInt("sid");
				int eid = rs.getInt("eid");
				
				sh = new AssignEmp(id,sid,eid);
				as.add(sh);
			}

			rs.close();
			pr.close();
			conn.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return as;
	}

}
