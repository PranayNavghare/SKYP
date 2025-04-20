package skyp.usage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import skyp.usage.model.Website;

public class WebsiteDao {

	public List<Website> getWebsitesByUserId(int userId) {
	    List<Website> websites = new ArrayList<>();
	    String query = "SELECT * FROM websites WHERE user_id = ?";

	    try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skyp", "root", "#Pranay999");
	         PreparedStatement stmt = conn.prepareStatement(query)) {
	        stmt.setInt(1, userId);
	        System.out.println("Executing query: " + query + " with user_id: " + userId);

	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Website website = new Website();
	            website.setId(rs.getInt("id"));
	            website.setWebsiteName(rs.getString("website_name"));
	            website.setDomain(rs.getString("domain"));
	            website.setStatus(rs.getString("status"));
	            website.setCreatedAt(rs.getTimestamp("created_at"));
	            websites.add(website);

	            // Log each website retrieved
	            System.out.println("Retrieved Website: " + website.getWebsiteName() + ", Domain: " + website.getDomain());
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    System.out.println("Total websites retrieved: " + websites.size());
	    return websites;
	}
}