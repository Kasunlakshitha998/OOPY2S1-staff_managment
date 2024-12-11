<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://kit.fontawesome.com/cb0dbb7928.js"
	crossorigin="anonymous"></script>
<style>
.custom-container {
	margin-top: 50px;
	text-align: center;
}

.custom-box {
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	padding: 30px;
	border-radius: 20px 100px;
	background-color: rgb(255, 255, 255, 0.8);
}

.custom-image {
	max-width: 100%;
	height: auto;
	margin-bottom: 20px;
}

.btn {
	border-radius: 10px;
}

body {
	margin: 0;
	padding: 0;
	background-color: #445f78;
}
</style>

</head>
<body>
	<div class="container custom-container">
		<div class="row justify-content-center">
			<div class="col-md-4 custom-box">
				<!-- <img src="#" class="custom-image"> -->
				<h1>Login</h1>
				<h5>Login with your Username and Password</h5>
				<form action="login" method="POST">
					<div class="form-group">
						<div class="input-group">
							<div class="input-group-prepend">
								<span class="input-group-text"> <i class="fa fa-user"></i>
								</span>
							</div>
							<input type="text" class="form-control" name="Username"
								placeholder="Username" required autofocus>
						</div>
					</div>
					<div class="form-group input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"> <i class="fa fa-lock"></i>
							</span>
						</div>
						<input type="password" class="form-control" name="Password"
							id="password" placeholder="Password" required>
						<div class="input-group-append">
							<span class="input-group-text" id="toggle-password"> <i
								class="fa fa-eye" onclick="show()" id="eye-icon"></i>
							</span>
						</div>
					</div>
					<div class="form-group">
						<input class="btn btn-primary btn-block" type="submit"
							name="submit" value="LOGIN">
					</div>
					<c:if test="${not empty requestScope.error}">
						<p style="color: red">${requestScope.error}</p>
					</c:if>
				</form>
			</div>
		</div>
	</div>

	<script>
		var e = document.getElementById("eye-icon");
		var hide = false;

		function show() {
			if (hide == false) {
				password.setAttribute("type", "text");
				hide = true;
			} else {
				password.setAttribute("type", "password");
				hide = false;
			}
		}
	</script>
</body>
</html>