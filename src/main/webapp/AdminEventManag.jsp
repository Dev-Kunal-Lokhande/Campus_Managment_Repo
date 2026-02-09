<%@ page import="java.util.List"%>
<%@ page import="Model.AdminEvent"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Event Management</title>
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
	height: 122vh;
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

	<!-- Top Navbar (Copied from AdminEvent.jsp) -->
	<nav class="navbar navbar-expand-lg navbar-dark shadow"
		style="background: linear-gradient(135deg, #7f6be8, #9b8df1);">

		<div class="container-fluid">
			<a class="navbar-brand fw-bold" href="#">Campus Event System</a>

			<div class="collapse navbar-collapse justify-content-end">
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

			<!-- Sidebar (Copied from AdminEvent.jsp) -->
			<div class="col-md-2 sidebar p-3">
				<h4 class="text-center mb-4">Admin Panel</h4>

				<a href="AdminEvent_M">Dashboard</a> <a href="AEventmanage">Manage
					Events</a> <a href="StudentManage">Manage Students</a> <a
					href="AdminLogin.html">Logout</a>
			</div>

			<!-- Main Content -->
			<div class="col-md-10 p-4">

				<h2 class="mb-4">Event Management</h2>

				<!-- Add Event -->
				<div class="card shadow p-4 mb-4">
					<h5 class="mb-3">Add New Event</h5>

					<form action="AEventmanage" method="post">
						<div class="row">
							<div class="col-md-4">
								<label>Event Name</label> <input type="text"
									class="form-control" name="name" required>
							</div>

							<div class="col-md-4">
								<label>Date</label> <input type="date" class="form-control"
									name="date" required>
							</div>

							<div class="col-md-4">
								<label>Location</label> <input type="text" class="form-control"
									name="location" required>
							</div>
						</div>

						<button type="submit" class="btn btn-theme mt-3">Save
							Event</button>
					</form>
				</div>

				<!-- Event Table -->
				<div class="card shadow p-4">
					<h5 class="mb-3">All Events</h5>

					<div style="max-height: 300px; overflow-y: auto;">
						<div class="table-responsive">
							<table class="table table-hover align-middle mb-0">

								<thead class="table-light">
									<tr>
										<th>ID</th>
										<th>Event Name</th>
										<th>Date</th>
										<th>Location</th>
										<th class="text-center" style="width: 150px;">Action</th>
									</tr>
								</thead>

								<tbody>
									<%
									List<AdminEvent> list = (List<AdminEvent>) request.getAttribute("eventList");

									if (list == null || list.size() == 0) {
									%>
									<tr>
										<td colspan="5" class="text-center text-muted py-4">No
											Events Found</td>
									</tr>
									<%
									} else {
									for (AdminEvent a : list) {
									%>
									<tr>
										<td class="fw-semibold"><%=a.getId()%></td>
										<td><%=a.getName()%></td>
										<td><%=a.getEDate()%></td>
										<td><%=a.getLocation()%></td>

										<td class="text-center"><a href="Update_event?id=<%=a.getId()%>"
											class="btn btn-sm btn-warning me-2" data-bs-toggle="modal"
											data-bs-target="#UpdateEventModal"> Edit </a> <a
											href="DeleteAE?id=<%=a.getId()%>"
											class="btn btn-sm btn-danger">Delete </a></td>
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
		</div>
	</div>
	<!-- Update Event Modal -->
<div class="modal fade" id="UpdateEventModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content shadow">

            <div class="modal-header"
                 style="background: linear-gradient(135deg, #7f6be8, #9b8df1); color:white;">
                <h5 class="modal-title">Update Event</h5>
                <button type="button" class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body p-4">

                <form>
                    <div class="mb-3">
                        <label class="form-label">Event Name</label>
                        <input type="text" class="form-control"
                               placeholder="Enter event name" value='' name="name" required="required">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Event Date</label>
                        <input type="date" class="form-control">
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Location</label>
                        <input type="text" class="form-control"
                               placeholder="Enter location">
                    </div>

                    <button type="submit" class="btn btn-theme w-100">
                        Update Event
                    </button>
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
