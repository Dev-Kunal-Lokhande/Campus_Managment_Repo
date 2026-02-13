<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="Model.AdminEvent"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Campus Event Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
}

/* Theme Colors (Same as Login & Registration) */
.bg-theme {
	background: linear-gradient(135deg, #7f6be8, #9b8df1);
}

.text-theme {
	color: #7f6be8;
}

.btn-theme {
	background-color: #7f6be8;
	color: white;
	border-radius: 8px;
}

.btn-theme:hover {
	background-color: #6a58d6;
}

.hero-section {
	min-height: 85vh;
	color: white;
}

.event-card {
	border-radius: 12px;
	transition: transform 0.3s;
}

.event-card:hover {
	transform: translateY(-5px);
}

footer {
	background-color: #f5f6fa;
}

.login-container {
	min-height: 100vh;
}

/* Left Panel */
.left-panel {
	background: linear-gradient(135deg, #7f6be8, #9b8df1);
	color: white;
	padding: 60px;
}

.left-panel h2 {
	font-weight: bold;
}

.left-panel p {
	opacity: 0.9;
}

/* Login Box */
.login-box {
	padding: 40px;
	max-width: 420px;
	margin: auto;
}

.form-control {
	border-radius: 8px;
}

.btn-custom {
	background-color: #7f6be8;
	color: white;
	border-radius: 8px;
}

.btn-custom:hover {
	background-color: #6a58d6;
}

/* Mobile Optimization */
@media ( max-width : 768px) {
	.login-box {
		padding: 25px;
	}
	.left-panel {
		text-align: center;
		padding: 40px;
	}
	h3 {
		font-size: 22px;
	}
}

/* login msg faild  */
@keyframes slideInRight {
    from {
        opacity: 0;
        transform: translateX(100%);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}


.success-animate {
    animation: slideInRight 0.6s ease-out;
}

.right-alert {
    position: fixed;
    top: 20px;
    right: 20px;
    width: 250px;
    height: 40px;
    z-index: 9999;
}

</style>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-theme">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#">Campus Events</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#menu">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="menu">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Events</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Login </a>
						<ul class="dropdown-menu w-25">
							<li><a class="dropdown-item" href="AdminLogin.html">Admin</a></li>
							<li><a class="dropdown-item" href="StudentLogin.html">Student</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Register </a>
						<ul class="dropdown-menu w-25">
							<li><a class="dropdown-item" href="AdminRegister.html">Admin</a></li>
							<li><a class="dropdown-item" href="StudentRegister.html">Student</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container-fluid login-container">
		<div class="row min-vh-100">

			<!-- Left Section -->
			<div class="col-lg-6 d-none d-lg-flex align-items-center left-panel">
				<div>
					<h2>Event Management</h2>
					<h5 class="mt-3">Campus Made Easy</h5>
					<p class="mt-3">Manage campus events, registrations, and
						schedules in a simple and organized way.</p>
				</div>
			</div>

			<!-- Right Section -->
			<div
				class="col-lg-6 col-12 d-flex align-items-center justify-content-center">
				<div class="login-box w-100">
					<%
					String loginError = (String) session.getAttribute("loginError");
					if (loginError != null) {
					%>

					<div class="alert d-flex align-items-center py-2 px-3 mb-0 success-animate right-alert"
     style="background-color:#f8d7da; 
            border-left:6px solid #dc3545; 
            color:#721c24;">


						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="#dc3545" class="me-2" viewBox="0 0 16 16">
      				  <path
								d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 0 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />
   					 </svg>

						<div><%=loginError%></div>

					</div>

					<%
					session.removeAttribute("loginError");
					}
					%>

					<h3 class="mb-4 text-center">Admin Login</h3>

					<form name="frm" action="AdminLogin" method="post">

						<div class="mb-3">
							<label class="form-label">User Email </label> <input type="text"
								class="form-control" value='' name="name"
								placeholder="Enter Email id " required>
						</div>

						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								class="form-control" value='' name="password"
								placeholder="Enter password" required>
						</div>

						<button type="submit" class="btn btn-custom w-100" name="s">
							Login</button>

						<div class="text-center mt-3">
							<a href="#" class="text-decoration-none">Forgot password?</a>
						</div>

						<div class="text-center mt-2">
							<span>Don't have an account?</span> <a href="AdminRegister.html"
								class="text-decoration-none"> Register</a>
						</div>

					</form>

				</div>
			</div>

		</div>
	</div>
		<script type="text/javascript">
		setTimeout(function() {
		    const alertBox = document.querySelector('.success-animate');
		    if(alertBox){
		    	 alertBox.style.transition = "all 0.5s ease";
			        alertBox.style.transform = "translateX(100%)";
		        alertBox.style.opacity = "0";
		        setTimeout(() => alertBox.remove(), 500);
		    }
		}, 3000);
		</script>

		</script>
</body>
</html>
