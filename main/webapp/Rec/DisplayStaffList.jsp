<%@page import="java.util.List"%>
<%@page import="com.RecruitStaff.Staff"%>
<%@page import="com.RecruitStaff.staffDButil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style>
.container {
	padding: 20px;
}
#ta {
	max-height: 500px;
	margin-bottom: 15px;
	margin-top: 0px;
	overflow-y: scroll;
	padding: 0px;
	font-family: 'Roboto Slab', serif;
}

#tar {
	background-color: #1f354a;
	padding: 10px;
	margin-top: 40px;
	margin-left: 20px;
	margin-right: 20px;
	
}

.box {
	color: white;
}

.head{
	color: white;
}

</style>

<jsp:include page="Header.jsp" />

<!-- check user login -->
<%
response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

if (session.getAttribute("ID") == null) {

	response.sendRedirect("login.jsp");
}
%>

<div id="tar" class="container">
	<h2 id="head" class="text-center mt-4">Staff Details</h2>
	<a href="Recruitstaff.jsp"><button class="btn btn-primary">ADD Rec</button></a>
	<div class="table-responsive">
		<table class="w3-table-all w3-hoverable">
			<tr class="w3-green w3-large w3-sticky">
				<th>Staff ID</th>
				<th>Full Name</th>
				<th>User Name</th>
				<th>Date of Birth</th>
				<th>Gender</th>
				<th>Email</th>
				<th>Contact No</th>
				<th>Address</th>
				<th>Department</th>
				<th>Position</th>
				<th>Hire Date</th>
				<th>Bank Account</th>
				<th>Office Location</th>
				<th>User Type</th>
				<th>Password</th>
				<th>Action</th>
				
					</tr>
					<%
					staffDButil ul = new staffDButil();
					List<Staff> list = ul.getstfdetails();
					for (Staff s : list) {
					%>
					<tr>
						<td><%=s.getStaffID()%></td>
						<td><%=s.getFullName()%></td>
						<td><%=s.getUserName()%></td>
						<td><%=s.getDateOfBirth()%></td>
						<td><%=s.getGender()%></td>
						<td><%=s.getEmail()%></td>
						<td><%=s.getPhone()%></td>
						<td><%=s.getAddress()%></td>
						<td><%=s.getDepartment()%></td>
						<td><%=s.getPosition()%></td>
						<td><%=s.getHireDate()%></td>
						<td><%=s.getBankAccount()%></td>
						<td><%=s.getOfficeLocation()%></td>
						<td><%=s.getuType()%></td>
						<td><%=s.getPassword()%></td>
						
						<td><a href="EditStaff.jsp?id=<%=s.getStaffID()%>"
						class="btn btn-primary btn-md">Edit</a> <a
						href="DeleteStaff?id=<%=s.getStaffID()%>"
						class="btn btn-danger btn-md">Delete</a></td>
					</tr>
					<%
					}
					%>
			</table>
		</div>
	</div>

<jsp:include page="footer.jsp" />