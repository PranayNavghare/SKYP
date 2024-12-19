package skyp.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import skyp.login.bean.LoginBean;

public class LoginDao {

	public boolean validate(LoginBean loginbean) {
		boolean status = false;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skyp", "root", "#Pranay999");

			String query = "select * from customerdb where id=? and username=? and pass=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, loginbean.getId());
			ps.setString(2, loginbean.getUsername());
			ps.setString(3, loginbean.getPassword());

			ResultSet set = ps.executeQuery();

			status = set.next();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
}
