package com.payroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/pay/DeletepayServlet")
public class DeletepayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			PayManager pm = new PayManager();
			boolean a =pm.deletePay(id);
			HttpSession session = request.getSession();
			if(a) {
				session.setAttribute("smsg", "Delete Successfully...");
				RequestDispatcher rd = request.getRequestDispatcher("Payroll.jsp");
				rd.forward(request, response);
			}
			else {
				session.setAttribute("fmsg", "Somthing wrong...");
				RequestDispatcher rd = request.getRequestDispatcher("Payroll.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
