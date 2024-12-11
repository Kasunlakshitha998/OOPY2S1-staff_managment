<%@page import="java.util.List"%>
<%@page import="com.Staff.Shift"%>
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
		<h1>Shift List</h1>
	</div>

	<div id="ta" class="w3-container">
		<div class="w3-center">
			<c:if test="${not empty smsg}">
				<div class="w3-panel w3-green">
					<h4 id="smsg">${smsg}</h4>
				</div>
				<c:remove var="smsg" scope="session" />
			</c:if>
			<c:if test="${not empty requestScope.error}">
				<p style="color: red">${requestScope.error}</p>
			</c:if>
			<c:if test="${not empty fmsg}">
				<div class="w3-panel w3-red">
					<h4 id="fmsg">${fmsg}</h4>
				</div>
				<c:remove var="fmsg" scope="session" />
			</c:if>

			<script>
				setTimeout(
						function() {
							document.getElementById("smsg").style.display = "none";
							document.getElementById("fmsg").style.display = "none";
							document.getElementById("requestScope.error").style.display = "none";
						}, 6000); //6s
			</script>


			<div class="container mt-4 w3-responsive">
				<table class="w3-table-all w3-hoverable">
					<thead>
						<tr class="w3-green w3-large w3-sticky">
							<th>ID</th>
							<th>Name</th>
							<th>Date</th>
							<th>Start Time</th>
							<th>End Time</th>
							<th>Description</th>
							<th>Status</th>
							<th>Action</th>
							<th>Assign Staff</th>
						</tr>
					</thead>
					<tbody>
						<%
						ShiftManager shm = new ShiftManager();
						List<Shift> list = shm.selectList();
						for (Shift s : list) {
						%>
						<tr>
							<td><%=s.getsID()%></td>
							<td><%=s.getsName()%></td>
							<td><%=s.getsDate()%></td>
							<td><%=s.getsTime()%></td>
							<td><%=s.geteTime()%></td>
							<td><%=s.getDescription()%></td>
							<td><%=s.getStatus()%></td>
							<td><a href="EditShift.jsp?id=<%=s.getsID()%>"
								class="btn btn-primary btn-md">Edit</a> <a
								href="DeleteShift.jsp?id=<%=s.getsID()%>"
								class="btn btn-danger btn-md">Delete</a></td>
							<td><a href="AddStaff.jsp?id=<%=s.getsID()%>"
							
							<%if ("pending".equals(s.getStatus())) 
							{%>
								style="display: inline;" 
							<%}
							else 
							{%> 
								style="display: none;"
							<%}%> class="w3-button w3-circle w3-black w3-hover-red">+</a></td>
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