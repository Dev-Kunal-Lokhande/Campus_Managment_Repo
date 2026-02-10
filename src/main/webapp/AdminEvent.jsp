<%@ page import="java.util.List"%>
<%@ page import="Model.AdminEvent"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Campus Event System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap -->
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
<body>
	<!-- Top Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark shadow h-100"
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
						%> <span class="text-white">Welcome, <%=admin%></span>
					</li>

					<li class="nav-item"><a class="btn btn-light btn-sm"
						href="AdminLogin.html">Logout</a></li>

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
					href="AdminLogin.html">Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Dashboard -->
				<h2 id="dashboard">Dashboard</h2>
				<div class="row mb-4">
					<div class="col-md-4">
						<div class="card shadow p-3 text-center">
							<h5>Total Events</h5>
							<h3>${totalEvent != null ? totalEvent : 0}</h3>
						</div>
					</div>

					<div class="col-md-4">
						<div class="card shadow p-3 text-center">
							<h5>Total Students</h5>
							<h3>${totalStudent != null ? totalStudent : 0}</h3>
						</div>
					</div>

					<div class="col-md-4">
						<div class="card shadow p-3 text-center">
							<h5>Registrations</h5>
							<h3>300</h3>
						</div>
					</div>
				</div>

				<!-- Manage Events -->
				<h3 id="events" class="mt-4">Manage Events</h3>

				<button class="btn btn-theme mb-3" data-bs-toggle="modal"
					data-bs-target="#addEventModal">Add Event</button>
				<div id="eventsScroll" data-bs-spy="scroll"
					data-bs-target="#navbar-example2" data-bs-offset="0" tabindex="0"
					style="max-height: 100px; overflow-y: auto;">

					<table class="table table-bordered shadow">


						<thead class="table-light">
							<tr>
								<th>Sr.No</th>
								<th>Event Name</th>
								<th>Date</th>
								<th>Location</th>
							</tr>
						</thead>
						<tbody>


							<%
							List<AdminEvent> list = (List<AdminEvent>) request.getAttribute("eventList");

							if (list == null || list.size() == 0) {
							%>
							<tr>
								<td colspan="5" class="text-center">No Events Found</td>
							</tr>
							<%
							} else {
								int count=1;
							for (AdminEvent a : list) {
							%>

							<tr>
								<td><%=count++%></td>
								<td><%=a.getName()%></td>
								<td><%=a.getEDate()%></td>
								<td><%=a.getLocation()%></td>

							</tr>
							<%
							}
							}
							%>
						</tbody>

					</table>
				</div>

				<!-- Manage Students -->
				<h3 id="students" class="mt-5">Manage Students</h3>
				<button class="btn btn-theme mb-3" data-bs-toggle="modal"
					data-bs-target="#addStudentModal">Add Student</button>
				<div id="eventsScroll" data-bs-spy="scroll"
					data-bs-target="#navbar-example2" data-bs-offset="0" tabindex="0"
					style="max-height: 100px; overflow-y: auto;">
					<table class="table table-bordered shadow">

						<thead class="table-light">
							<tr>
								<th>Sr.No</th>
								<th>Name</th>
								<th>Email</th>
								<th>Course</th>
								<td>College Name</td>

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
								int count=1;
							for (AdminEvent a : listS) {
							%>

							<tr>
								<td><%= count++%></td>
								<td><%=a.getName()%></td>
								<td><%=a.getS_Email()%></td>
								<td><%=a.getS_Course()%></td>
								<td><%=a.getSCollege_name()%></td>

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

	<!-- Add Event Modal -->
	<div class="modal fade" id="addEventModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5>Add New Event</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form name="frm" action="AdminEvent_M" method="post">
					 
					<input type="hidden" name="formType" value="event">
					
						<div class="mb-3">
							<label>Event Name</label> <input type="text" class="form-control"
								name="name" value='' required>
						</div>
						<div class="mb-3">
							<label>Date</label> <input type="date" class="form-control"
								name="date" value='' required>
						</div>
						<div class="mb-3">
							<label>Location</label> <input type="text" class="form-control"
								name="location" value='' required>
						</div>
						<% 
						Integer AdminId=(Integer)session.getAttribute("AdminId");
						
						if(AdminId == null){
							out.print("not found");
						}
						%>
						<div class="mb-3">
							 <input type="hidden" name="adminId" value='<%=AdminId %>'>
						</div>
						<button type="submit" class="btn btn-theme w-100" name='s'>Save
							Event</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Student Modal -->
	<div class="modal fade" id="addStudentModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5>Add New Student</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body">
					<form name="frm" action="AdminEvent_M" method="post">
					   <input type="hidden" name="formType" value="student">
						<div class="mb-3">
							<label>Student Name</label> <input type="text"
								class="form-control" name="name" value='' required>
						</div>
						<div class="mb-3">
							<label>Email</label> <input type="email" class="form-control"
								name="email" value='' required>
						</div>
						<div class="mb-3">
							<label>Course</label> <input type="text" class="form-control"
								name="course" value='' required>
						</div>
						<div class="mb-3">
							<label>College Name</label> <input type="text"
								class="form-control" name="college_name" value='' required>
						</div>
						<button type="submit" class="btn btn-theme w-100" name='s'>Save
							Student</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
