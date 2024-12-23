<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>SKYP Login</title>
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --accent-color: #e74c3c;
            --gradient: linear-gradient(135deg, #3498db, #2980b9);
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6f8fd, #f0f2f5);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient);
        }

        h3 {
            color: var(--primary-color);
            font-size: 2em;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .login-form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .input-group {
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 15px;
            padding-left: 40px; /* Adjust for icon */
            border: 2px solid #eee;
            border-radius: 12px;
            font-size: 1em;
            transition: all 0.3s ease;
            background: #f8f9fa;
        }

        .input-group input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(52, 152, 219, 0.1);
            outline: none;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        button {
            padding: 15px;
            border: none;
            border-radius: 12px;
            font-size: 1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button[type="submit"] {
            background: var(--gradient);
            color: white;
        }

        button[type="reset"] {
            background: #f8f9fa;
            color: #666;
            border: 2px solid #eee;
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .create-account {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .create-account p {
            color: #666;
            margin-bottom: 15px;
        }

        .create-account a {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .create-account a:hover {
            color: var(--secondary-color);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .container {
            animation: fadeIn 0.5s ease-out;
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="container">
        <h3>Welcome Back</h3>
        <form action="<%=request.getContextPath()%>/login" method="post" class="login-form">
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
            <button type="submit" value="submit" name="submit">
                <i class="fas fa-sign-in-alt"></i> Login
            </button>
            <button type="reset" value="reset" name="reset">
                <i class="fas fa-redo"></i> Reset
            </button>
        </form>
        <div class="create-account">
            <p>New to SKYP?</p>
            <a href="./custReg.jsp">Create an Account <i class="fas fa-arrow-right"></i></a>
        </div>
    </div>
</body>
</html>
