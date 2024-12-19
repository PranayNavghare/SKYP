<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SKYP Login</title>

<style>
body {
	font-family: 'Arial', sans-serif; /* Use Arial font */
	background-color: #f4f4f4; /* Light gray background */
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	overflow-x: hidden; /* Prevent horizontal scrollbar */
	margin: 0;
	padding: 0;
}

.container {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	width: 350px;
	text-align: center; /* Center text within the container */
}

h3 {
	color: #21618c; /* Blue text color */
	margin-bottom: 20px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"], input[type="reset"] {
	background-color: #21618c; /* Blue button color */
	color: white;
	padding: 12px 20px;
	margin: 10px 0;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	width: 100%;
	transition: background-color 0.3s; /* Smooth transition for hover effect */
}

input[type="submit"]:hover {
	background-color: #1a4d73; /* Darker blue on hover */
}

input[type="reset"] {
	background-color: #f44336; /* Red button color */
}

input[type="reset"]:hover {
	background-color: #da3b3b; /* Darker red on hover */
}

a {
	color: #21618c; /* Blue link color */
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.login-form {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.login-form input[type="text"],
.login-form input[type="password"] {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.login-form button {
	background-color: #21618c;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
}

.login-form button:hover {
	background-color: #1a4d73;
}

.login-form p {
	margin-top: 20px;
	text-align: center;
}

.login-form a {
	color: #21618c; /* Blue link color */
	text-decoration: none;
}

.login-form a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="container">
		<h3>SKYP Login</h3>
		<form action="<%=request.getContextPath()%>/login" method="post" class="login-form">
			<input type="text" name="accountid" placeholder="Account ID" required>
			<input type="text" name="username" placeholder="User Name" required>
			<input type="password" name="password" placeholder="Password" required>
			<button type="submit" value="submit" name="submit">Login</button>
			<button type="reset" value="reset" name="submit">Reset</button>
		</form>
		<p>
			New to SKYP? <a href="./custReg.jsp">Create an Account</a>
		</p>
	</div>

</body>
</html>