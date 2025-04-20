package skyp.billing.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import skyp.billing.model.Plan;

public class PlanDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/skyp";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "#Pranay999";

    public List<Plan> getAllPlans() {
        List<Plan> plans = new ArrayList<>();
        String query = "SELECT * FROM plans";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Plan plan = new Plan();
                plan.setId(rs.getInt("id"));
                plan.setName(rs.getString("name"));
                plan.setPrice(rs.getDouble("price"));
                plan.setStorageLimit(rs.getInt("storage_limit"));
                plan.setWebsiteLimit(rs.getInt("website_limit"));
                plan.setDescription(rs.getString("description"));
                plans.add(plan);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return plans;
    }
}