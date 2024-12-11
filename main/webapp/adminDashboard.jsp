<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
<jsp:include page="Header.jsp" />
	
	<!-- check user login -->
	<%
	response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("ID") == null) {

		response.sendRedirect("login.jsp");
	}
	%>
	
	<h2>Hello ${uname}</h2>
	
	
					
	

<jsp:include page="footer.jsp" />