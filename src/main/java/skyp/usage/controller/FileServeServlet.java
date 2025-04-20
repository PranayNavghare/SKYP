package skyp.usage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sites/*")
public class FileServeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the requested path from the URL
        String requestedPath = request.getPathInfo(); // e.g., /john_doe/my_website/index.html

        // Validate the requested path
        if (requestedPath == null || requestedPath.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid file path.");
            return;
        }

        // Base directory for uploaded files
        String baseDir = getServletContext().getRealPath("") + File.separator + "uploads";

        // Full file path
        File file = new File(baseDir, requestedPath);

        // Check if the file exists and is not a directory
        if (!file.exists() || file.isDirectory()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found.");
            return;
        }

        // Set the content type based on the file extension
        String mimeType = getServletContext().getMimeType(file.getName());
        if (mimeType == null) {
            mimeType = "application/octet-stream";
        }
        response.setContentType(mimeType);

        // Set content length
        response.setContentLengthLong(file.length());

        // Write the file to the response output stream
        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }
}