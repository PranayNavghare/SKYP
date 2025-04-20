<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/styles2.css">
    <style>
        /* Center the auth-container */
        .auth-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Full viewport height */
            background-color: #121212; /* Match the theme */
        }

        /* Style the form-section */
        .form-section {
            background: #222; /* Dark background */
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 400px; /* Limit the width */
            text-align: center;
        }

        /* Style the heading */
        .form-section h3 {
            color: #ffffff;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        /* Style the input group */
        .input-group {
            margin-bottom: 15px;
            position: relative;
        }

        .input-group i {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            color: #888;
        }

        .input-group input {
            width: 100%;
            padding: 10px 10px 10px 35px; /* Add padding for the icon */
            font-size: 1rem;
            border: 1px solid #444;
            border-radius: 5px;
            background: #333;
            color: #fff;
        }

        /* Style the button */
        .btn-primary {
            background-color: #ff4d94;
            color: #fff;
            padding: 10px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #ff3366;
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <div class="form-section">
            <h3>Forgot Password</h3>
            <form action="<%=request.getContextPath()%>/forgotPassword" method="post" class="auth-form">
                <div class="input-group">
                    <i class="fas fa-envelope"></i>
                    <input type="email" name="email" placeholder="Enter your registered email" required>
                </div>
                <button type="submit" class="btn-primary">Reset Password <i class="fas fa-arrow-right"></i></button>
            </form>
        </div>
    </div>
</body>
</html>