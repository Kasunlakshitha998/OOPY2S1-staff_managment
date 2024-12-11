<%@page import="com.payroll.Payroll"%>
<%@page import="com.payroll.PayManager"%>
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
				<div class="col-md-6">
					<div class="card mt-5 p-3 shadow">
						<h1 class="text-center">Edit PayRoll</h1>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						PayManager pm = new PayManager();
						Payroll pr = pm.EditPay(id);
						%>



						<form action="EditPayServlet" method="POST">

							<div class="form-group">
								<input type="hidden" name="id" value="<%=pr.getRid()%>">
							</div>
							<div class="form-group">
								<label for="empid">Employee ID:</label> <input type="text"
									class="form-control" name="eid" value="<%=pr.getEmpid()%>"
									required autofocus readonly>
							</div>

							<div class="form-group">
								<label for="fdate">From Date:</label> <input type="date"
									class="form-control" name="fdate" value="<%=pr.getFdate()%>"
									required>
							</div>

							<div class="form-group">
								<label for="tdate">To Date:</label> <input type="date"
									class="form-control" name="tdate" value="<%=pr.getTdate()%>"
									required>
							</div>

							<div class="form-group">
								<label for="bonus">Bonus:</label> <input type="text"
									class="form-control" name="bonus" value="<%=pr.getBonus()%>"
									required>
							</div>

							<div class="form-group">
								<label for="ot">OT:</label> <input type="text"
									class="form-control" name="ot" value="<%=pr.getOt()%>" required>
							</div>
							<div class="form-group">
								<label for="dedu">Deduction:</label> <input type="text"
									class="form-control" name="deduction"
									value="<%=pr.getDeduc()%>" required>
							</div>
							<div class="form-group">
								<label for="bsalary">Basic Salary:</label> <input type="text"
									class="form-control" name="bsalary"
									value="<%=pr.getBsalary()%>" required>
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