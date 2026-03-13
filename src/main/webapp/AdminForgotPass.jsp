<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>Forgot Password</title>
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

/* alert animation */
@
keyframes slideInRight {from { opacity:0;
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
	width: 280px;
	z-index: 9999;
}

/* input icon */
.input-icon {
	position: absolute;
	right: 12px;
	top: 38px;
	font-size: 18px;
	color: #6c757d;
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

					<h2>Forgot Your Password?</h2>

					<h5 class="mt-3">No problem!</h5>

					<p class="mt-3">Enter your registered email and we will help
						you recover your password.</p>

				</div>

			</div>

			<!-- right section -->

			<div
				class="col-lg-6 d-flex align-items-center justify-content-center">

				<div class="login-box w-100">
					<%
					String passError = (String) session.getAttribute("passError");
					if (passError != null) {
					%>

					<div
						class="alert d-flex align-items-center py-2 px-3 mb-0 success-animate right-alert"
						style="background-color: #f8d7da; border-left: 6px solid #dc3545; color: #721c24;">

						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="#dc3545" class="me-2" viewBox="0 0 16 16">

<path
								d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 0 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />

</svg>

						<div><%=passError%></div>

					</div>

					<%
					session.removeAttribute("passError");
					}
					%>
					<h3 class="mb-3 text-center">Reset Password</h3>

					<p class="text-center text-muted mb-4">Enter your registered
						email address.</p>

					<form name="frm" action="AForgot" method="post"
						onsubmit="return validateForm()">

						<div class="mb-3 position-relative">

							<label class="form-label">Email Address</label> <input
								type="text" class="form-control" name="email"
								placeholder="Enter your email" id="emailField"
								onkeyup="validateEmail()" oninput="fixEmail()" required>

							<span class="input-icon">✉</span> <span id="emailError"
								class="text-danger small"></span>

						</div>

						<button type="submit" class="btn btn-custom w-100" id="submitBtn">

							<span id="btnText">Send Recovery Link</span> <span id="loader"
								class="spinner-border spinner-border-sm d-none"></span>

						</button>

						<div class="text-center mt-3">

							<a href="AdminLogin.jsp" class="text-decoration-none"> ← Back
								to Login </a>

						</div>

					</form>

				</div>

			</div>

		</div>

	</div>

	<script>
		/* email validation */

		function validateEmail() {

			let email = document.frm.email.value.trim();

			let emailError = document.getElementById("emailError");

			let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|in|org|net|edu)$/;

			if (email.length === 0) {

				emailError.innerHTML = "";

			} else if (!email.match(emailPattern)) {

				emailError.innerHTML = "Enter valid email (example: xyz123@gmail.com). Only .com, .in, .org, .net, .edu domains allowed.";

			} else {

				emailError.innerHTML = "";

			}

		}
		/* remove spaces */

		function fixEmail() {

			let emailField = document.getElementById("emailError");

			emailField.value = emailField.value.trimStart();

			emailField.value = emailField.value.replace(/\s/g, '');

		}

		/* form validation */

		function validateForm() {

			validateEmail();

			let emailError = document.getElementById("emailError").innerHTML;

			if (emailError !== "") {
				return false;
			}

			/* loading animation */

			document.getElementById("btnText").style.display = "none";

			document.getElementById("loader").classList.remove("d-none");

			return true;

		}
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

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>