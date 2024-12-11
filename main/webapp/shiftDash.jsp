<%@page import="java.util.List"%>
<%@page import="com.Staff.Shift"%>
<%@page import="com.Staff.ShiftManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
.box {
	text-align: center;
	padding: 20px;
	border-radius: 10px 40px;
	color: white;
	text-decoration: none;
	display: block;
	font-size: 18px;
	font-weight: bold;
	transition: transform 0.3s, box-shadow 0.3s;
	margin-top: 100px;
	margin-left:25px;
}

.rbox {
	background-color: #f75f57;
	width: 300px;
	height: 200px
}

.gbox {
	background-color: #57f792;
	width: 300px;
	height: 200px
}

.bbox {
	background-color: #a457f7;
	width: 300px;
	height: 200px
}

.box:hover {
	transform: scale(1.05);
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
}
</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<jsp:include page="Header.jsp" />

<!-- check user login -->
<%
response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

if (session.getAttribute("ID") == null) {

	response.sendRedirect("login.jsp");
}
%>

<div class="w3-container">
	<div class="w3-center w3-animate-top">
	
		<div class="container">
    <div class="row">
        <div class="col-md-4">
            <a href="Shift/Shift.jsp" class="box rbox">
                <i class="fas fa-list-ul fa-3x"></i> 
                <h1>Shift List</h1>
            </a>
        </div>
        <div class="col-md-4">
            <a href="Shift/AddNewShift.jsp" class="box gbox">
                <i class="fas fa-plus-circle fa-3x"></i> 
                <h1>Add Shift</h1>
            </a>
        </div>
        <div class="col-md-4">
            <a href="Shift/assignStaff.jsp" class="box bbox">
                <i class="fas fa-list-ul fa-3x"></i> 
                <h1>Shift Assign List</h1>
            </a>
        </div>
    </div>
</div>
		
	</div>
</div>


<jsp:include page="footer.jsp" />