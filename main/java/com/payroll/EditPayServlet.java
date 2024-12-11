package com.payroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/pay/EditPayServlet")
public class EditPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {

			int id = Integer.parseInt(request.getParameter("id"));
			int empid = Integer.parseInt(request.getParameter("eid"));
			String fdate = request.getParameter("fdate");
	        String tdate = request.getParameter("tdate");
	        double bonus = Double.parseDouble(request.getParameter("bonus"));
	        double ot = Double.parseDouble(request.getParameter("ot"));
	        double deduc = Double.parseDouble(request.getParameter("deduction"));
	        double bsalary = Double.parseDouble(request.getParameter("bsalary"));
			
			Payroll pa = new Payroll();
			pa.setRid(id);
			pa.setEmpid(empid);
			pa.setFdate(fdate);
			pa.setTdate(tdate);
			pa.setBonus(bonus);
			pa.setOt(ot);
			pa.setDeduc(deduc);
			pa.setBsalary(bsalary);
			
			PayManager pm = new PayManager();
			boolean a = pm.updatePay(pa);
			HttpSession session = request.getSession();
			if(a) {
				session.setAttribute("smsg", "Update Successfully...");
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
