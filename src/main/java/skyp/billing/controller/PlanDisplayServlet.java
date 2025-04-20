package skyp.billing.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import skyp.billing.dao.PlanDao;
import skyp.billing.model.Plan;

public class PlanDisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PlanDisplayServlet is being executed."); // Debug log

        PlanDao planDao = new PlanDao();
        List<Plan> plans = planDao.getAllPlans();

        request.setAttribute("plans", plans);
        request.getRequestDispatcher("plans.jsp").forward(request, response);
    }
}