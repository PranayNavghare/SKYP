package skyp.login.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		try {
			// Database connection
			String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
			String dbUser = "root";
			String dbPassword = "#Pranay999";

			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

			// Check user credentials
			String sql = "SELECT id, username FROM users WHERE username = ? AND pass = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, username);
			statement.setString(2, password);

			ResultSet resultSet = statement.executeQuery();

			if (resultSet.next()) {
				int userId = resultSet.getInt("id");
				String fullName = resultSet.getString("username");

				// Start session
				HttpSession session = request.getSession();
				session.setAttribute("userId", userId);
				session.setAttribute("username", fullName);

				// Check if the user has selected a plan
				String planCheckSql = "SELECT COUNT(*) AS planCount FROM billing WHERE user_id = ?";
				PreparedStatement planCheckStmt = connection.prepareStatement(planCheckSql);
				planCheckStmt.setInt(1, userId);
				ResultSet planCheckResult = planCheckStmt.executeQuery();
				
				

				if (planCheckResult.next() && planCheckResult.getInt("planCount") > 0) {
					// User has a plan, redirect to dashboard
					response.sendRedirect("dashboard.jsp");
				} else {
					// No plan selected, redirect to plan selection page
					response.sendRedirect("PlanDisplayServlet");
				}
			} else {
				// Invalid credentials
				request.setAttribute("error", "Invalid username or password.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "An error occurred during login.");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}
}