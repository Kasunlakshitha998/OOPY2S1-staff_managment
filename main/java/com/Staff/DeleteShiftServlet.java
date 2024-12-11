package com.Staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Shift/DeleteShiftServlet")
public class DeleteShiftServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			ShiftManager sh = new ShiftManager();
			boolean a =sh.deleteShift(id);
			HttpSession session = request.getSession();
			if(a) {
				session.setAttribute("smsg", "Delete Successfully...");
				RequestDispatcher rd = request.getRequestDispatcher("Shift.jsp");
				rd.forward(request, response);
			}
			else {
				session.setAttribute("fmsg", "Somthing wrong...");
				RequestDispatcher rd = request.getRequestDispatcher("Shift.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
