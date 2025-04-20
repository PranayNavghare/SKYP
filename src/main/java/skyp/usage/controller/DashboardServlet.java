package skyp.usage.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import skyp.usage.dao.WebsiteDao;
import skyp.usage.model.Website;

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer userId = (Integer) session.getAttribute("userId");

        // Log the userId
        System.out.println("User ID from session: " + userId);

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            WebsiteDao websiteDao = new WebsiteDao();
            List<Website> websites = websiteDao.getWebsitesByUserId(userId);

            // Log the retrieved websites
            System.out.println("Websites retrieved for user ID " + userId + ":");
            for (Website website : websites) {
                System.out.println("Website Name: " + website.getWebsiteName() + ", Domain: " + website.getDomain());
            }

            request.setAttribute("websites", websites);
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}