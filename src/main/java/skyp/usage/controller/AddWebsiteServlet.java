package skyp.usage.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AddWebsiteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String websiteName = request.getParameter("websiteName");
        String domain = request.getParameter("domain");

        // Validate input
        if (websiteName == null || websiteName.trim().isEmpty() || domain == null || domain.trim().isEmpty()) {
            request.setAttribute("error", "Website name and domain are required.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            return;
        }

        // Retrieve the username from the session
        HttpSession session = request.getSession(false);
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp"); // Redirect to login if session is invalid
            return;
        }

        // Save the website details to the database
        String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
        String dbUser = "root";
        String dbPassword = "#Pranay999"; // Replace with your MySQL root password

        String sql = "INSERT INTO websites (username, website_name, domain, status) VALUES (?, ?, ?, ?)";

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, username);
            statement.setString(2, websiteName);
            statement.setString(3, domain);
            statement.setString(4, "Active");

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("dashboard.jsp"); // Redirect back to the dashboard
            } else {
                request.setAttribute("error", "Failed to add website. Please try again.");
                request.getRequestDispatcher("dashboard.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}