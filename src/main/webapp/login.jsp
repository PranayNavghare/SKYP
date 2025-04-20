<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKYP Login</title>
    <link rel="stylesheet" href="assets/css/styles2.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="auth-container">
        <div class="info-section">
            <h2>Welcome Back</h2>
            <p>Login to manage your SKYP web hosting account.</p>
            <a href="./custReg.jsp" class="switch-btn">Create an Account</a>
        </div>
        <div class="form-section">
            <h3>Login to Your Account</h3>
            <form action="<%=request.getContextPath()%>/Login" method="post">
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="accountid" placeholder="Account ID" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-user"></i>
                    <input type="text" name="username" placeholder="Username" required>
                </div>
                <div class="input-group">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="auth-btn">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
                <!-- Forgot Password Button -->
                <a href="./forgotPassword.jsp" class="auth-btn" style="text-align: center; display: block; margin-top: 10px;">
                    <i class="fas fa-key"></i> Forgot Password?
                </a>
            </form>
        </div>
    </div>
</body>
</html>