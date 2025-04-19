package skyp.usage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import skyp.usage.model.Website;

public class WebsiteDao {
	private static final String JDBC_URL = "jdbc:mysql://localhost:3306/skyp";
	private static final String JDBC_USER = "root";
	private static final String JDBC_PASSWORD = "#Pranay999";

	public List<Website> getWebsitesByUser(String username) {
		List<Website> websites = new ArrayList<>();
		String query = "SELECT * FROM websites WHERE username = ?";

		try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
				PreparedStatement stmt = conn.prepareStatement(query)) {
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Website website = new Website();
				website.setId(rs.getInt("id"));
				website.setUsername(rs.getString("username"));
				website.setWebsiteName(rs.getString("website_name"));
				website.setDomain(rs.getString("domain"));
				website.setStatus(rs.getString("status"));
				website.setCreatedAt(rs.getTimestamp("created_at"));
				websites.add(website);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return websites;
	}
}