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

public class ChangeStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String websiteId = request.getParameter("websiteId");
        String status = request.getParameter("status");

        try {
            // Update the status in the database
            String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
            String dbUser = "root";
            String dbPassword = "#Pranay999";

            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            String sql = "UPDATE websites SET status = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, status);
            statement.setString(2, websiteId);

            statement.executeUpdate();

            // Redirect back to the dashboard
            response.sendRedirect("dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating project status.");
        }
    }
}