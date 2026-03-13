<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String password = (String) request.getAttribute("password");
if (password == null) {
	password = "Password not found";
}
%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>Show Password</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background: #f5f6fa;
}

/* theme */
.bg-theme {
	background: linear-gradient(135deg, #7f6be8, #9b8df1);
	color: white;
}

/* card */
.login-box {
	padding: 40px;
	max-width: 420px;
	margin: auto;
	background: white;
	border-radius: 10px;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

/* button */
.btn-custom {
	background-color: #7f6be8;
	color: white;
	border-radius: 8px;
	font-weight: 500;
}

.btn-custom:hover {
	background-color: #6a58d6;
}

/* left panel */
.left-panel {
	background: linear-gradient(135deg, #7f6be8, #9b8df1);
	color: white;
	padding: 60px;
}

/* password box */
.password-box {
	background: #f8f9fa;
	border: 1px solid #ddd;
	padding: 12px;
	border-radius: 6px;
	font-size: 18px;
	font-weight: bold;
	text-align: center;
	letter-spacing: 1px;
}

/* responsive */
@media ( max-width :768px) {
	.left-panel {
		display: none;
	}
	.login-box {
		padding: 25px;
	}
}
</style>

</head>

<body>

	<!-- Navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark bg-theme">

		<div class="container">

			<a class="navbar-brand fw-bold" href="#">Campus Events</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#menu">

				<span class="navbar-toggler-icon"></span>

			</button>

			<div class="collapse navbar-collapse" id="menu">

				<ul class="navbar-nav ms-auto">

					<li class="nav-item"><a class="nav-link active" href="#">Home</a>
					</li>

					<li class="nav-item"><a class="nav-link" href="#">Events</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> Login </a>

						<ul class="dropdown-menu">

							<li><a class="dropdown-item" href="AdminLogin.jsp">Admin</a>
							</li>

							<li><a class="dropdown-item" href="StudentLogin.jsp">Student</a>
							</li>

						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> Register </a>

						<ul class="dropdown-menu">

							<li><a class="dropdown-item" href="AdminRegister.jsp">Admin</a>
							</li>

							<li><a class="dropdown-item" href="StudentRegister.jsp">Student</a>
							</li>

						</ul></li>

				</ul>

			</div>

		</div>

	</nav>


	<div class="container-fluid">

		<div class="row min-vh-100">

			<!-- left section -->

			<div class="col-lg-6 d-none d-lg-flex align-items-center left-panel">

				<div>

					<h2>Password Recovery</h2>

					<h5 class="mt-3">Success!</h5>

					<p class="mt-3">Your password is shown on the right side. Use
						it to login again.</p>

				</div>

			</div>

			<!-- right section -->

			<div
				class="col-lg-6 d-flex align-items-center justify-content-center">

				<div class="login-box w-100">

					<h3 class="mb-3 text-center">Your Password</h3>

					<p class="text-center text-muted mb-4">Below is your account
						password.</p>

					<div class="mb-3">

						<label class="form-label">Password</label>

						<div class="password-box">

							<%
							String pass = (String) session.getAttribute("password");
							if (pass == null) {
								pass = "password not found";
							}
							%>
							<%=pass%>
						</div>

					</div>

					<div class="text-center mt-4">

						<a href="AdminLogin.jsp" class="btn btn-custom w-100"> Back to
							Login </a>

					</div>

				</div>

			</div>

		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>