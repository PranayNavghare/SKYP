package skyp.profile.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import skyp.profile.model.Profile;

public class ProfileDao {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/skyp";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "#Pranay999";

    public Profile getProfileByUsername(String username) throws ClassNotFoundException, SQLException {
        String SELECT_PROFILE_SQL = "SELECT username, company, phone, email FROM customerdb WHERE username = ?";
        Profile profile = null;

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PROFILE_SQL)) {
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                profile = new Profile();
                profile.setUsername(rs.getString("username"));
                profile.setCompany(rs.getString("company"));
                profile.setPhone(rs.getString("phone"));
                profile.setEmail(rs.getString("email"));
            }
        }

        return profile;
    }

    public void updateProfile(Profile profile) throws ClassNotFoundException, SQLException {
        String UPDATE_PROFILE_SQL = "UPDATE customerdb SET company = ?, phone = ?, email = ? WHERE username = ?";

        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROFILE_SQL)) {
            preparedStatement.setString(1, profile.getCompany());
            preparedStatement.setString(2, profile.getPhone());
            preparedStatement.setString(3, profile.getEmail());
            preparedStatement.setString(4, profile.getUsername());
            preparedStatement.executeUpdate();
        }
    }
}
