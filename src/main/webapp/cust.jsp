<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SKYP - Account Created</title>
    <link rel="stylesheet" href="assets/css/accCreated.css">
</head>
<body>

    <header>
        <div class="logo">
                <a href="index.jsp">
                	<img src="assets/images/logo.png" alt="SKYP Logo">
                </a>
            </div>
    </header>

    <div class="container">
        <h2 class="success-message">Account Created Successfully!</h2>
        <p class="account-id">Your Account ID is: 
            <%
            String q = "select id from users where username=?";
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
