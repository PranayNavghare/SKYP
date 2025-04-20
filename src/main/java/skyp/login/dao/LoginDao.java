package skyp.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import skyp.login.bean.LoginBean;

public class LoginDao {
	private String jdbcURL = "jdbc:mysql://localhost:3306/skyp";
	private String jdbcUsername = "root";
	private String jdbcPassword = "#Pranay999";
	private String jdbcDriver = "com.mysql.cj.jdbc.Driver";

	public void loadDriver(String jdbcDriver) {
		try {
			Class.forName(jdbcDriver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}

	public int validate(LoginBean loginBean) {
		int userId = -1; // Default value indicating invalid login

		loadDriver(jdbcDriver);
		Connection connection = getConnection();
		String sql = "SELECT id FROM users WHERE username = ? AND pass = ?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, loginBean.getUsername());
			preparedStatement.setString(2, loginBean.getPassword());

			ResultSet resultSet = preparedStatement.executeQuery();
			if (resultSet.next()) {
				userId = resultSet.getInt("id"); // Retrieve the user ID
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userId;
	}
}
