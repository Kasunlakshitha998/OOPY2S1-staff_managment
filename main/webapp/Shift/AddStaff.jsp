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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<%
	response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("ID") == null) {

		response.sendRedirect("../login.jsp");
	}
	%>

	<%

	%>

	<div class="w3-container w3-animate-left">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="card mt-5 p-3 shadow">
						<h1 class="text-center">Assign Staff</h1>
						<br>
						<form action="AddStaffShiftServelet" method="POST">
							<div class="form-group">
								<label for="shiftName">Shift ID:</label> <input type="text"
									class="form-control" name="sid"
									value="<%=Integer.parseInt(request.getParameter("id"))%>" required readonly>
							</div>
							<br>
							<div class="form-group">
								<label for="sdate">Enter Staff ID :</label> <input type="text"
									class="form-control" name="eid" required placeholder="00"
									autofocus>
							</div>
							<br> <br>
							<div class="form-group">
								<a href="..\shiftDash.jsp" class="btn btn-outline-primary">Cancel</a>
								<button type="submit" class="btn btn-outline-primary">Save</button>
							</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>