package skyp.usage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 100 // 100MB
)
@WebServlet("/AddWebsiteServlet")
public class AddWebsiteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Retrieve form data
		String websiteName = request.getParameter("websiteName");
		String domain = request.getParameter("domain");

		// Retrieve the userId from the session
		HttpSession session = request.getSession(false);
		Integer userId = (Integer) session.getAttribute("userId");

		// Validate input
		if (userId == null || websiteName == null || websiteName.trim().isEmpty() || domain == null
				|| domain.trim().isEmpty()) {
			request.setAttribute("error", "All fields are required.");
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
			return;
		}

		// Use a fixed directory for file uploads
		String baseUploadPath = "D:\\Dynamic Web Project\\SKYP\\src\\main\\webapp\\uploads"; // Fixed directory path
		String userUploadPath = baseUploadPath + File.separator + userId; // Create a folder for the user
		File userUploadDir = new File(userUploadPath);
		if (!userUploadDir.exists()) {
			userUploadDir.mkdirs(); // Create the directory if it doesn't exist
		}

		try {
			// Save all uploaded files
			for (Part part : request.getParts()) {
			    String fileName = part.getSubmittedFileName();
			    if (fileName != null && !fileName.isEmpty()) {
			        String filePath = userUploadPath + File.separator + fileName;
			        part.write(filePath);
			    }
			}

			// Save website metadata to the database
			String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
			String dbUser = "root";
			String dbPassword = "#Pranay999";

			Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
			String sql = "INSERT INTO websites (user_id, website_name, domain, status) VALUES (?, ?, ?, ?)";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setInt(1, userId); // Use userId instead of username
			statement.setString(2, websiteName);
			statement.setString(3, domain);
			statement.setString(4, "Active");

			statement.executeUpdate();

			// Redirect to dashboard with success message
			response.sendRedirect("dashboard.jsp?success=true");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: " + e.getMessage());
			request.setAttribute("error", "An error occurred while processing your request.");
			request.getRequestDispatcher("dashboard.jsp").forward(request, response);
		}
	}
}