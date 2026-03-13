<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f5f6fa;
	font-family: Arial, sans-serif;
}

.bg-theme {
	background: linear-gradient(135deg, #7f6be8, #9b8df1);
	color: white;
}

.btn-theme {
	background-color: #7f6be8;
	color: white;
	border-radius: 8px;
}

.btn-theme:hover {
	background-color: #6a58d6;
}

.admin-box {
	padding: 60px;
}

.form-control {
	border-radius: 8px;
}

.mb-3 {
	position: relative;
}

@media ( max-width :768px) {
	.admin-box {
		padding: 40px;
	}
}

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
	width: 250px;
	height: 40px;
	z-index: 9999;
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

					<li class="nav-item"><a class="nav-link" href="#">Home</a></li>

					<li class="nav-item"><a class="nav-link" href="#">Events</a></li>

					<!-- Login Dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown"> Login </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="AdminLogin.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="StudentLogin.html">Student</a></li>
						</ul></li>

					<!-- Register Dropdown -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle active" href="#" role="button"
						data-bs-toggle="dropdown"> Register </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item active" href="AdminRegister.jsp">Admin</a></li>
							<li><a class="dropdown-item" href="StudentRegister.html">Student</a></li>
						</ul></li>

				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid min-vh-100">
		<div class="row h-100">

			<!-- Left Panel -->
			<div class="col-md-6 d-none d-md-flex align-items-center bg-theme">
				<div class="p-5">
					<%
					String registermsg = (String) session.getAttribute("registerMsg");
					if (registermsg != null) {
					%>

					<div
						class="alert d-flex align-items-center py-2 px-3 mb-0 success-animate right-alert"
						style="background-color: #f8d7da; border-left: 6px solid #dc3545; color: #721c24;">

						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="#dc3545" class="me-2" viewBox="0 0 16 16">

<path
								d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 0 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293 5.354 4.646z" />

</svg>

						<div><%=registermsg%></div>

					</div>

					<%
					session.removeAttribute("registerMsg");
					}
					%>
					<h2>Admin Registration</h2>
					<p class="mt-3">Register as an administrator to manage events.</p>
				</div>
			</div>

			<!-- Right Panel -->
			<div class="col-md-6 d-flex align-items-center">
				<div class="admin-box w-100">

					<h3 class="mb-4">Create Admin Account</h3>

					<form name="fm" action="register" method="post"
						onsubmit="return validateForm()">

						<!-- Name -->
						<div class="mb-3">
							<label class="form-label">Admin Name</label> <input type="text"
								class="form-control" name="name" placeholder="Enter admin name"
								required>
						</div>

						<!-- Email -->
						<div class="mb-3">
							<label class="form-label">Admin Email</label> <input type="text"
								class="form-control" name="email"
								placeholder="Enter admin email" onkeyup="validateEmail()"
								required> <span id="emailIcon"
								style="position: absolute; right: 15px; top: 38px; color: green;"></span>

							<span id="emailError" class="text-danger small"></span>
						</div>

						<!-- Contact -->
						<div class="mb-3">
							<label class="form-label">Contact Number</label> <input
								type="tel" class="form-control" name="contact"
								placeholder="Enter 10 digit number" maxlength="10"
								onkeyup="validateContact()" required> <span
								id="contactIcon"
								style="position: absolute; right: 15px; top: 38px; color: green;"></span>

							<span id="contactError" class="text-danger small"></span>
						</div>

						<!-- Password -->
						<div class="mb-3">
							<label class="form-label">Password</label> <input type="password"
								class="form-control pe-5" name="password" id="passwordField"
								placeholder="Create password" onkeyup="validatePassword()"
								required> <span id="passIcon"
								style="position: absolute; right: 45px; top: 38px; color: green;"></span>

							<span id="togglePassword" onclick="togglePassword()"
								style="position: absolute; right: 12px; top: 35px; cursor: pointer;">
								👁 </span> <span id="passwordError" class="text-danger small"></span>
						</div>

						<button type="submit" class="btn btn-theme w-100">
							Register Admin</button>

						<div class="text-center mt-3">
							<span>Already registered?</span> <a href="AdminLogin.jsp"
								class="text-decoration-none"> Login</a>
						</div>

					</form>

				</div>
			</div>

		</div>
	</div>

	<script>
		// Email Validation
		function validateEmail() {

			let email = document.fm.email.value.trim();
			let emailError = document.getElementById("emailError");
			let emailIcon = document.getElementById("emailIcon");

			let pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|in|org|net|edu)$/;

			if (email.length === 0) {
				emailError.innerHTML = "";
				emailIcon.innerHTML = "";
			} else if (!pattern.test(email)) {
				emailError.innerHTML = "Enter valid email (example: xyz@gmail.com)";
				emailIcon.innerHTML = "";
			} else {
				emailError.innerHTML = "";
				emailIcon.innerHTML = "✔";
			}
		}

		// Password Validation
		function validatePassword() {

			let password = document.fm.password.value;
			let passwordError = document.getElementById("passwordError");
			let passIcon = document.getElementById("passIcon");

			let passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,9}$/;

			if (password.length === 0) {
				passwordError.innerHTML = "";
				passIcon.innerHTML = "";
			} else if (!passPattern.test(password)) {
				passwordError.innerHTML = "Password must be 6–9 characters with 1 uppercase, 1 lowercase, 1 number & 1 special character.";
				passIcon.innerHTML = "";
			} else {
				passwordError.innerHTML = "";
				passIcon.innerHTML = "✔";
			}
		}

		// Final Submit Validation
		function validateForm() {

			validateEmail();
			validatePassword();

			let emailError = document.getElementById("emailError").innerHTML;
			let passwordError = document.getElementById("passwordError").innerHTML;

			if (emailError !== "" || passwordError !== "") {
				return false;
			}
			return true;
		}

		// Show / Hide Password
		function togglePassword() {

			let pass = document.getElementById("passwordField");
			let icon = document.getElementById("togglePassword");

			if (pass.type === "password") {
				pass.type = "text";
				icon.textContent = "🙈";
			} else {
				pass.type = "password";
				icon.textContent = "👁";
			}
		}
		// Contact Validation
		function validateContact() {

			let contact = document.fm.contact.value.trim();
			let contactError = document.getElementById("contactError");
			let contactIcon = document.getElementById("contactIcon");

			let contactPattern = /^[0-9]{10}$/;

			if (contact.length === 0) {
				contactError.innerHTML = "";
				contactIcon.innerHTML = "";
			} else if (!contactPattern.test(contact)) {
				contactError.innerHTML = "Phone number must be exactly 10 digits.";
				contactIcon.innerHTML = "";
			} else {
				contactError.innerHTML = "";
				contactIcon.innerHTML = "✔";
			}
		}
		// Registration Failed msg
	

			setTimeout(function(){
			
			const alertBox=document.querySelector('.success-animate');
			
			if(alertBox){
			
			alertBox.style.transition="all 0.5s ease";
			
			alertBox.style.transform="translateX(100%)";
			
			alertBox.style.opacity="0";
			
			setTimeout(()=>alertBox.remove(),500);
			
			}
			
			},3000);


	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>