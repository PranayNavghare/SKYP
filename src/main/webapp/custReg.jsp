<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Join SKYP | Create Account</title>
    <style>
        :root {
            --primary-color: #2196F3;
            --secondary-color: #1976D2;
            --gradient: linear-gradient(135deg, #2196F3, #1976D2);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f6f8fd, #e9ecef);
            min-height: 100vh;
            display: grid;
            place-items: center;
            padding: 20px;
        }

        .container {
            background: white;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            width: min(90%, 450px);
            margin: auto;
            position: relative;
        }

        .form-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .form-header h3 {
            color: #1a237e;
            font-size: clamp(1.5rem, 4vw, 1.8rem);
            margin-bottom: 10px;
        }

        .form-grid {
            display: grid;
            gap: 20px;
        }

        .input-group {
            position: relative;
        }

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .input-group i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        .button-group {
            display: grid;
            gap: 15px;
            margin-top: 20px;
        }

        button {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        button[type="submit"] {
            background: var(--gradient);
            color: white;
        }

        button[type="reset"] {
            background: #f8f9fa;
            color: #666;
            border: 2px solid #e0e0e0;
        }

        .login-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        @media (max-width: 480px) {
            .container {
                padding: 20px;
            }
            
            button {
                padding: 12px;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h3>Create your SKYP Account</h3>
        </div>
        
        <form name="userReg" action="<%=request.getContextPath()%>/register" method="post" class="form-grid">
            <div class="input-group">
                <input type="text" name="username" placeholder="Full Name" required>
                <i class="fas fa-user"></i>
            </div>
            
            <div class="input-group">
                <input type="password" name="password" placeholder="Password" required>
                <i class="fas fa-lock"></i>
            </div>
            
            <div class="input-group">
                <input type="password" name="passwordCon" placeholder="Confirm Password" required>
                <i class="fas fa-shield-alt"></i>
            </div>
            
            <div class="input-group">
                <input type="text" name="company" placeholder="Company Name" required>
                <i class="fas fa-building"></i>
            </div>
            
            <div class="input-group">
                <input type="tel" name="phone" placeholder="Phone Number" required>
                <i class="fas fa-phone"></i>
            </div>
            
            <div class="input-group">
                <input type="email" name="email" placeholder="Email Address" required>
                <i class="fas fa-envelope"></i>
            </div>
            
            <div class="input-group">
                <select name="role" required>
                    <option value="user">User</option> 
                    <option value="admin">Admin</option> 
                </select>
                <i class="fas fa-user-tag"></i>
            </div>

            <div class="button-group">
                <button type="submit">Create Account <i class="fas fa-arrow-right"></i></button>
                <button type="reset">Clear Form <i class="fas fa-redo"></i></button>
            </div>
        </form>
        
        <div class="login-link">
            <p>Already have an account? <a href="./login.jsp">Sign In</a></p>
        </div>
    </div>
</body>
</html>
