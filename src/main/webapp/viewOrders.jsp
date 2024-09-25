<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders - Coffee Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #343a40;
        }
        .sidebar {
            height: 100vh;
            width: 250px;
            background-color: #212529;
            position: fixed;
            padding-top: 20px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 1.1em;
            color: white;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .content {
            margin-left: 260px; /* Sidebar width + some margin */
            padding: 20px;
        }
        .card {
            transition: transform 0.2s;
        }
        .card:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Coffee Shop Admin Dashboard</a>
    </nav>

    <div class="sidebar">
        <a href="admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="manage-products.jsp"><i class="fas fa-coffee"></i> Manage Products</a>
        <a href="viewOrders.jsp"><i class="fas fa-shopping-cart"></i> Manage Orders</a>
        <a href="manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="reports.jsp"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="settings.jsp"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <div class="container">
            <h1 class="mt-4">All Orders</h1>
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Order ID</th>
                        <th>User ID</th>
                        <th>Order Date</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            // Load JDBC Driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Establish connection
                            String dbUrl = "jdbc:mysql://localhost:3306/coffee";
                            String dbUser = "root";
                            String dbPassword = "";
                            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

                            // Execute SQL query to fetch all orders
                            String sql = "SELECT * FROM orders";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(sql);

                            // Iterate through the result set and display orders
                            while (rs.next()) {
                                int orderId = rs.getInt("order_id");
                                int userId = rs.getInt("user_id");
                                Timestamp orderDate = rs.getTimestamp("order_date");
                                BigDecimal totalPrice = rs.getBigDecimal("total_price");
                                String status = rs.getString("status");
                    %>
                    <tr>
                        <td><%= orderId %></td>
                        <td><%= userId %></td>
                        <td><%= orderDate %></td>
                        <td><%= totalPrice %></td>
                        <td><%= status %></td>
                        <td class="action-buttons">
                            <form action="approveOrder.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="order_id" value="<%= orderId %>">
                                <button type="submit" class="btn btn-success btn-sm">Approve</button>
                            </form>
                            <form action="cancelOrder.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="order_id" value="<%= orderId %>">
                                <button type="submit" class="btn btn-warning btn-sm">Cancel</button>
                            </form>
                            <form action="deleteOrder.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="order_id" value="<%= orderId %>">
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close resources
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
