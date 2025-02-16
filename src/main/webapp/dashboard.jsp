<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKYP - Dashboard</title>
    <link rel="stylesheet" href="assets/css/dashboard.css">
</head>
<body>

	<%
    String fullName = (String) session.getAttribute("username"); // Assuming full name is stored in session
    String initials = "U"; // Default Initial

    if (fullName != null && !fullName.trim().isEmpty()) {
        String[] nameParts = fullName.trim().split("\\s+"); // Split by space
        String firstInitial = nameParts[0].substring(0, 1).toUpperCase();
        String lastInitial = nameParts.length > 1 ? nameParts[1].substring(0, 1).toUpperCase() : "";
        initials = firstInitial + lastInitial;
    }
%>
	
    <header>
    <div class="logo">
                <a href="index.jsp">
                	<img src="assets/images/logo.png" alt="SKYP Logo">
                </a>
            </div>
    <h1>Welcome back, <span class="highlight">User!</span></h1>
    <div class="user-menu">
        <div class="user-icon"><%= initials %></div>
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
                    <tr>
                        <td>MySite1</td>
                        <td>mysite1.com</td>
                        <td class="status active">Active</td>
                        <td><button class="manage-btn">Manage</button></td>
                    </tr>
                    <tr>
                        <td>MySite2</td>
                        <td>mysite2.com</td>
                        <td class="status inactive">Inactive</td>
                        <td><button class="manage-btn">Manage</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <button class="add-btn">+ Add New Website</button>
    </section>

    <section class="management">
        <h2>File & Database Management</h2>
        <div class="management-grid">
            <div class="box">
                <h3>File Manager</h3>
                <p>Upload, edit, and manage your website files.</p>
                <button class="file-btn">Open File Manager</button>
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
        <p>You are currently on the <strong>Pro Plan</strong>.</p>
        <button class="upgrade-btn">Upgrade Plan</button>
    </section>

    <section class="support">
        <h2>Need Help?</h2>
        <p>Check our <a href="#">FAQ</a> or <a href="#">contact support</a>.</p>
        <button class="support-btn">Submit a Support Ticket</button>
    </section>
</body>
</html>
