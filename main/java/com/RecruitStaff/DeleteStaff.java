package com.RecruitStaff;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/Rec/DeleteStaff")
public class DeleteStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int staffID = Integer.parseInt(request.getParameter("id"));
		
		boolean IsTrue =staffDButil.DeleteStaff(staffID);
		
		if(IsTrue== true) {
			RequestDispatcher dis = request.getRequestDispatcher("/Rec/DisplayStaffList.jsp");
			dis.forward(request, response);
		}
		else {
			
			RequestDispatcher dis = request.getRequestDispatcher("UnSucess.jsp");
			dis.forward(request, response);
		}
       
		
	}

}
