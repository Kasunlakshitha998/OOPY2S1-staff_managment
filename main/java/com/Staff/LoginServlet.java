package com.Staff;

import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payroll.connclass;

@WebServlet("/loginservlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {


			Class.forName("com.mysql.jdbc.Driver");
			connclass obj = new connclass();
            Connection conn =obj.getConnection();

			String userName = request.getParameter("Username");
			String password = request.getParameter("Password");

			String sql1 = "SELECT * FROM userdetails WHERE uName=? and pass=?";

			PreparedStatement ps = conn.prepareStatement(sql1);

			ps.setString(1, userName);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				
				int uid = rs.getInt(1);
				String name = rs.getString(2);
				String type = rs.getString(4);
				
				HttpSession session = request.getSession();
		
				
				if( "user".equals(type) ) {
					
					session.setAttribute("ID", uid);
					session.setAttribute("uname", name);
					RequestDispatcher rd = request.getRequestDispatcher("userDashboard.jsp");
					rd.forward(request, response);
					
				}
				else if("admin".equals(type)) {
					
					session.setAttribute("ID", uid);
					session.setAttribute("uname", name);
					RequestDispatcher rd = request.getRequestDispatcher("adminDashboard.jsp");
					rd.forward(request, response);
					
				}
				else {
					
					request.setAttribute("error", "Invalid user");
					RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
					rd.forward(request, response);
				}

			} else {

				request.setAttribute("error", "Invalid user name and password");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
