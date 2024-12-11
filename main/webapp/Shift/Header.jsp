
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style type="text/css">
@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Slab&family=Tilt+Neon&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap')
	;

body {
	margin: 0;
	padding: 0;
	background-color: #445f78;
	box-sizing: border-box;
}

form.w3-container {
	margin-right: 20vh;
}

button.w3-button {
	
}

main.col-md-9.col-lg-10.main-content {
	margin-top: 4rem;
	margin-left: 14rem;
	font-family: 'Tilt Neon', sans-serif;
}

.w3-bar {
	background-color: #4c5d6e;
	padding: 0;
	color: #fff;
}

.logo {
	color: #ffc107;
	fornt-weight: blod;
}

#sidebar {
	width: 31vh;
	position: fixed;
	height: 100vh;
	color: #fff;
	background-color: #4e657a;
	padding: 0;
	font-family: 'Roboto Slab', serif;
}

.nav-link {
	color: #fff;
	font-size: 18px;
	padding: 10px 10px 10px 20px;
}

li i {
	color: #fff;
	font-size: 21px;
	margin: 10px;
}

.nav-link:hover {
	background-color: #ffc107;
	color: white;
}

.active-link {
	color: #fff;
	background-color: #ffc107;
}

.custom-search-bar {
	background-color: #fff;
	color: #fff;
	border: 1px solid #333;
	border-radius: 30px;
	width: 50vh;
	padding:10px;
}



#ad{
	font-size:16px;
	padding-left:10vh;
	background-color: #4c5d6e;
}

#btn{
	background-color: #4c5d6e;
	border:none;
	margin-top: 22px;
	margin-right: 70px;
	color:white;
}

</style>

<script src="https://kit.fontawesome.com/cb0dbb7928.js"
	crossorigin="anonymous"></script>



</head>
<body>

	<!-- check user login -->
	<%
	response.setHeader("cash-control", "no-cache, no-store, must-revalidate");

	if (session.getAttribute("ID") == null) {

		response.sendRedirect("../login.jsp");
	}
	%>


	<div class="w3-top">
		<nav class="w3-bar">
			<div class="w3-container">
				<a class="w3-bar-item w3-button" href="adminDashboard.jsp"><h2 class="logo">Staff
						Managment System</h2></a>

				<div id="ad" class="w3-dropdown-hover w3-right">
					<button id="btn" class="">
						${uname} <i class="fas fa-caret-down"></i>
					</button>
					<div class="w3-dropdown-content w3-bar-block">
						<a href="#" class="w3-bar-item w3-button"> <i
							class="fas fa-user"></i> Profile
						</a>
						<form action="..\Logout" class="nav-form">
							<button id="logout" class="w3-button w3-red" style="width: 100%"
								type="submit">
								<i class="fas fa-sign-out-alt"></i> Logout
							</button>
						</form>
					</div>
				</div>
				<div class="container mt-3">
					<form class="form-inline w3-right">
						<input class="form-control custom-search-bar mr-sm-1"
							type="search" placeholder="Search">
					</form>
				</div>
			</div>
		</nav>
	</div>



	<div class="row">
		<nav id="sidebar"
			class="col-md-4 col-lg-2 d-md-block full-height-sidebar">
			<div class="position-sticky">
				<br>
				<hr>
				<hr>
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link"
						href="..\adminDashboard.jsp"> <i class="fas fa-tachometer-alt"></i>Dashboard
					</a></li>
					<li class="nav-item"><a class="nav-link" href="..\Rec/DisplayStaffList.jsp"> <i
							class="fas fa-users"></i> Staff
					</a></li>
					<li class="nav-item"><a class="nav-link" href="..\shiftDash.jsp">
							<i class="fas fa-clock"></i> Shift
					</a></li>
					<li class="nav-item"><a class="nav-link" href="..\pay/Payroll.jsp"> <i
							class="fas fa-money-bill"></i> PayRoll
					</a></li>
					<li class="nav-item"><a class="nav-link" href="..\leavedisplay.jsp"> <i
							class="fas fa-calendar-check"></i> Leave Approve
					</a></li>
				</ul>
			</div>
		</nav>

		<script>
			var currentURL = window.location.pathname;

			var navLinks = document.querySelectorAll('.nav-link');

			navLinks.forEach(function(link) {
				var href = link.getAttribute('href');
				if (currentURL.includes(href)) {
					link.classList.add('active-link');
				}
			});
		</script>


		<main class="col-md-9 col-lg-10 main-content">