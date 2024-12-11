<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD Shift</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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

	<div class="w3-container w3-animate-left">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="card mt-5 p-3 shadow">
						<h1 class="text-center">ADD NEW SHIFT</h1>

						<form action="AddShiftServelet" method="POST">
							<div class="form-group">
								<label for="shiftName">Shift Name:</label> <input type="text"
									class="form-control" name="sname" placeholder="Day/Night"
									required autofocus>
							</div>

							<div class="form-group">
								<label for="sdate">Shift Date:</label> <input type="date"
									class="form-control" name="sdate" required>
							</div>

							<div class="form-group">
								<label for="startTime">Start Time:</label> <input type="time"
									class="form-control" name="stime" placeholder="00:00" required>
							</div>

							<div class="form-group">
								<label for="endTime">End Time:</label> <input type="time"
									class="form-control" name="etime" placeholder="00:00" required>
							</div>

							<div class="form-group">
								<label for="description">Description:</label> <input type="text"
									class="form-control" name="description" placeholder="....."
									required>
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" name="status"
									value="pending" required>
							</div>
							<a href="..\shiftDash.jsp" class="btn btn-outline-primary">Cancel</a>
							<button type="submit" class="btn btn-outline-primary">Save</button>

							<c:if test="${not empty requestScope.error}">
								<p style="color: red">${requestScope.error}</p>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>