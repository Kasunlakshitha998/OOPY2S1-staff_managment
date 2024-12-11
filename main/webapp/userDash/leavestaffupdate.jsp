<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.app.leavestaff"%>
<%@ page import="com.app.leaves"%>
<%@ page import="java.util.List"%>
<%@ page import="com.app.Leave"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>
<style>
@import
	url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
}

body {
	background: #fec107;
	padding: 0 10px;
}

.wrapper {
	max-width: 500px;
	width: 100%;
	background: #fff;
	margin: 20px auto;
	box-shadow: 1px 1px 2px rgba(0, 0, 0, 0.125);
	padding: 30px;
}

.wrapper .title {
	font-size: 24px;
	font-weight: 700;
	margin-bottom: 25px;
	color: #fec107;
	text-transform: uppercase;
	text-align: center;
}

.wrapper .form {
	width: 100%;
}

.wrapper .form .inputfield {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.wrapper .form .inputfield label {
	width: 200px;
	color: #757575;
	margin-right: 10px;
	font-size: 14px;
}

.wrapper .form .inputfield .input, .wrapper .form .inputfield .textarea
	{
	width: 100%;
	outline: none;
	border: 2px solid #fec107; /* Modified border style */
	font-size: 15px;
	padding: 8px 10px;
	border-radius: 5px; /* Modified border radius */
	transition: all 0.3s ease;
}

.wrapper .form .inputfield .textarea {
	width: 100%;
	height: 125px;
	resize: none;
}

.wrapper .form .inputfield .custom_select {
	position: relative;
	width: 100%;
	height: 37px;
}

.wrapper .form .inputfield .custom_select:before {
	content: "";
	position: absolute;
	top: 12px;
	right: 10px;
	border: 8px solid;
	border-color: #d5dbd9 transparent transparent transparent;
	pointer-events: none;
}

.wrapper .form .inputfield .custom_select select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	outline: none;
	width: 100%;
	height: 100%;
	border: 0px;
	padding: 8px 10px;
	font-size: 15px;
	border: 2px solid #fec107; /* Modified border style */
	border-radius: 5px; /* Modified border radius */
}

.wrapper .form .inputfield .input:focus, .wrapper .form .inputfield .textarea:focus,
	.wrapper .form .inputfield .custom_select select:focus {
	border: 2px solid #ffbf00; /* Modified focus border color */
}

.wrapper .form .inputfield p {
	font-size: 14px;
	color: #757575;
}

.wrapper .form .inputfield .btn {
	width: 100%;
	padding: 10px; /* Increased padding */
	font-size: 16px; /* Increased font size */
	border: 0px;
	background: #fec107;
	color: #fff;
	cursor: pointer;
	border-radius: 5px;
	outline: none;
}

.wrapper .form .inputfield .btn:hover {
	background: #ffbf00; /* Modified hover background color */
}

.wrapper .form .inputfield:last-child {
	margin-bottom: 0;
}

@media ( max-width : 420px) {
	.wrapper .form .inputfield {
		flex-direction: column;
		align-items: flex-start;
	}
	.wrapper .form .inputfield label {
		margin-bottom: 5px;
	}
	.wrapper .form .inputfield.terms {
		flex-direction: row;
	}
}
</style>
</head>
<body>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	leaves  ls= new leaves();
	Leave s = ls.editleavedetails(id);
	%>

	<div class="wrapper">
		<div class="title">Leave Form</div>

		<div class="form">
			<form action="leavestaffupdateservelet" method="post">

				<div class="inputfield">

					<input type="hidden" class="input" name="leaveID"
						value="<%=s.getSid()%>">

				</div>

				<div class="inputfield">

					<input type="hidden" class="input" name="EmpID"
						value="<%=s.getId()%>">

				</div>

				<div class="inputfield">

					<input type="hidden" class="input" name="empname"
						value="<%=s.getEmpName()%>">
				</div>

				<div class="inputfield">
					<label>Emp email</label> <input type="email" class="input"
						name="email" value="<%=s.getEmpEmail()%>">
				</div>
				<div class="inputfield">
					<label>Emp contactNo</label> <input type="number" class="input"
						name="contactno" value="<%=s.getEmpno()%>">
				</div>
				<div class="inputfield">
					<label>Department</label> <input type="text" class="input"
						name="Department" value="<%=s.getDepartment()%>">
				</div>
				<div class="inputfield">
					<label>Leave Type</label>
					<div class="custom_select">
						<select name="leaveType">
						
							<option value="<%=s.getLeaveType() %>"><%=s.getLeaveType() %></option>
							<option value="PrivilegeLeave(pl)">PrivilegeLeave(pl)</option>
							<option value="MaternityLeave(Ml)"
								>MaternityLeave(Ml)</option>
							<option value="Sickleave"
								>Sickleave</option>
						</select>

					</div>
				</div>
				<div class="inputfield">
					<label>Leave to</label> <input type="date" class="input"
						name="Leaveto" value="<%=s.getLeaveTo()%>">
				</div>
				<div class="inputfield">
					<label>Leave from</label> <input type="date" class="input"
						name="leavefrom" value="<%=s.getLeaveFrom()%>">
				</div>
				<div class="inputfield">
					<label>leave description</label>
					<textarea class="textarea" name="leavedescription"><%=s.getLeaveDescription()%></textarea>
				</div>


				<div class="inputfield">
					<input type="submit" value="Submit" class="btn">
				</div>
			</form>
		</div>
	</div>



</body>
</html>
