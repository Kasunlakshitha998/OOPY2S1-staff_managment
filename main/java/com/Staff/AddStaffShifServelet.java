package com.Staff;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.payroll.connclass;

@WebServlet("/Shift/AddStaffShiftServelet")
public class AddStaffShifServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			connclass obj = new connclass();
			Connection conn = obj.getConnection();

			int sid = Integer.parseInt(request.getParameter("sid"));
			int eid = Integer.parseInt(request.getParameter("eid"));

			String sql1 = "INSERT INTO shiftemp(sid,eid) VALUES (?, ?)";
			PreparedStatement pr = conn.prepareStatement(sql1);
			pr.setInt(2, eid);
			pr.setInt(1, sid);
			int rs = pr.executeUpdate();

				
				if (rs == 1) {
					request.setAttribute("smsg", "Successfully Add....");
					RequestDispatcher rd = request.getRequestDispatcher("Shift.jsp");
					rd.forward(request, response);

				} else {
					request.setAttribute("error", "Somthing wrong....");
					RequestDispatcher rd = request.getRequestDispatcher("Shift.jsp");
					rd.forward(request, response);
				}			

		} catch (Exception e) {

			System.out.println(e);
		}

	}

}
