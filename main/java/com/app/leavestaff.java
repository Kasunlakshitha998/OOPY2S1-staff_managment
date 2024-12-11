package com.app;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.payroll.connclass;

public class leavestaff {

public List<Leave> getAlldetails(HttpServletRequest request){
		
		List<Leave> leave=new ArrayList<>();
		
		try {
			
			 HttpSession session = request.getSession();
		        int Id = (int) session.getAttribute("ID");
           
		        Class.forName("com.mysql.jdbc.Driver");
		        connclass obj = new connclass();
	            Connection conn =obj.getConnection();
	            Statement st = conn.createStatement();
	            String query = "SELECT * FROM `leave` WHERE SID = " + Id;

	            ResultSet rs = st.executeQuery(query);	
	            
	        	Leave le;
	        	
	        	while(rs.next()) {
	        		 int Lid= rs.getInt("Lid");
	                 int SID= rs.getInt("SID");
	        		 String ename=rs.getString("empname");
	                 String empemail=rs.getString("empemail");
	                 String empno=rs.getString("empno");
	                 String department=rs.getString("department");
	                 String leavetype=rs.getString("leavetype");
	                 String leaveto=rs.getString("leaveto");
	                 String leavefrom=rs.getString("leavefrom");
	                 String leavedescription=rs.getString("leavedescription");
	                 String statues=rs.getString("statues");
	                 
	                 le=new Leave(Lid,SID,ename,empemail,empno,department,leavetype,leaveto,leavefrom,leavedescription,statues);
	                 leave.add(le);
	        	}
	        	
	        	rs.close();
	        	conn.close();
		}
		
		
		catch(Exception e) {
			System.out.println(e);
			
		}
		
		
		return leave;
	}
	
	
	
}
