<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="skyp.usage.model.Website"%>
<%@ page import="java.sql.*"%>

<%
// Check if the session is valid
if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
	return;
}

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

// Fetch the user's current plan details from the database
Integer userId = (Integer) session.getAttribute("userId");
String currentPlanName = "No Plan Selected";
double currentPlanPrice = 0.0;
int storageLimit = 0;
int websiteLimit = 0;
String nextBillingDate = "N/A";

try {
	String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
	String dbUser = "root";
	String dbPassword = "#Pranay999";

	Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
	String sql = "SELECT p.name, p.price, p.storage_limit, p.website_limit, b.next_billing_date " + "FROM billing b "
	+ "JOIN plans p ON b.plan_id = p.id " + "WHERE b.user_id = ? " + "ORDER BY b.billing_date DESC LIMIT 1";
	PreparedStatement statement = connection.prepareStatement(sql);
	statement.setInt(1, userId);
	ResultSet rs = statement.executeQuery();

	if (rs.next()) {
		currentPlanName = rs.getString("name");
		currentPlanPrice = rs.getDouble("price");
		storageLimit = rs.getInt("storage_limit");
		websiteLimit = rs.getInt("website_limit");
		nextBillingDate = rs.getTimestamp("next_billing_date").toString();
	}

	connection.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SKYP - Dashboard</title>
<link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<body>
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
							String publicUrl = request.getContextPath() + "/uploads/" + website.getUsername() + "/"
							+ website.getWebsiteName() + "/index.html";
					%>
					<tr>
						<td><%=website.getWebsiteName()%></td>
						<td><%=website.getDomain()%></td>
						<td class="status <%=website.getStatus().toLowerCase()%>"><%=website.getStatus()%></td>
						<td>
							<!-- Visit Website --> <a href="<%=publicUrl%>" target="_blank"
							class="visit-btn">Visit Website</a> <!-- Change Status -->
							<form action="<%=request.getContextPath()%>/ChangeStatusServlet"
								method="post" style="display: inline;">
								<input type="hidden" name="websiteId"
									value="<%=website.getId()%>"> <select name="status"
									onchange="this.form.submit()">
									<option value="Active"
										<%=website.getStatus().equals("Active") ? "selected" : ""%>>Active</option>
									<option value="Inactive"
										<%=website.getStatus().equals("Inactive") ? "selected" : ""%>>Inactive</option>
								</select>
							</form>
						</td>
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
	</section>

	<%
	int currentWebsiteCount = websites != null ? websites.size() : 0;
	%>
	<section class="add-website">
		<h2>Add a New Website</h2>
		<%
		if (currentWebsiteCount >= websiteLimit) {
		%>
		<p>You have reached the maximum number of websites allowed for
			your plan.</p>
		<%
		} else {
		%>
		<form action="<%=request.getContextPath()%>/AddWebsiteServlet"
			method="post" enctype="multipart/form-data"
			style="background-color: #222; padding: 20px; border-radius: 10px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); max-width: 600px; margin: 0 auto; color: #fff; box-sizing: border-box;">

			<label for="websiteName"
				style="display: block; font-size: 1rem; margin-bottom: 5px; color: #ccc;">Website
				Name:</label> <input type="text" id="websiteName" name="websiteName"
				required
				style="width: calc(100% - 20px); padding: 10px; font-size: 1rem; border: 1px solid #444; border-radius: 5px; background: #333; color: #fff; margin-bottom: 15px; box-sizing: border-box;">

			<label for="domain"
				style="display: block; font-size: 1rem; margin-bottom: 5px; color: #ccc;">Domain:</label>
			<input type="text" id="domain" name="domain" required
				style="width: calc(100% - 20px); padding: 10px; font-size: 1rem; border: 1px solid #444; border-radius: 5px; background: #333; color: #fff; margin-bottom: 15px; box-sizing: border-box;">

			<label for="websiteFiles"
				style="display: block; font-size: 1rem; margin-bottom: 5px; color: #ccc;">Upload
				Website Files:</label> <input type="file" id="websiteFiles"
				name="websiteFiles" multiple required
				style="width: calc(100% - 20px); padding: 10px; font-size: 1rem; border: 1px solid #444; border-radius: 5px; background: #333; color: #fff; margin-bottom: 20px; box-sizing: border-box;">

			<button type="submit"
				style="background-color: #ff4d94; color: white; padding: 12px 20px; font-size: 1rem; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s ease, transform 0.2s ease; width: 100%;"
				onmouseover="this.style.backgroundColor='#ff1a75'; this.style.transform='scale(1.05)';"
				onmouseout="this.style.backgroundColor='#ff4d94'; this.style.transform='scale(1)';">
				Add Website</button>
		</form>
		<%
		}
		%>
	</section>

	<section class="hosting">
		<h2>Hosting Plan</h2>
		<p>
			<strong>Plan Name:</strong>
			<%=currentPlanName%></p>
		<p>
			<strong>Price:</strong> $<%=currentPlanPrice%>
			per month
		</p>
		<p>
			<strong>Storage Limit:</strong>
			<%=storageLimit%>
			GB
		</p>
		<p>
			<strong>Website Limit:</strong>
			<%=websiteLimit%>
			websites
		</p>
		<p>
			<strong>Next Billing Date:</strong>
			<%=nextBillingDate%></p>
		<a href="PlanDisplayServlet"
			style="background-color: #ff4d94; color: white; padding: 10px 20px; font-size: 1rem; border: none; border-radius: 5px; text-decoration: none; cursor: pointer; transition: background-color 0.3s ease;"
			onmouseover="this.style.backgroundColor='#ff1a75';"
			onmouseout="this.style.backgroundColor='#ff4d94';"> Upgrade Plan
		</a>
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