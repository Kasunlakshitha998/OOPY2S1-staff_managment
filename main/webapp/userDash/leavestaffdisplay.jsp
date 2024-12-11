<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.app.leavestaff"%>
<%@ page import="java.util.List"%>
<%@ page import="com.app.Leave"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="Headerstaff.jsp" />
<title>Leave Data</title>

<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.container {
	padding: 0;
	margin: 15px;
	margin-left:50px;
}

body {
	font-family: 'Arial', sans-serif;
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

.container {
	width: 80%;
	margin-top: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	background-color: #fff;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border-radius: 10px;
}

th, td {
	border: 1px solid #ddd;
	text-align: left;
	padding: 10px;
}

th {
	background-color: #337ab7;
	color: #fff;
	font-weight: bold;
}

tr:nth-child(even) {
	background-color: #f5f5f5;
}

tr:nth-child(odd) {
	background-color: #e0e0e0;
}

tr:hover {
	background-color: #ddd;
}

td {
	transition: 0.3s;
}

/* Button Styles */
.update-button, .delete-button {
	background-color: #337ab7;
	color: #fff;
	border: none;
	padding: 5px 10px;
	border-radius: 5px;
	cursor: pointer;
}

.delete-button {
	background-color: #d9534f; /* Red color for delete button */
}

@media ( max-width : 768px) {
	.leave-table {
		font-size: 14px; /* Adjust font size for smaller screens */
		padding: 5px; /* Adjust padding for smaller screens */
	}
}

.inline-actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

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
}

.inline-actions button.delete-button {
	background-color: #d9534f;
}
</style>

<script>
	$(document).ready(function() {

		function deleteRecord(id) {
			if (confirm("Are you sure you want to delete this record?")) {
				// Redirect to the DeletestaffleaveServelet with the ID
				window.location.href = "DeletestaffleaveServelet?id=" + id;
			}
		}

		// Function to handle the update action
		function updateRecord(id) {
			// Redirect to the leavestaffupdate.jsp with the ID
			window.location.href = "leavestaffupdate.jsp?id=" + id;
		}

		// Attach event listeners to the Delete and Update buttons
		$(".delete-button").click(function() {
			var id = $(this).data("id");
			deleteRecord(id);
		});

		$(".update-button").click(function() {
			var id = $(this).data("id");
			updateRecord(id);
		});
	});
</script>
</head>
<body>
	<h1>Leave Data</h1>
	<div class="container">
		<table class="leave-table">
			<tr>
				<th>SID</th>
				<th>Employee Name</th>
				<th>Employee Email</th>
				<th>Employee Number</th>
				<th>Department</th>
				<th>Leave Type</th>
				<th>Leave TO</th>
				<th>Leave From</th>
				<th>Leave Description</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
			<%
			leavestaff ls = new leavestaff();
			List<Leave> list = ls.getAlldetails(request);
			for (Leave l : list) {
			%>
			<tr>
				<td><%=l.getId()%></td>
				<td><%=l.getEmpName()%></td>
				<td><%=l.getEmpEmail()%></td>
				<td><%=l.getEmpno()%></td>
				<td><%=l.getDepartment()%></td>
				<td><%=l.getLeaveType()%></td>
				<td><%=l.getLeaveTo()%></td>
				<td><%=l.getLeaveFrom()%></td>

				<td><%=l.getLeaveDescription()%></td>
				<td><%=l.getStatus()%></td>
				<td class="inline-actions">
					<button class="update-button" data-id="<%=l.getSid()%>"
						<%if (!"Approve".equals(l.getStatus()) && !"Reject".equals(l.getStatus())) {%>
						style="display: inline;" <%} else {%> style="display: none;"
						<%}%>>Edit</button>

					<button class="delete-button" data-id="<%=l.getSid()%>"
						<%if (!"Approve".equals(l.getStatus()) && !"Reject".equals(l.getStatus())) {%>
						style="display: inline;" <%} else {%> style="display: none;"
						<%}%>>Delete</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
	<jsp:include page="footer.jsp" />