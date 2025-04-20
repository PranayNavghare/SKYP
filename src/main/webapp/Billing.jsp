<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="skyp.billing.model.Billing" %>
<!DOCTYPE html>
<html>
<head>
    <title>Billing</title>
</head>
<body>
    <h1>Billing Information</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Plan Name</th>
                <th>Amount</th>
                <th>Billing Date</th>
                <th>Next Billing Date</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Billing> billingList = (List<Billing>) request.getAttribute("billingList");
                if (billingList != null && !billingList.isEmpty()) {
                    for (Billing billing : billingList) {
            %>
            <tr>
                <td><%= billing.getPlanName() %></td>
                <td><%= billing.getAmount() %></td>
                <td><%= billing.getBillingDate() %></td>
                <td><%= billing.getNextBillingDate() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">No billing information found.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>