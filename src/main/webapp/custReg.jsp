<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKYP Create Account</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles2.css"> <!-- External CSS File -->
    <script>
	document.addEventListener("DOMContentLoaded", function () {
    	const form = document.querySelector(".auth-form");
    	const password = form.querySelector("input[name='password']");
    	const confirmPassword = form.querySelector("input[name='passwordCon']");

    	form.addEventListener("submit", function (event) {
        	if (password.value !== confirmPassword.value) {
            	event.preventDefault(); // Prevent form submission
            	alert("Passwords do not match. Please try again!");
            	confirmPassword.value = ""; // Clear confirm password field
            	confirmPassword.focus(); // Focus on confirm password field
        	}
    	});
	});
	</script>

</head>
<body>
    <div class="auth-container">
        <div class="info-section">
            <h2>Welcome to SKYP</h2>
            <p>Experience seamless web hosting with our reliable and powerful platform.</p>
            <a href="./login.jsp" class="switch-btn">Have an Account? Login</a>
        </div>
        <div class="form-section">
            <h3>Create Your SKYP Account</h3>
            <form action="<%=request.getContextPath()%>/register" method="post" class="auth-form">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="username" placeholder="Full Name" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-shield-alt"></i>
                    <input type="password" name="passwordCon" placeholder="Confirm Password" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-building"></i>
                    <input type="text" name="company" placeholder="Company Name" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-phone"></i>
                    <input type="tel" name="phone" placeholder="Phone Number" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Email Address" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-user-tag"></i>
                    <select name="role" required>
                        <option value="user">User</option> 
                        <option value="admin">Admin</option> 
                    </select>
                </div>
                <button type="submit" class="btn-primary">Register <i class="fas fa-arrow-right"></i></button>
            </form>
        </div>
    </div>
</body>
</html>
