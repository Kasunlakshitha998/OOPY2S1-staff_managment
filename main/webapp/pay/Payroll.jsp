<%@page import="java.util.List"%>
<%@page import="com.payroll.PayManager"%>
<%@page import="com.payroll.Payroll"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<jsp:include page="Header.jsp" />

<!-- check user login -->
<%
response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

if (session.getAttribute("ID") == null) {

	response.sendRedirect("/login.jsp");
}
%>
<c:if test="${not empty smsg}">
				<div class="w3-panel w3-green">
					<h4 id="smsg">${smsg}</h4>
				</div>
				<c:remove var="smsg" scope="session" />
			</c:if>

			<c:if test="${not empty fmsg}">
				<div class="w3-panel w3-red">
					<h4 id="fmsg">${fmsg}</h4>
				</div>
				<c:remove var="fmsg" scope="session" />
			</c:if>

	<div class="container mt-4">
		<a href="AddPayroll.jsp"><button class="btn btn-primary">ADD</button></a>
		<br>
		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>Ref No</th>
					<th>Emp ID</th>
					<th>Date From</th>
					<th>To Date</th>
					<th>Bonus</th>
					<th>OT</th>
					<th>Deduction</th>
					<th>Basic Salary</th>
					<th>Net Salary</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				PayManager pm = new PayManager();
				List<Payroll> list = pm.PayList();
				for (Payroll p : list) {
				%>
				<tr>
					<td><%=p.getRid()%></td>
					<td><%=p.getEmpid()%></td>
					<td><%=p.getFdate()%></td>
					<td><%=p.getTdate()%></td>
					<td><%=p.getBonus()%></td>
					<td><%=p.getOt()%></td>
					<td><%=p.getDeduc()%></td>
					<td><%=p.getBsalary()%></td>
					<td><%=p.getNetSalary()%></td>
					<td><a href="Editepay.jsp?id=<%=p.getRid()%>"
						class="btn btn-primary btn-sm">Edit</a> <a
						href="DeletepayServlet?id=<%=p.getRid()%>"
						class="btn btn-danger btn-sm">Delete</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>



<jsp:include page="footer.jsp" />