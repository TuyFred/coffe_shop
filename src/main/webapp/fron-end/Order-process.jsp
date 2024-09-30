<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Process</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .container {
            margin-top: 50px;
            max-width: 800px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="home.jsp">Coffee Shop</a>
</nav>

<div class="container">
    <h2>Processing Your Order</h2>
    <%
        // Get form data from the request
        String itemId = request.getParameter("item_id");
        String quantity = request.getParameter("quantity");
        String customerName = request.getParameter("customer_name");

        // Database connection variables
        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee", "root", "");

            // Create an SQL insert statement
            String sql = "INSERT INTO orders (item_id, quantity, customer_name) VALUES (?, ?, ?)";
            ps = con.prepareStatement(sql);
            ps.setString(1, itemId);
            ps.setString(2, quantity);
            ps.setString(3, customerName);

            // Execute the query
            int rows = ps.executeUpdate();

            if (rows > 0) {
                // Success message
                %>
                <div class="alert alert-success" role="alert">
                    <h4>Order Placed Successfully!</h4>
                    <p>Thank you, <%= customerName %>! Your order has been placed.</p>
                    <a href="home.jsp" class="btn btn-primary">Go Back to Home</a>
                </div>
                <%
            } else {
                // Failure message
                %>
                <div class="alert alert-danger" role="alert">
                    <h4>Order Failed!</h4>
                    <p>Sorry, there was an error processing your order. Please try again.</p>
                    <a href="home.jsp" class="btn btn-danger">Go Back to Home</a>
                </div>
                <%
            }
        } catch (Exception e) {
            e.printStackTrace();
            %>
            <div class="alert alert-danger" role="alert">
                <h4>Error Occurred!</h4>
                <p><%= e.getMessage() %></p>
                <a href="home.jsp" class="btn btn-danger">Go Back to Home</a>
            </div>
            <%
        } finally {
            // Close resources
            if (ps != null) try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

