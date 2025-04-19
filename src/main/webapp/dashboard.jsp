<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.List"%>
<%@ page import="skyp.usage.model.Website"%>

<%
// Check if the session is valid
if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
	return;
}
%>

<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SKYP - Dashboard</title>
<link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<body>

	<script>
		function openModal() {
			document.getElementById("addWebsiteModal").style.display = "block";
		}

		function closeModal() {
			document.getElementById("addWebsiteModal").style.display = "none";
		}

		// Close the modal when clicking outside of it
		window.onclick = function(event) {
			const modal = document.getElementById("addWebsiteModal");
			if (event.target === modal) {
				modal.style.display = "none";
			}
		};
	</script>

	<%
	// Prevent browser caching
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	// Retrieve the username from the session
	String fullName = (String) session.getAttribute("username");
	String initials = "U"; // Default Initial

	// Calculate initials from the username
	if (fullName != null && !fullName.trim().isEmpty()) {
		String[] nameParts = fullName.trim().split("\\s+"); // Split by space
		String firstInitial = nameParts[0].substring(0, 1).toUpperCase();
		String lastInitial = nameParts.length > 1 ? nameParts[1].substring(0, 1).toUpperCase() : "";
		initials = firstInitial + lastInitial;
	}

	// Retrieve the list of websites from the request attribute
	List<skyp.usage.model.Website> websites = (List<skyp.usage.model.Website>) request.getAttribute("websites");
	%>

	<header>
		<div class="logo">
			<a href="index.jsp"> <img src="assets/images/logo.png"
				alt="SKYP Logo">
			</a>
		</div>
		<h1>
			Welcome back, <span class="highlight"><%=fullName != null ? fullName : "User"%>!</span>
		</h1>
		<div class="user-menu">
			<div class="user-icon"><%=initials%></div>
			<div class="dropdown">
				<a href="logout.jsp">Logout</a>
			</div>
		</div>
	</header>

	<section class="websites">
		<h2>My Websites</h2>
		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>Website Name</th>
						<th>Domain</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (websites != null && !websites.isEmpty()) {
						for (skyp.usage.model.Website website : websites) {
					%>
					<tr>
						<td><%=website.getWebsiteName()%></td>
						<td><%=website.getDomain()%></td>
						<td class="status <%=website.getStatus().toLowerCase()%>"><%=website.getStatus()%></td>
						<td><button class="manage-btn">Manage</button></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="4">No websites found. Use the form below to add
							a new website.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>

		<!-- Add Website Form -->
		<div class="add-website-form" >
			<h3>Add a New Website</h3>
			<form action="<%=request.getContextPath()%>/AddWebsiteServlet"
				method="post">
				<div class="form-group">
					<label for="websiteName">Website Name:</label> <input type="text"
						id="websiteName" name="websiteName" required>
				</div>
				<div class="form-group">
					<label for="domain">Domain:</label> <input type="text" id="domain"
						name="domain" placeholder="example.com" required>
				</div>
				<button type="submit" class="submit-btn">Add Website</button>
			</form>
		</div>
	</section>



	<section class="management">
		<h2>File & Database Management</h2>
		<div class="management-grid">
			<div class="box">
				<h3>File Manager</h3>
				<p>Upload, edit, and manage your website files.</p>
				<form action="<%=request.getContextPath()%>/FileUploadServlet"
					method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="file">Choose File:</label> <input type="file"
							id="file" name="file" required>
					</div>
					<button type="submit" class="file-btn">Upload File</button>
				</form>
			</div>
			<div class="box">
				<h3>Database Access</h3>
				<p>Manage your MySQL/PostgreSQL databases.</p>
				<button class="db-btn">Access Database</button>
			</div>
		</div>
	</section>

	<section class="hosting">
		<h2>Hosting Plan</h2>
		<p>
			You are currently on the <strong>Pro Plan</strong>.
		</p>
		<button class="upgrade-btn">Upgrade Plan</button>
	</section>

	<section class="support">
		<h2>Need Help?</h2>
		<p>
			Check our <a href="#">FAQ</a> or <a href="#">contact support</a>.
		</p>
		<button class="support-btn">Submit a Support Ticket</button>
	</section>

</body>
</html>