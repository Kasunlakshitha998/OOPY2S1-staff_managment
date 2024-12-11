package com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.payroll.connclass;

@WebServlet("/userDash/leavestaffupdateservelet")
public class leavestaffupdateservelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public leavestaffupdateservelet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        int LeaveID = Integer.parseInt(request.getParameter("leaveID"));
        int empID = Integer.parseInt(request.getParameter("EmpID"));
        String empname = request.getParameter("empname");
        String empemail = request.getParameter("email");
        String empno = request.getParameter("contactno");
        String Department = request.getParameter("Department");
        String Leavetype = request.getParameter("leaveType");
        String Leaveto = request.getParameter("Leaveto");
        String Leavefrom = request.getParameter("leavefrom");
        String leaveDescription = request.getParameter("leavedescription");
        String s = "pending";  
        new Leave(LeaveID, empID, empname, empemail,empno, Department, Leavetype, Leaveto, Leavefrom, leaveDescription);
        PreparedStatement pstmt = null;

        try {
        	Class.forName("com.mysql.jdbc.Driver");
        	connclass obj = new connclass();
            Connection conn =obj.getConnection();
            String query = "UPDATE `leave` SET SID=?, empname=?, empemail=?, empno=?, department=?, leavetype=?, leaveto=?, leavefrom=?, leavedescription=?, statues=? WHERE Lid=?";
            pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, empID);
            pstmt.setString(2, empname);
            pstmt.setString(3, empemail);
            pstmt.setString(4, empno);
            pstmt.setString(5, Department);
            pstmt.setString(6, Leavetype);
            pstmt.setString(7, Leaveto);
            pstmt.setString(8, Leavefrom);
            pstmt.setString(9, leaveDescription);
            pstmt.setString(10, s);
            pstmt.setInt(11, LeaveID);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                out.println("<html><body>");
                out.println("<script type='text/javascript'>");
                out.println("alert('Submission was successful!');");
                out.println("window.location.href='leavestaffdisplay.jsp';");
                out.println("</script>");
                out.println("</body></html>");
            } else {
                out.print("<h1>unsuccessful</h1>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
