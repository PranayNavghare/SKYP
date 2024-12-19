<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>See You Soon!</title>

<style>
body {
	background-color: #f0f0f0;
	font-family: sans-serif;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.container {
	background-color: #fff;
	padding: 30px;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	text-align: center;
}

.icon {
	font-size: 6em;
	color: #2196F3; /* Blue color */
	margin-bottom: 20px;
}

.message {
	font-size: 1.2em;
	margin-bottom: 20px;
	color: #333;
}

.countdown {
	font-size: 1.5em;
	color: #333;
}
</style>

<script type="text/javascript">
	setTimeout(function() {
		window.location.href = "index.jsp";
	}, 4000);
</script>

</head>
<body>

	<div class="container">
		<i class="icon fas fa-check-circle"></i>
		<h2 class="message">Successfully Logged Out!</h2>
		<p>
			Redirecting you back to the home page shortly.
		</p>
	</div>

</body>
</html>