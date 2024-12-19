package skyp.registration.controller;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import skyp.registration.dao.CustomerDao;
import skyp.registration.model.Customer;

/**
 * Servlet implementation class CustomerReg
 */
@WebServlet("/register")
public class CustomerReg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	CustomerDao custDao = new CustomerDao();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerReg() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		RequestDispatcher dispatcher = request.getRequestDispatcher("custReg.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String company = request.getParameter("company");
		String phone = request.getParameter("phone");
		String mail = request.getParameter("email");

		Customer customer = new Customer();

		customer.setUsername(username);
		customer.setPassword(password);
		customer.setCompany(company);
		customer.setPhone(phone);
		customer.setMail(mail);

		try {
			custDao.custReg(customer);
		} catch (Exception e) {
			e.printStackTrace();
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("cust.jsp");
		dispatcher.forward(request, response);
	}

}
