<%@ page import="java.util.List"%>
<%@ page import="Model.AdminEvent"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Student Management</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6fb;
}

.sidebar {
	height: 115vh;
	background: linear-gradient(135deg, #7f6be8, #9b8df1);
	color: white;
}

.sidebar a {
	color: white;
	text-decoration: none;
	display: block;
	padding: 12px;
	border-radius: 6px;
}

.sidebar a:hover {
	background-color: rgba(255, 255, 255, 0.2);
}

.card {
	border-radius: 12px;
}

.btn-theme {
	background-color: #7f6be8;
	color: white;
}

.btn-theme:hover {
	background-color: #6a58d6;
}
</style>
</head>
<script type="text/javascript">
	function StudentUpdate(id, name, email, course, college_name) {
		let Id = document.getElementById("updatid").value = id;
		let Name = document.getElementById("name").value = name;
		let Email = document.getElementById("email").value = email;
		let Course = document.getElementById("course").value = course;
		let College = document.getElementById("college_name").value = college_name;

		console.log(Id);
		console.log(Name);
		console.log(Email);
		console.log(Course);
		console.log(College);
	}
</script>

<body>

	<!-- Navbar -->
	<!-- Top Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark shadow"
		style="background: linear-gradient(135deg, #7f6be8, #9b8df1);">

		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="#">Campus Event System</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">

				<ul class="navbar-nav align-items-center">

					<li class="nav-item me-3" name="Adminname">
						<%
						String admin = (String) session.getAttribute("Admin");
						if (admin == null) {
							admin = "Admin";
						}
						%> 
						<span class="text-white">Welcome, <%=admin%></span>
					</li>

					<li class="nav-item"><a class="btn btn-light btn-sm"
						href="AdminLogin"> Logout </a></li>

				</ul>

			</div>
		</div>
	</nav>


	<div class="container-fluid">
		<div class="row">

			<!-- Sidebar -->
			<div class="col-md-2 sidebar p-3">
				<h4 class="text-center mb-4">Admin Panel</h4>

				<a href="AdminEvent_M">Dashboard</a> <a href="AEventmanage">Manage
					Events</a> <a href="StudentManage">Manage Students</a> <a
					href="AdminLogin">Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<h2 class="mb-4">Student Management</h2>

				<!-- ✅ Add Student Button -->
				<button class="btn btn-theme mb-3" data-bs-toggle="modal"
					data-bs-target="#addStudentModal">Add Student</button>

				<div class="card shadow p-4">

					<table class="table table-bordered">
						<thead class="table-light">
							<tr>
								<th>Sr.No</th>
								<th>Name</th>
								<th>Email</th>
								<th>Course</th>
								<th>College Name</th>
								<th>Action</th>

							</tr>
						</thead>

						<tbody>
							<%
							List<AdminEvent> listS = (List<AdminEvent>) request.getAttribute("EventStudent");

							if (listS == null || listS.size() == 0) {
							%>
							<tr>
								<td colspan="5" class="text-center">No Students Found</td>
							</tr>
							<%
							} else {
							int count = 1;
							for (AdminEvent a : listS) {
							%>
							<tr>
								<td><%=count++%></td>
								<td><%=a.getName()%></td>
								<td><%=a.getS_Email()%></td>
								<td><%=a.getS_Course()%></td>
								<td><%=a.getSCollege_name()%></td>
								<td>
									<button class="btn btn-warning btn-sm" data-bs-toggle="modal"
										data-bs-target="#Update"
										onclick="StudentUpdate(
										'<%=a.getId()%>',
										'<%=a.getName().replace("'", "\\'")%>',
										'<%=a.getS_Email().replace("'", "\\'")%>',
										'<%=a.getS_Course().replace("'", "\\'")%>',
										'<%=a.getSCollege_name().replace("'", "\\'")%>'
										)">
										Edit</button> <a href="Delete_A_Student?id=<%=a.getId()%>"
									class="btn btn-danger btn-sm"> Delete </a>
								</td>
							</tr>
							<%
							}
							}
							%>
						</tbody>

					</table>

				</div>

			</div>
		</div>
	</div>

	<!-- ✅ Add Student Modal -->
	<div class="modal fade" id="addStudentModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5>Add New Student</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">
					<form action="StudentManage" method="post">

						<div class="mb-3">
							<label>Name</label> <input type="text" class="form-control"
								name="name" required>
						</div>

						<div class="mb-3">
							<label>Email</label> <input type="email" class="form-control"
								name="email" required>
						</div>

						<div class="mb-3">
							<label>Course</label> <input type="text" class="form-control"
								name="course" required>
						</div>

						<div class="mb-3">
							<label>College Name</label> <input type="text"
								class="form-control" name="college_name" required>
						</div>

						<button type="submit" class="btn btn-theme w-100">Save
							Student</button>

					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal fade" id="Update">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5>Update Student</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>


				<div class="modal-body">
					<form action="Update_A_Student" method="post">

						<input type="hidden" name="id" id="updatid">

						<div class="mb-3">
							<label>Name</label> <input type="text" class="form-control"
								name="Name" id="name">
						</div>


						<div class="mb-3">
							<label>Email</label> <input type="email" class="form-control"
								name="Email" id="email">
						</div>

						<div class="mb-3">
							<label>Course</label> <input type="text" class="form-control"
								name="Course" id="course">
						</div>

						<div class="mb-3">
							<label>College Name</label> <input type="text"
								class="form-control" name="College_name" id="college_name">
						</div>
						<%
						Integer Admin = (Integer) session.getAttribute("AdminId");
						if (Admin == null) {
							out.print("not found");
						}
						%>
						<div class="mb-3">
							<input type="hidden" class="form-control" name="admin_id"
								value='<%=Admin%>'>
						</div>
						<button type="submit" class="btn btn-theme w-100">Save
							Student</button>

					</form>
				</div>

			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
		
	</script>

</body>
</html>
