
package skyp.login.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import skyp.login.bean.LoginBean;
import skyp.login.dao.LoginDao;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginDao logindao;

	public void init() {
		logindao = new LoginDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("accountid"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		LoginBean loginbean = new LoginBean();

		loginbean.setId(id);
		loginbean.setUsername(username);
		loginbean.setPassword(password);

		try {
			if (logindao.validate(loginbean)) {
				HttpSession session = request.getSession();
				session.setAttribute("username", username);
				response.sendRedirect("dashboard.jsp");
			} else {
				request.setAttribute("error", "Invalid username or password");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
