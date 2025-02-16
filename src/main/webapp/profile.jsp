<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>SKYP - User Profile</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #3498db;
            color: white;
            padding: 20px 40px;
            text-align: left;
            display: flex;
            justify-content: flex-start;
            align-items: center;
        }
        .profile-container {
            max-width: 1000px;
            margin: 40px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .profile-header {
            display: flex;
            align-items: center;
            gap: 30px;
            padding: 20px;
            border-bottom: 2px solid #eee;
        }
        .profile-picture {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            background-color: #3498db;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 48px;
        }
        .profile-info {
            flex-grow: 1;
        }
        .profile-name {
            font-size: 24px;
            color: #3498db;
            margin-bottom: 10px;
        }
        .profile-stats {
            display: flex;
            gap: 30px;
            margin-top: 20px;
        }
        .stat-box {
            background: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
        }
        .stat-number {
            font-size: 24px;
            color: #3498db;
            font-weight: bold;
        }
        .profile-content {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 20px;
            padding: 20px;
        }
        .content-section {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .section-title {
            color: #3498db;
            margin-bottom: 15px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 5px;
        }
        .hosting-plan {
            background: white;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }
        .action-button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .action-button:hover {
            background-color: #2980b9;
        }
        .usage-bar {
            background: #e9ecef;
            height: 20px;
            border-radius: 10px;
            margin: 10px 0;
            overflow: hidden;
        }
        .usage-fill {
            background: #3498db;
            height: 100%;
            width: 75%;
            border-radius: 10px;
            transition: width 0.3s ease;
        }
        .activity-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 10px;
            border-bottom: 1px solid #eee;
        }
        .activity-date {
            color: #666;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <header>
        <h1>SKYP</h1>
    </header>

    <div class="profile-container">
        <div class="profile-header">
            <div class="profile-picture">${profile.username.substring(0, 2).toUpperCase()}</div>
            <div class="profile-info">
                <div class="profile-name">${profile.username}</div>
                <div>${profile.email}</div>
                <div class="profile-stats">
                    <div class="stat-box">
                        <div class="stat-number">0</div>
                        <div>Active Projects</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">_</div>
                        <div>Storage Used</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number">_</div>
                        <div>Uptime</div>
                    </div>
                </div>
            </div>
            <button class="action-button" onclick="window.location.href='editProfile.jsp'">Edit Profile</button>
        </div>

        <div class="profile-content">
            <div class="main-content">
                <div class="content-section">
                    <h2 class="section-title">Hosting Plans</h2>
                    <div class="hosting-plan">
                        <h3>Business Pro Plan</h3>
                        <p>Next billing date: July 15, 2024</p>
                        <div class="usage-bar">
                            <div class="usage-fill"></div>
                        </div>
                        <p>_% of 500GB used</p>
                    </div>
                </div>

                <div class="content-section">
                    <h2 class="section-title">Recent Activity</h2>
                    <div class="activity-item">
                        <span class="activity-date">Today 10:30 AM</span>
                        <span>Backup completed successfully</span>
                    </div>
                    <div class="activity-item">
                        <span class="activity-date">Yesterday 3:45 PM</span>
                                                <span>Storage space upgraded</span>
                    </div>
                    <div class="activity-item">
                        <span class="activity-date">Jun 10, 2024</span>
                        <span>New domain added</span>
                    </div>
                </div>
            </div>

            <div class="sidebar">
                <div class="content-section">
                    <h2 class="section-title">Quick Actions</h2>
                    <button class="action-button" style="width: 100%; margin-bottom: 10px;">Add New Domain</button>
                    <button class="action-button" style="width: 100%; margin-bottom: 10px;">Upgrade Plan</button>
                    <button class="action-button" style="width: 100%;">Contact Support</button>
                </div>

                <div class="content-section">
                    <h2 class="section-title">Account Status</h2>
                    <p>Member since: June 2024</p>
                    <p>Plan: Business Pro</p>
                    <p>Status: Active</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
