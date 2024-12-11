package com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.payroll.connclass;

/**
 * Servlet implementation class leaveServlet
 */
@WebServlet("/userDash/leaveServlet")
public class leaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public leaveServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		int userId = (int) session.getAttribute("ID");
		String empname = (String) session.getAttribute("uname");

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		// String empname=request.getParameter("empname");
		String empemail = request.getParameter("email");
		String empno = request.getParameter("contactno");
		String Department = request.getParameter("Department");
		String Leavetype = request.getParameter("leaveType");
		String Leaveto = request.getParameter("Leaveto");
		String Leavefrom = request.getParameter("leavefrom");
		String leaveDescription = request.getParameter("leavedescription");
		String s = "pending";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connclass obj = new connclass();
			Connection conn = obj.getConnection();
			java.sql.Statement st = conn.createStatement();
			String query = "INSERT INTO `leave` (SID, empname, empemail, empno, department, leavetype, leaveto, leavefrom, leavedescription, statues) "
					+ "VALUES ('" + userId + "', '" + empname + "', '" + empemail + "', '" + empno + "', '" + Department
					+ "', '" + Leavetype + "', '" + Leaveto + "', '" + Leavefrom + "', '" + leaveDescription + "', '"
					+ s + "')";

			int rs = st.executeUpdate(query);

			if (rs > 0) {

				out.println("<html><body>");
				out.println("<script type='text/javascript'>");
				out.println("alert('Submission was successful!');");
				out.println("window.location.href='user.html';");
				out.println("</script>");
				out.println("</body></html>");
				RequestDispatcher dis = request.getRequestDispatcher("leve.jsp");
				dis.forward(request, response);
			} else {
				out.print("<h1>unsuccuss</h1>");
			}

			// RequestDispatcher dis = request.getRequestDispatcher("user.html");
			// dis.forward(request, response);
		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println(e);
			// out.print("<h1>Insert failed:if you want to apply a another leave please
			// delete previous request </h1>");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
