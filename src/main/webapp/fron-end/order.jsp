<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Coffee</title>
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
    <h2>Place Your Order</h2>
    <form action="Order-process.jsp" method="POST">
        <div class="mb-3">
            <label for="item" class="form-label">Choose Coffee</label>
            <select class="form-select" name="item_id" required>
                <option value="">Select Coffee</option>
                <%
                    // Database Connection
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee", "root", "");
                        stmt = con.createStatement();
                        String query = "SELECT item_id, item_name FROM items"; // Adjust table name
                        rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            %>
                            <option value="<%= rs.getInt("item_id") %>">
                                <%= rs.getString("item_name") %>
                            </option>
                            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        if (con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
                    }
                %>
            </select>
        </div>

        <div class="mb-3">
            <label for="quantity" class="form-label">Quantity</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>

        <div class="mb-3">
            <label for="customer_name" class="form-label">Your Name</label>
            <input type="text" class="form-control" id="customer_name" name="customer_name" required>
        </div>

        <button type="submit" class="btn btn-primary">Order Now</button>
    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
