<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKYP - Cloud Solutions</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #3498db;
            --secondary-color: #2980b9;
            --accent-color: #21618c;
            --background-color: #f4f4f4;
            --text-color: #333;
            --white: #ffffff;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: var(--background-color);
            color: var(--text-color);
            line-height: 1.6;
        }

        header {
            background-color: var(--primary-color);
            padding: 1rem 2rem;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow);
        }

        .header-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 2em;
            color: var(--white);
            text-decoration: none;
            font-weight: bold;
        }

        nav {
            display: flex;
            gap: 1rem;
        }

        nav a {
            color: var(--white);
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            transition: var(--transition);
        }

        nav a:hover {
            background-color: var(--accent-color);
        }

        .login-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: var(--transition);
            font-weight: 500;
        }

        .btn-primary {
            background-color: var(--accent-color);
            color: var(--white);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            transform: translateY(-2px);
        }

        main {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .welcome-section {
            text-align: center;
            margin-bottom: 3rem;
            padding: 2rem;
            background: var(--white);
            border-radius: 8px;
            box-shadow: var(--shadow);
        }

        .welcome-section h1 {
            color: var(--primary-color);
            font-size: 2.5em;
            margin-bottom: 1rem;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 3rem;
        }

        .feature-card {
            background: var(--white);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: var(--shadow);
            transition: var(--transition);
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-card h3 {
            color: var(--primary-color);
            margin-bottom: 1rem;
        }

        .contact-section {
            background: var(--white);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: var(--shadow);
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 1rem;
        }

        @media (max-width: 768px) {
            .header-container {
                flex-direction: column;
                gap: 1rem;
            }

            nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .login-buttons {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="header-container">
            <a href="index.jsp" class="logo">SKYP</a>
            <nav>
                <a href="index.jsp" class="active"><i class="fas fa-home"></i> Home</a>
                <a href="about.html"><i class="fas fa-info-circle"></i> About</a>
                <a href="contact.html"><i class="fas fa-envelope"></i> Contact</a>
                <a href="support.html"><i class="fas fa-headset"></i> Support</a>
            </nav>
            <div class="login-buttons">
                <button class="btn btn-primary" onclick="location.href='./login.jsp'">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
                <button class="btn btn-primary" onclick="location.href='./custReg.jsp'">
                    <i class="fas fa-user-plus"></i> Create Account
                </button>
            </div>
        </div>
    </header>

    <main>
        <section class="welcome-section">
            <h1>Welcome to SKYP</h1>
            <p>Empowering your digital journey with cutting-edge cloud solutions and reliable hosting services.</p>
        </section>

        <div class="features-grid">
            <div class="feature-card">
                <h3><i class="fas fa-server"></i> Space Allocation</h3>
                <p>Smart space allocation for optimal resource utilization and cost efficiency.</p>
            </div>
            <div class="feature-card">
                <h3><i class="fas fa-tasks"></i> Product Selection</h3>
                <p>Tailored hosting solutions to match your specific needs and requirements.</p>
            </div>
            <div class="feature-card">
                <h3><i class="fas fa-chart-line"></i> Report Generation</h3>
                <p>Detailed analytics and insights for informed decision-making.</p>
            </div>
        </div>

        <section class="contact-section">
            <h2><i class="fas fa-envelope"></i> Contact Us</h2>
            <form class="contact-form">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Your Name" required>
                </div>
                <div class="form-group">
                    <input type="email" class="form-control" placeholder="Your Email" required>
                </div>
                <div class="form-group">
                    <textarea class="form-control" placeholder="Your Message" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Message</button>
            </form>
        </section>
    </main>
</body>
</html>