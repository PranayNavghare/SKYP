package skyp.usage.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import skyp.usage.dao.WebsiteDao;
import skyp.usage.model.Website;

/**
 * Servlet implementation class DashboardServlet
 */
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get the logged-in user's username from the session
		String username = (String) request.getSession().getAttribute("username");
		if (username == null) {
			response.sendRedirect("login.jsp"); // Redirect to login if not logged in
			return;
		}

		// Fetch websites for the user
		WebsiteDao websiteDao = new WebsiteDao();
		List<Website> websites = websiteDao.getWebsitesByUser(username);

		// Set the websites as a request attribute and forward to the JSP
		request.setAttribute("websites", websites);
		RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
		dispatcher.forward(request, response);
	}

}
