package skyp.usage.controller;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RunProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String websiteId = request.getParameter("websiteId");

        // Retrieve the project folder path
        String baseUploadPath = "D:\\Dynamic Web Project\\SKYP\\src\\main\\webapp\\uploads";
        String projectPath = baseUploadPath + File.separator + websiteId;

        // Simulate running the project (e.g., serve the index.html file)
        File indexFile = new File(projectPath, "index.html");
        if (indexFile.exists()) {
            response.sendRedirect(request.getContextPath() + "/sites/" + websiteId + "/index.html");
        } else {
            response.getWriter().println("Error: index.html not found in the project folder.");
        }
    }
}