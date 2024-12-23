<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SKYP - Account Created</title>
<style>
body {
  font-family: 'Arial', sans-serif;
  background-color: #f4f4f4;
  color: #333;
  margin: 0;
  padding: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start; /* Align content to the top */
  min-height: 100vh;
  overflow-x: hidden; /* Prevent horizontal scrollbar */
}

header {
  background-color: #3498db;
  color: white;
  padding: 20px 40px;
  text-align: center;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 80%;
  max-width: 800px;
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  margin-bottom: 50px;
}

h1 {
  margin: 0;
  font-size: 2.5em;
}

.container {
  background-color: #fff;
  padding: 60px 80px; /* Increased padding for larger layout */
  border-radius: 10px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  text-align: center;
  width: 80%;
  max-width: 800px; /* Increased max-width for larger layout */
  margin: 0 auto; /* Center the container horizontally */
}

.success-message {
  font-size: 2em; /* Increased font size */
  color: #3498db;
  margin-bottom: 30px; /* Increased margin */
}

.account-id {
  font-size: 3em; /* Increased font size */
  font-weight: bold;
  color: #21618c;
  margin-bottom: 40px; /* Increased margin */
}

.redirect-message {
  font-size: 1.2em; /* Increased font size */
  color: #555;
}
</style>
</head>
<body>
  <header>
    <h1>SKYP</h1>
  </header>

  <div class="container">
    <h2 class="success-message">Account Created Successfully!</h2>
    <p class="account-id">Your Account ID is:
      <%
      String q = "select id from customerdb where username=?";
      String uname = request.getParameter("username");

      Class.forName("com.mysql.cj.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skyp", "root", "#Pranay999");
      PreparedStatement ps = con.prepareStatement(q);
      ps.setString(1, uname);
      ResultSet set = ps.executeQuery();
      int id = 0;
      if(set.next()){
        id = set.getInt(1);
      }
      out.print(id);
      %>
    </p>
    <p class="redirect-message">You will be redirected to your dashboard shortly.</p>
  </div>

  <script type="text/javascript">
    setTimeout(function() {
      window.location.href = "dashboard.jsp";
    }, 4000);
  </script>
</body>
</html>