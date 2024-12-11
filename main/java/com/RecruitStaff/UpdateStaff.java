package com.RecruitStaff;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Rec/UpdateStaff")
public class UpdateStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int staffID = Integer.parseInt(request.getParameter("staffID"));
	    String FullName =request.getParameter("FullName");
		String UserName =request.getParameter("UserName");
		String dateOfBirth =request.getParameter("dateOfBirth");
		String gender = request.getParameter("gender");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		String department =request.getParameter("department");
		String position =request.getParameter("position");
		String HireDate =request.getParameter("hireDate");
		String bankAccount =request.getParameter("bankAccount");
		String officeLocation =request.getParameter("officeLocation");
		String uType =request.getParameter("uType");
		String password =request.getParameter("Password");
		new Staff(staffID,FullName, UserName, dateOfBirth, gender, email, phone, address, department, position, HireDate, bankAccount, officeLocation, uType, password);
		
		boolean isTrue;
		
		isTrue = staffDButil.UpdateStaff(staffID,FullName, UserName, dateOfBirth, gender, email, phone, address, department, position, HireDate, bankAccount, officeLocation, uType, password);
		
		if(isTrue==true) {					
			RequestDispatcher dis = request.getRequestDispatcher("DisplayStaffList.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis = request.getRequestDispatcher("UnSucess.jsp");
			dis.forward(request, response);
		}
	}
	

}
