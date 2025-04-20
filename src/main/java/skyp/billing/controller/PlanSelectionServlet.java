package skyp.billing.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Calendar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class PlanSelectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int planId = Integer.parseInt(request.getParameter("planId"));

        try {
            // Database connection
            String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
            String dbUser = "root";
            String dbPassword = "#Pranay999";

            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Fetch plan details
            String planQuery = "SELECT name, price FROM plans WHERE id = ?";
            PreparedStatement planStmt = connection.prepareStatement(planQuery);
            planStmt.setInt(1, planId);
            ResultSet rs = planStmt.executeQuery();

            String planName = null;
            double planPrice = 0.0;

            if (rs.next()) {
                planName = rs.getString("name");
                planPrice = rs.getDouble("price");
            }

            if (planName == null) {
                throw new Exception("Plan not found for planId: " + planId);
            }

            // Calculate next billing date (1 month later)
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.MONTH, 1);
            Timestamp nextBillingDate = new Timestamp(calendar.getTimeInMillis());

            // Insert billing record
            String sql = "INSERT INTO billing (user_id, plan_id, plan_name, amount, billing_date, next_billing_date) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            statement.setInt(2, planId);
            statement.setString(3, planName); // Add plan name
            statement.setDouble(4, planPrice);
            statement.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            statement.setTimestamp(6, nextBillingDate);

            statement.executeUpdate();

            // Redirect to dashboard
            response.sendRedirect("dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("plans.jsp?error=true");
        }
    }
}