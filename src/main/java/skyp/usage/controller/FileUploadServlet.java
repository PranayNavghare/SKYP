package skyp.usage.controller;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@MultipartConfig // Enables file upload handling
public class FileUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        Part filePart = request.getPart("file");
        String fileName = filePart.getSubmittedFileName();

        String username = (String) request.getSession().getAttribute("username");
        if (username == null) {
            response.getWriter().println("Error: User is not logged in.");
            return;
        }
        
        String uploadDir = getServletContext().getRealPath("/uploads/" + username);
        File userDir = new File(uploadDir);
        if (!userDir.exists()) userDir.mkdirs(); // Create directory if it doesn't exist

        // Save the file to the user's directory
        try {
            filePart.write(uploadDir + File.separator + fileName);
            response.getWriter().println("File uploaded successfully to: " + uploadDir + File.separator + fileName);
        } catch (IOException e) {
            response.getWriter().println("Error uploading file: " + e.getMessage());
        }
    }
}