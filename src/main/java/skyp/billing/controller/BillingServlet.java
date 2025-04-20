package skyp.billing.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import skyp.billing.dao.BillingDao;
import skyp.billing.model.Billing;

@WebServlet("/billing")
public class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BillingDao billingDao = new BillingDao();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Billing> billingList = billingDao.getBillingByUserId(userId);
        request.setAttribute("billingList", billingList);
        request.getRequestDispatcher("billing.jsp").forward(request, response);
    }
}