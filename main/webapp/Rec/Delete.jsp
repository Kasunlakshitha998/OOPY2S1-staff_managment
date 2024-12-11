<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Recruiting Information Update Form</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
       <% String staffID =request.getParameter("staffID");
	    String FullName =request.getParameter("FullName");
		String UserName =request.getParameter("UserName");
		String dateOfBirth =request.getParameter("dateOfBirth");
		String gender = request.getParameter("gender");
		String email =request.getParameter("email");
		String phone =request.getParameter("phone");
		String address =request.getParameter("address");
		String department =request.getParameter("department");
		String position =request.getParameter("Position");
		String HireDate =request.getParameter("Hiredate");
		String bankAccount =request.getParameter("bankAccount");
		String officeLocation =request.getParameter("officeLocation");
		String password =request.getParameter("password");%>
<div class="container">
    <div class="form-container p-4">
        <h2 class="text-center mb-4">Staff Recruiting Update Form</h2>
        <form action="UpdateStaff" method="post"> 
            <div class="row">
                <div class="col-md-7">
                    <div class="form-group">
                        <label for="staffID">Staff ID:</label>
                        <input type="text" id="staffID" name="staffID" value="<%= staffID %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="FullName">Full Name:</label>
                        <input type="text" id="FullName" name="FullName" value="<%= FullName %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="UserName">User Name:</label>
                        <input type="text" id="UserName" name="UserName" value="<%= UserName %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth:</label>
                        <input type="date" id="dateOfBirth" name="dateOfBirth" value="<%= dateOfBirth %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
    <label for="gender">Gender:</label>
    <select id="gender" name="gender" class="form-control" >
        <option value="Male" <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
        <option value="Female" <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
    </select>
</div>
                    
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= email %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="phone">Contact No:</label>
                        <input type="text" id="phone" name="phone" value="<%= phone %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" id="address" name="address" value="<%= address %>" class="form-control" readonly >
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="form-group">
                        <label for="department">Department:</label>
                        <input type="text" id="department" name="department" value="<%= department %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="position">Position:</label>
                        <input type="text" id="position" name="position" value="<%= position %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="hireDate">Hire Date:</label>
                        <input type="date" id="hireDate" name="hireDate" value="<%= HireDate %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="bankAccountNumber">Bank Account Number:</label>
                        <input type="text" id="bankAccount" name="bankAccount" value="<%= bankAccount %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="officeLocation">Office Location:</label>
                        <input type="text" id="officeLocation" name="officeLocation" value="<%= officeLocation %>" class="form-control" readonly>
                    </div>
                    <div class="form-group">
                        <label for="password">Create User Password:</label>
                        <input type="password" id="password" name="Password" value="<%= password %>" class="form-control" readonly>
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary submit-button">Delete</button> 
            </div>
        </form>
    </div>
</div>

</body>
</html>