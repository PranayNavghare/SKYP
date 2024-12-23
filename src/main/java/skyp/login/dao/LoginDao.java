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

    public boolean validate(LoginBean loginBean) {
        boolean status = false;

        loadDriver(jdbcDriver);
        Connection connection = getConnection();
        String sql = "SELECT * FROM customerdb WHERE id = ? AND username = ? AND pass = ?";

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, loginBean.getId());
            preparedStatement.setString(2, loginBean.getUsername());
            preparedStatement.setString(3, loginBean.getPassword());

            ResultSet resultSet = preparedStatement.executeQuery();
            status = resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
