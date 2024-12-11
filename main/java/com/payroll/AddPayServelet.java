package com.payroll;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pay/AddPayServelet")
public class AddPayServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			int empid = Integer.parseInt(request.getParameter("eid"));
			String fdate = request.getParameter("fdate");
	        String tdate = request.getParameter("tdate");
	        double bonus = Double.parseDouble(request.getParameter("bonus"));
	        double ot = Double.parseDouble(request.getParameter("ot"));
	        double deduc = Double.parseDouble(request.getParameter("deduction"));
	        double bsalary = Double.parseDouble(request.getParameter("bsalary"));
	        
	        Payroll py = new Payroll();
	        
	        double netSalary = py.calsalary(bonus, ot, deduc, bsalary);
			
	        String sql1 = "INSERT INTO payroll(empid, Date_from, Date_to, bonus, OT, deduction, basicSalary, netSalary) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pr = conn.prepareStatement(sql1);
            pr.setInt(1, empid);
            pr.setString(2, fdate);
            pr.setString(3, tdate);
            pr.setDouble(4, bonus);
            pr.setDouble(5, ot);
            pr.setDouble(6, deduc);
            pr.setDouble(7, bsalary);
            pr.setDouble(8, netSalary);
            int rs = pr.executeUpdate();
                      	 
            	if(rs == 1) {
            		
                	RequestDispatcher rd = request.getRequestDispatcher("Payroll.jsp");
    				rd.forward(request, response);
                	
                }else {
                	request.setAttribute("error", "Invalid");
                	RequestDispatcher rd = request.getRequestDispatcher("AddPayroll.jsp");
                	rd.forward(request, response);
                }            				
						
		}
		catch (Exception e) {
			
			System.out.println(e);
		}
	}

}
