package skyp.registration.controller;

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

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");

        // Validate email format
        if (email == null || email.trim().isEmpty() || !isValidEmail(email)) {
            request.setAttribute("error", "Invalid email format.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        try {
            // Check if the email exists in the database
            String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
            String dbUser = "root";
            String dbPassword = "your_password";

            Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            PreparedStatement ps = con.prepareStatement("SELECT * FROM customerdb WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Generate a reset link (for simplicity, just display a message)
                request.setAttribute("message", "A password reset link has been sent to your email.");
            } else {
                request.setAttribute("error", "Email not found.");
            }

            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
        }
    }

    private boolean isValidEmail(String email) {
        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        return email.matches(emailRegex);
    }
}