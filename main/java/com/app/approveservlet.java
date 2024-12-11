package com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.connclass;

@WebServlet("/approveservlet")
public class approveservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public approveservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	connclass obj = new connclass();
            Connection conn =obj.getConnection();
            String query = "UPDATE `leave` SET statues = 'Approve' WHERE Lid = ?";
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
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred during the update process: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
