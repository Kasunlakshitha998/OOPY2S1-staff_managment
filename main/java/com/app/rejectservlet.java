package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.connclass;

/**
 * Servlet implementation class rejectservlet
 */
@WebServlet("/rejectservlet")
public class rejectservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public rejectservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int id = Integer.parseInt(request.getParameter("id"));

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            connclass obj = new connclass();
	            Connection conn =obj.getConnection();
	            String query = "UPDATE `leave` SET statues = 'Reject' WHERE Lid = ?";
	            PreparedStatement pstmt = conn.prepareStatement(query);
	            pstmt.setInt(1, id);

	            int rowsUpdated = pstmt.executeUpdate();

	            if (rowsUpdated > 0) {
	                response.sendRedirect("leavedisplay.jsp"); // Redirect to a page after successful update
	            } else {
	                response.getWriter().println("No record was updated for ID: " + id);
	            }

	            pstmt.close();
	            conn.close();
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	            response.getWriter().println("An error occurred during the update process: " + e.getMessage());
	        }
	    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
