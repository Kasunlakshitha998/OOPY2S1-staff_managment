<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Recruiting Information Form</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
}

.form-container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	margin-top: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.form-group {
	margin-bottom: 20px;
}

.submit-button {
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 3px;
	padding: 10px 20px;
	cursor: pointer;
	transition: background-color 0.3s ease-in-out;
}

.submit-button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<div class="form-container p-4">
			<h2 class="text-center mb-4">Staff Recruiting Form</h2>
			<form action="RecruitStaff" method="post">
				<div class="row">
					<div class="col-md-7">
						<div class="form-group">
							<label for="FullName">Full Name:</label> <input type="text"
								id="FullName" name="FullName" class="form-control">
						</div>
						<div class="form-group">
							<label for="UserName">User Name:</label> <input type="text"
								id="UserName" name="UserName" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="dateOfBirth">Date of Birth:</label> <input
								type="date" id="dateOfBirth" name="dateOfBirth"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="gender">Gender:</label> <select id="gender"
								name="gender" class="form-control">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>
						<div class="form-group">
							<label for="email">Email:</label> <input type="email" id="email"
								name="email" class="form-control">
						</div>
						<div class="form-group">
							<label for="phone">Contact No:</label> <input type="number"
								id="phone" name="phone" class="form-control">
						</div>
						<div class="form-group">
							<label for="address">Address:</label> <input type="text"
								id="address" name="address" class="form-control">
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label for="department">Department:</label> <input type="text"
								id="department" name="department" class="form-control">
						</div>
						<div class="form-group">
							<label for="position">Position:</label> <input type="text"
								id="position" name="position" class="form-control">
						</div>
						<div class="form-group">
							<label for="hireDate">Hire Date:</label> <input type="date"
								id="hireDate" name="hireDate" class="form-control">
						</div>
						<div class="form-group">
							<label for="bankAccountNumber">Bank Account Number:</label> <input
								type="number" id="bankAccount" name="bankAccount"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="officeLocation">Office Location:</label> <input
								type="text" id="officeLocation" name="officeLocation"
								class="form-control">
						</div>
						<div class="form-group">
							<label for="uType">User Type:</label> <select id="uType"
								name="uType">
								<option value="user">User</option>
								<option value="admin">Admin</option>
							</select>
						</div>
						<div class="form-group">
							<label for="password">Create User Password:</label> <input
								type="text" id="password" name="Password"
								class="form-control">
						</div>
					</div>
				</div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary submit-button">Submit</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>