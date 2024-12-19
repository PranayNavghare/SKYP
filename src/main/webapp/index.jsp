<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>SKYP</title>
<style>
body {
	font-family: 'Arial', sans-serif; /* Use Arial font */
	background-color: #f4f4f4; /* Light gray background */
	color: #333; /* Dark gray text */
	margin: 0;
	padding: 0;
}

header {
	background-color: #3498db; /* Sky blue background */
	color: white;
	padding: 20px 40px; /* Add padding to the header */
	text-align: left; /* Align text to the left */
	display: flex; /* Use flexbox for alignment */
	justify-content: flex-start; /* Align items to the left */
	align-items: center; /* Align items vertically */
}

h1 {
	margin: 0;
	font-size: 2.5em; /* Larger header font size */
}

nav {
	background-color: #2980b9; /* Darker blue for navigation */
	padding: 10px 0;
	display: flex; /* Use flexbox for navigation */
	gap: 10px; /* Add spacing between navigation links */
	margin-left: 20px; /* Add margin to the left of navigation */
}

nav a {
	color: white;
	text-decoration: none;
	padding: 10px 15px;
	display: inline-block;
	transition: background-color 0.3s;
	/* Smooth transition for hover effect */
}

nav a:hover {
	background-color: #21618c; /* Even darker blue on hover */
}

.login-buttons {
	display: flex; /* Use flexbox for buttons */
	gap: 10px; /* Add spacing between buttons */
	margin-left: auto; /* Push buttons to the right */
}

.login-button, .create-account-button {
	background-color: #21618c; /* Blue button color */
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.login-button:hover {
	background-color: #1a4d73; /* Darker blue on hover */
}

.create-account-button:hover {
	background-color: #1a4d73; /* Darker blue on hover */
}

main {
	padding: 20px;
	text-align: center; /* Center content */
	width: 80%; /* Adjust width as needed */
	max-width: 800px; /* Adjust max-width as needed */
	margin: 0 auto; /* Center the main content horizontally */
}

h2 {
	color: #3498db; /* Matching header color */
	margin-bottom: 10px;
}

p {
	line-height: 1.6; /* Adjust line spacing */
}

.feature-blocks {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
	margin-bottom: 30px;
	width: 100%; /* Make feature blocks full width */
	max-width: 100%; /* Ensure feature blocks don't exceed screen width */
}

.feature-block {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
	text-align: left;
	width: 300px;
	flex: 1 1 300px; /* Allow for flexible width adjustment */
	margin-right: 20px; /* Add right margin to feature blocks */
}

.feature-block:last-child {
	margin-right: 0; /* Remove right margin from the last feature block */
}

.feature-block h3 {
	color: #3498db;
	margin-bottom: 10px;
}

.contact-support {
	margin-top: 30px;
	width: 100%; /* Make contact/support sections full width */
	max-width: 100%;
	/* Ensure contact/support sections don't exceed screen width */
}

.contact-support h2 {
	color: #3498db;
	margin-bottom: 10px;
}

.contact-support p {
	margin-bottom: 20px;
}

.contact-form, .support-form {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.contact-form input, .support-form input, .contact-form textarea,
	.support-form textarea {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.contact-form button, .support-form button {
	background-color: #21618c;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.contact-form button:hover, .support-form button:hover {
	background-color: #1a4d73;
}

.welcome-text {
	text-align: center;
	margin-bottom: 30px;
	width: 100%; /* Make welcome text full width */
	max-width: 100%; /* Ensure welcome text doesn't exceed screen width */
}

.welcome-text h2 {
	font-size: 2.5em;
	color: #3498db;
	margin-bottom: 10px;
}

.welcome-text p {
	font-size: 1.2em;
	line-height: 1.6;
	color: #555;
}
</style>
</head>
<body>

	<header>
		<h1>SKYP</h1>
		<nav>
			<a class="active" href="index.jsp">Home</a> <a href="about.html">About</a>
			<a href="contact.html">Contact</a> <a href="support.html">Support</a>
		</nav>
		<div class="login-buttons">
			<button class="login-button" onclick="location.href='./login.jsp'">Login</button>
			<button class="create-account-button"
				onclick="location.href='./custReg.jsp'">Create a SKYP
				Account</button>
		</div>
	</header>

	<main>
		<div class="welcome-text">
			<h2>Welcome to SKYP</h2>
			<p>Discover a world of possibilities with SKYP. Our platform
				connects you with the resources and tools you need to succeed.</p>
		</div>

		<div class="feature-blocks">
			<div class="feature-block">
				<h3>Space Allocation</h3>
				<p>Skyp optimizes your web hosting by intelligently allocating
					space, ensuring efficient resource utilization and preventing
					overspending.</p>
			</div>
			<div class="feature-block">
				<h3>Product Selection</h3>
				<p>Skyp empowers you to select the perfect product for your
					needs, offering a diverse range of hosting plans tailored to
					individual websites and projects.</p>
			</div>
			<div class="feature-block">
				<h3>Report Generation</h3>
				<p>Skyp generates comprehensive reports, providing valuable
					insights into your website's performance, resource usage, and
					cost-effectiveness.</p>
			</div>
		</div>

		<div class="contact-support">
			<h2>Contact Us</h2>
			<p>Have questions or need help? Reach out to us!</p>
			<form class="contact-form">
				<input type="text" placeholder="Your Name" required> <input
					type="email" placeholder="Your Email" required>
				<textarea placeholder="Your Message" required></textarea>
				<button type="submit">Send Message</button>
			</form>
		</div>

		<div class="contact-support">
			<h2>Need Support?</h2>
			<p>Find answers to common questions or get in touch with our
				support team.</p>
			<form class="support-form">
				<input type="text" placeholder="Your Account ID" required>
				<textarea placeholder="Describe your issue" required></textarea>
				<button type="submit">Submit Request</button>
			</form>
		</div>
	</main>

</body>
</html>