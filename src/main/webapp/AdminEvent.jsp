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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

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
/* login msg faild  */
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

.notification-menu {
	width: 280px;
	max-height: 300px;
	overflow-y: auto;
}

.notification-item {
	display: flex;
	gap: 10px;
	align-items: center;
	transition: 0.2s;
	cursor: pointer;
}

.notification-item:hover {
	background: #f1f1f1;
	padding-left: 10px;
}

.notification-btn:hover {
	transform: scale(1.1);
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
					<li class="nav-item dropdown me-3"><a
						class="nav-link text-white position-relative notification-btn"
						href="#" role="button" data-bs-toggle="dropdown"> <i
							class="bi bi-bell fs-5"></i> <span id="notiCount"
							class="position-absolute top-1 start-99 translate-middle badge rounded-pill bg-danger">
								3 </span>

					</a>

						<ul
							class="dropdown-menu dropdown-menu-end shadow notification-menu">

							<li class="dropdown-header d-flex justify-content-between">

								<span>Notifications</span>
								<button class="btn btn-sm btn-link text-decoration-none"
									onclick="clearNotification()">Clear</button>

							</li>

							<div id="notificationList">

								<li class="dropdown-item notification-item"><i
									class="bi bi-person-plus text-primary"></i> New student
									registered</li>

								<li class="dropdown-item notification-item"><i
									class="bi bi-calendar-event text-success"></i> New event added
								</li>

								<li class="dropdown-item notification-item"><i
									class="bi bi-gear text-warning"></i> System update</li>

							</div>

							<li><hr class="dropdown-divider"></li>

							<li class="text-center"><a class="dropdown-item" href="#">View
									All</a></li>

						</ul></li>

					<li class="nav-item"><a class="btn b>tn-light btn-sm"
						href="AdminLogin.jsp">Logout</a></li>

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
					href="AdminLogin.jsp">Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<!-- Dashboard -->
				<div class="d-flex justify-content-between align-items-center mb-3">

					<!-- Left Side -->
					<h2 id="dashboard" class="mb-0">Dashboard</h2>

					<!-- Right Side -->
					<%
					String loginMsg = (String) session.getAttribute("loginMsg");
					if (loginMsg != null) {
					%>

					<div
						class="alert d-flex align-items-center py-2 px-3 mb-0 success-animate right-alert"
						style="background-color: #d4edda; border-left: 6px solid #28a745; color: #155724;">



						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							class="ms-2" viewBox="0 0 16 16">

        <!-- Green Circle -->
        <circle cx="8" cy="8" r="8" fill="#28a745" />

        <!-- White Tick -->
        <path fill="white"
								d="M11.03 5.97a.75.75 0 0 0-1.08.02L7 9.293 5.97 8.26a.75.75 0 1 0-1.06 1.06l1.72 1.72a.75.75 0 0 0 1.08-.02l3.32-4.18a.75.75 0 0 0-.02-1.08z" />
    </svg>

						<div><%=loginMsg%></div>

					</div>

					<%
					session.removeAttribute("loginMsg");
					}
					%>


				</div>

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
				<div class="d-flex justify-content-end mb-3">

					<input type="text" id="eventSearch" class="form-control me-2"
						placeholder="Search Event..." onkeyup="SearchByname(this.value)"
						style="width: 200px;">

					<button class="btn btn-theme" data-bs-toggle="modal"
						data-bs-target="#addEventModal">Add Event</button>

				</div>

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
						<tbody id="EventTable">


							<%
							List<AdminEvent> list = (List<AdminEvent>) request.getAttribute("eventList");

							if (list == null || list.size() == 0) {
							%>
							<tr>
								<td colspan="5" class="text-center">No Events Found</td>
							</tr>
							<%
							} else {
							int count = 1;
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
				<div class="d-flex justify-content-end mb-3">

					<input type="text" id="studentSearch" class="form-control me-2"
						placeholder="Search Student..." onkeyup="searchStudent()"
						style="width: 200px;">

					<button class="btn btn-theme" data-bs-toggle="modal"
						data-bs-target="#addStudentModal">Add Student</button>

				</div>
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
							int count = 1;
							for (AdminEvent a : listS) {
							%>

							<tr>
								<td><%=count++%></td>
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
						Integer AdminId = (Integer) session.getAttribute("AdminId");

						if (AdminId == null) {
							out.print("not found");
						}
						%>
						<div class="mb-3">
							<input type="hidden" name="adminId" value='<%=AdminId%>'>
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
	function clearNotification(){

		let list = document.getElementById("notificationList");

		list.innerHTML = "<li class='dropdown-item text-center'>No Notifications</li>";

		document.getElementById("notiCount").innerText = "0";

		}

	</script>
	<script src='<%=request.getContextPath()%>/JS/AE_Ajax.js' type="text/javascript"></script>
</body>
</html>
