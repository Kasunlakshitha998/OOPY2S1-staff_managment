package com.RecruitStaff;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Rec/RecruitStaff")
public class RecruitStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String Fullname = req.getParameter("FullName");
		String UserName = req.getParameter("UserName");
		String dateofBirth = req.getParameter("dateOfBirth");
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String department = req.getParameter("department");
		String position = req.getParameter("position");
		String hireDate = req.getParameter("hireDate");
		String bankAccount = req.getParameter("bankAccount");
		String officeLocation = req.getParameter("officeLocation");
		String uType = req.getParameter("uType");
		String pass = req.getParameter("Password");
		

		boolean isTrue;
		isTrue = RecriutStaffDButil.staffadd( Fullname, UserName, dateofBirth, gender, email, phone, address,
				department, position, hireDate, bankAccount, officeLocation, uType ,pass);
		if (isTrue == true) {
			RequestDispatcher dis = req.getRequestDispatcher("/Rec/DisplayStaffList.jsp");
			dis.forward(req, resp);
		} else {
			RequestDispatcher dis = req.getRequestDispatcher("Unsucess.jsp");
			dis.forward(req, resp);
		}

	}

}
