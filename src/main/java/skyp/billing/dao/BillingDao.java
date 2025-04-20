package skyp.billing.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import skyp.billing.model.Billing;

public class BillingDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/skyp";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "#Pranay999";

    public List<Billing> getBillingByUserId(int userId) {
        List<Billing> billingList = new ArrayList<>();
        String query = "SELECT * FROM billing WHERE user_id = ?";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Billing billing = new Billing();
                billing.setId(rs.getInt("id"));
                billing.setUserId(rs.getInt("user_id"));
                billing.setPlanName(rs.getString("plan_name"));
                billing.setAmount(rs.getDouble("amount"));
                billing.setBillingDate(rs.getTimestamp("billing_date"));
                billing.setNextBillingDate(rs.getTimestamp("next_billing_date"));
                billingList.add(billing);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return billingList;
    }

    public void addBilling(Billing billing) {
        String query = "INSERT INTO billing (user_id, plan_name, amount, billing_date, next_billing_date) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, billing.getUserId());
            stmt.setString(2, billing.getPlanName());
            stmt.setDouble(3, billing.getAmount());
            stmt.setTimestamp(4, billing.getBillingDate());
            stmt.setTimestamp(5, billing.getNextBillingDate());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}