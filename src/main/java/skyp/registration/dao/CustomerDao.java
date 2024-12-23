package skyp.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import skyp.registration.model.Customer;

public class CustomerDao {

	public int custReg(Customer cust) {

		String query = "insert into customerdb(username,pass,company,phone,email,role) values(?,?,?,?,?,?);";

		int result = 0;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skyp", "root", "#Pranay999");

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, cust.getUsername());
			ps.setString(2, cust.getPassword());
			ps.setString(3, cust.getCompany());
			ps.setString(4, cust.getPhone());
			ps.setString(5, cust.getMail());
			ps.setString(6, cust.getRole());

			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}
}
