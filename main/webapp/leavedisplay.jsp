<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.app.leaves" %>
<%@ page import="java.util.List" %>
<%@ page import="com.app.Leave" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="Header.jsp" />
    <title>Leave Data</title>
    <style>
        /* Base styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        h1 {
            text-align: center;
            background-color: #337ab7;
            color: #fff;
            padding: 20px;
            margin: 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            border: 1px solid #ddd;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        tr:nth-child(even) {
            background-color: #f5f5f5;
        }

        tr:nth-child(odd) {
            background-color: #e0e0e0;
        }

        th {
            background-color: #337ab7;
            color: #fff;
            font-weight: bold;
        }

        tr:hover {
            background-color: #ddd;
        }

        /* Custom CSS for specific elements */
        a {
            text-decoration: none;
        }

        .update-button, .delete-button {
            background-color: #337ab7;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none; /* Remove underline for links */
        }

        .delete-button {
            background-color: #d9534f;
        }

        /* Styling for the inline actions buttons */
        .inline-actions {
            display: flex;
            align-items: center;
        }

        .inline-actions button {
            background-color: #337ab7;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
            text-decoration: none; /* Remove underline for links */
        }

        .inline-actions button.delete-button {
            background-color: #d9534f;
        }
        .inline-actions .update-button {
        margin-right: 10px; /* Adjust the value as needed */
    }
    </style>
</head>
<body>
    <h1>Leave Data</h1>
    <table border="1">
        <tr>
            <th>Lid</th>
            <th>SID</th>
            <th>Employee Name</th>
            <th>Employee Email</th>
            <th>Employee no</th>
            <th>Department</th>
            <th>Leave Type</th>
            <th>Leave TO</th>
            <th>Leave From</th>
            <th>Leave Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
        leaves ls = new leaves();
        List<Leave> list = ls.getAlldetails();
        for (Leave l : list) {
        %>
        <tr>
            <td><%=l.getSid() %></td>
            <td><%=l.getId() %></td>
            <td><%=l.getEmpName() %></td>
            <td><%=l.getEmpEmail() %></td>
            <td><%=l.getEmpno() %></td>
            <td><%=l.getDepartment() %></td>
            <td><%=l.getLeaveType() %></td>
            <td><%=l.getLeaveTo() %></td>
            <td><%=l.getLeaveFrom() %></td>
            <td><%=l.getLeaveDescription() %></td>
            <td><%=l.getStatus() %></td>
            <td class="inline-actions">
                <a href="approveservlet?id=<%=l.getSid()%>" class="update-button">Approve</a>
                <a href="rejectservlet?id=<%=l.getSid()%>" class="delete-button">Reject</a>
            </td>
        </tr>
        <%
        }
        %> 
    </table>
<jsp:include page="footer.jsp" />
