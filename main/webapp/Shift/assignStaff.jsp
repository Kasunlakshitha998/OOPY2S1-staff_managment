<%@page import="java.util.List"%>
<%@page import="com.Staff.AssignEmp"%>
<%@page import="com.Staff.ShiftManager"%>
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

<style type="text/css">
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

h1 {
	text-align: center;
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
<div id="tar" class="w3-animate-bottom w3-table-all w3-card-4">

	<div class="box">
		<h1>Shift Assign List</h1>
	</div>

	<div id="ta" class="w3-container">
		<div class="w3-center">

			<div class="container mt-4 w3-responsive">
				<table class="w3-table-all w3-hoverable">
					<thead>
						<tr class="w3-green w3-large w3-sticky">
							<th>ID</th>
							<th>Shift ID</th>
							<th>Staff ID</th>
						</tr>
					</thead>
					<tbody>
						<%
						ShiftManager shm = new ShiftManager();
						List<AssignEmp> list = shm.selectassignList();
						for (AssignEmp s : list) {
						%>
						<tr>
							<td><%=s.getShAssignIdD()%></td>
							<td><%=s.getShiftID()%></td>
							<td><%=s.getEmpID()%></td>
		
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
			</div>

		</div>
	</div>

</div>
<jsp:include page="footer.jsp" />