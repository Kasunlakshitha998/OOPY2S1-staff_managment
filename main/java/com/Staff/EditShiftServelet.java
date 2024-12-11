package com.Staff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Shift/EditShiftServelet")
public class EditShiftServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("sname");
			String date = request.getParameter("sdate");
			String sTime = request.getParameter("stime");
			String eTime = request.getParameter("etime");
			String Description = request.getParameter("description");
			String Status = request.getParameter("status");
			
			Shift sh = new Shift();
			sh.setsName(name);
			sh.setsDate(date);
			sh.setsTime(sTime);
			sh.seteTime(eTime);
			sh.setDescription(Description);
			sh.setsID(id);
			sh.setStatus(Status);
			
			ShiftManager sm = new ShiftManager();
			boolean a = sm.updateShift(sh);
			HttpSession session = request.getSession();
			if(a) {
				session.setAttribute("smsg", "Update Successfully...");
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
