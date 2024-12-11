package com.Staff;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payroll.connclass;

@WebServlet("/Shift/AddShiftServelet")
public class AddShiftServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String sName = request.getParameter("sname");
			String sDate = request.getParameter("sdate");
	        String sTime = request.getParameter("stime");
	        String eTime = request.getParameter("etime");
	        String description = request.getParameter("description");
	        String Status = request.getParameter("status");
			
	        String sql1 = "INSERT INTO Shift(sname, sdate, stime, etime, description, status) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement pr = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS);
            pr.setString(1, sName);
            pr.setString(2, sDate);
            pr.setString(3, sTime);
            pr.setString(4, eTime);
            pr.setString(5, description);
            pr.setString(6, Status);
            int rs = pr.executeUpdate();
            
            if(rs>0) {
            	 ResultSet rset = pr.getGeneratedKeys();
            	if(rset.next()) {
            		
            		int sid = rset.getInt(1);
                	HttpSession session = request.getSession();
                	session.setAttribute("ID", sid);
                	RequestDispatcher rd = request.getRequestDispatcher("Shift.jsp");
    				rd.forward(request, response);
                	
                }else {
                	request.setAttribute("error", "Invalid");
                	RequestDispatcher rd = request.getRequestDispatcher("AddNewShift.jsp");
                	rd.forward(request, response);
                }
            	
            }
            else {
            	request.setAttribute("error", "Invalid");
            	RequestDispatcher rd = request.getRequestDispatcher("AddNewShift.jsp");
            	rd.forward(request, response);
            }			
						
		}
		catch (Exception e) {
			
			System.out.println(e);
		}
				
	}

}
