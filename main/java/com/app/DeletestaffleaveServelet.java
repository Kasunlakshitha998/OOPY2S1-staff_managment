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

@WebServlet("/userDash/DeletestaffleaveServelet")
public class DeletestaffleaveServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DeletestaffleaveServelet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	connclass obj = new connclass();
            Connection conn =obj.getConnection();
            String query = "DELETE FROM `leave` WHERE Lid = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, id);

            int rowsDeleted = pstmt.executeUpdate();

            if (rowsDeleted > 0) {
                response.sendRedirect("leavestaffdisplay.jsp"); // Redirect to a page after successful deletion
            } else {
                response.getWriter().println("No record was deleted for ID: " + id);
            }

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred during the deletion process: " + e.getMessage());
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
