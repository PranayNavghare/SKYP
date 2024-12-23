package skyp.profile.controller;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import skyp.profile.dao.ProfileDao;
import skyp.profile.model.Profile;

@WebServlet("/profile")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProfileDao profileDao = new ProfileDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("username");

		try {
			Profile profile = profileDao.getProfileByUsername(username);
			if (profile == null) {
				request.setAttribute("error", "Profile not found.");
				RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
				dispatcher.forward(request, response);
			} else {
				request.setAttribute("profile", profile);
				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "An error occurred while retrieving the profile.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String company = request.getParameter("company");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		Profile profile = new Profile();
		profile.setUsername(username);
		profile.setCompany(company);
		profile.setPhone(phone);
		profile.setEmail(email);

		try {
			profileDao.updateProfile(profile);
			response.sendRedirect("profile");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			request.setAttribute("error", "An error occurred while updating the profile.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			dispatcher.forward(request, response);
		}
	}
}
