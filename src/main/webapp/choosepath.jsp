<!-- Updated display.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Choose Path</title>
    <style type="text/css">
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
            transition: background-color 0.3s; /* Smooth transition for hover effect */
        }
        nav a:hover {
            background-color: #21618c; /* Even darker blue on hover */
        }
        .logout-buttons {
            display: flex; /* Use flexbox for buttons */
            gap: 10px; /* Add spacing between buttons */
            margin-left: auto; /* Push buttons to the right */
        }
        .logout-button, .create-account-button {
            background-color: #21618c; /* Blue button color */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .logout-button:hover, .create-account-button:hover {
            background-color: #1a4d73; /* Darker blue on hover */
        }
        #services {
            padding: 20px;
            text-align: center; /* Center content */
            width: 80%; /* Adjust width as needed */
            max-width: 800px; /* Adjust max-width as needed */
            margin: 0 auto; /* Center the main content horizontally */
        }
        #services h2 {
            color: #3498db; /* Matching header color */
            margin-bottom: 10px;
        }
        #services ul {
            display: block;
            margin-bottom: 30px;
        }
        #services ul li {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: left;
            display: flex; /* Use flexbox for buttons */
            align-items: center; /* Center items vertically */
            cursor: pointer; /* Make the cursor a pointer for buttons */
            transition: background-color 0.3s;
        }
        #services ul li:hover {
            background-color: #f0f0f0; /* Lighter background on hover */
        }
        #services ul li h3 {
            color: #3498db;
            margin: 0;
            flex-grow: 1; /* Allow title to take available space */
        }
        #services ul li::after {
            content: '\2192'; /* Unicode for right arrow */
            font-size: 1.5em;
            color: #3498db;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <header>
        <h1>SKYP</h1>
        <div class="logout-buttons">
            <button class="logout-button" onclick="location.href='./logout.jsp'">Logout</button>
        </div>
    </header>
    <section id="services">
        <h2>Our Services</h2>
        <ul>
            <li>
                <h3>Space Allocation</h3>
            </li>
            <li>
                <h3>Product Selection</h3>
            </li>
            <li>
                <h3>Report Generation</h3>
            </li>
        </ul>
    </section>
</body>
</html>
