<%@page import="com.Staff.Shift"%>
<%@page import="com.Staff.ShiftManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shift List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	background-color: #445f78;
}
</style>

</head>
<body>

	<!-- check user login -->
	<%
	response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("ID") == null) {

		response.sendRedirect("../login.jsp");
	}
	%>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card mt-5 p-3 shadow">
					<h1 class="text-center">Delete SHIFT</h1>

					<%
					int id = Integer.parseInt(request.getParameter("id"));
					ShiftManager sh1 = new ShiftManager();
					Shift us = sh1.EditUsersDetails(id);
					%>

					<form action="DeleteShiftServlet" method="GET">
						<div class="form-group">
							<input type="hidden" name="id" value="<%=us.getsID()%>">

							<label for="shiftName">Shift Name:</label> <input type="text"
								class="form-control" name="sname" value="<%=us.getsName()%>"
								required readonly>
						</div>

						<div class="form-group">
							<label for="sdate">Shift Date:</label> <input type="date"
								class="form-control" name="sdate" value="<%=us.getsDate()%>"
								required readonly>
						</div>

						<div class="form-group">
							<label for="startTime">Start Time:</label> <input type="time"
								class="form-control" name="stime" value="<%=us.getsTime()%>"
								required readonly>
						</div>

						<div class="form-group">
							<label for="endTime">End Time:</label> <input type="time"
								class="form-control" name="etime" value="<%=us.geteTime()%>"
								required readonly>
						</div>

						<div class="form-group">
							<label for="description">Description:</label> <input type="text"
								class="form-control" name="description"
								value="<%=us.getDescription()%>" required readonly>
						</div>

						<div class="form-group text-center">
							<a href="Shift.jsp" class="btn btn-outline-primary" role="button"
								aria-pressed="true">Cancel</a>
							<button class="btn btn-primary" type="submit" name="submit">Delete</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>