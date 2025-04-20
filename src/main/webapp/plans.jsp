<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="skyp.billing.model.Plan" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select a Hosting Plan - SKYP Hosting</title>
    <link rel="stylesheet" href="assets/css/plans.css">
</head>
<body>
    <h1>Select a Hosting Plan</h1>

    <div class="plans-container">
        <%
            // Retrieve the list of plans from the request attribute
            List<skyp.billing.model.Plan> plans = (List<skyp.billing.model.Plan>) request.getAttribute("plans");

            if (plans != null && !plans.isEmpty()) {
                for (skyp.billing.model.Plan plan : plans) {
        %>
        <div class="plan">
            <h2><%= plan.getName() %></h2>
            <p><strong>Price:</strong> $<%= plan.getPrice() %> / month</p>
            <p><strong>Storage:</strong> <%= plan.getStorageLimit() %> MB</p>
            <p><strong>Websites:</strong> <%= plan.getWebsiteLimit() %></p>
            <p><%= plan.getDescription() %></p>
            <form action="PlanSelectionServlet" method="post">
                <input type="hidden" name="planId" value="<%= plan.getId() %>">
                <button type="submit">Select Plan</button>
            </form>
        </div>
        <%
                }
            } else {
        %>
        <p>No plans available at the moment. Please try again later.</p>
        <%
            }
        %>
    </div>
</body>
</html>