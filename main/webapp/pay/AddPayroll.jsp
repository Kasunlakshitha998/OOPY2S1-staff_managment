<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADD PayRoll</title>
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

		response.sendRedirect("/login.jsp");
	}
	%>

	<div class="w3-container w3-animate-left">
		<div class="container">
			<div class="row justify-content-center">
				<div  class="col-md-6">
					<div class="card mt-5 p-3 shadow">
						<h1 class="text-center">ADD NEW PayRoll</h1>

						<form action="AddPayServelet" method="POST">
							<div class="form-group">
								<label for="empid">Employee ID:</label> <input type="text"
									class="form-control" name="eid" placeholder="00"
									required autofocus>
							</div>

							<div class="form-group">
								<label for="fdate">From Date:</label> <input type="date"
									class="form-control" name="fdate" required>
							</div>

							<div class="form-group">
								<label for="tdate">To Date:</label> <input type="date"
									class="form-control" name="tdate" required>
							</div>

							<div class="form-group">
								<label for="bonus">Bonus:</label> <input type="text"
									class="form-control" name="bonus" placeholder="00.00" required>
							</div>

							<div class="form-group">
								<label for="ot">OT:</label> <input type="text"
									class="form-control" name="ot" placeholder="00.00"
									required>
							</div>
							<div class="form-group">
								<label for="dedu">Deduction:</label> <input type="text"
									class="form-control" name="deduction" placeholder="00.00"
									required>
							</div>
							<div class="form-group">
								<label for="bsalary">Basic Salary:</label> <input type="text"
									class="form-control" name="bsalary" placeholder="00.00"
									required>
							</div>
							<a href="Payroll.jsp" class="btn btn-outline-primary">Cancel</a>
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