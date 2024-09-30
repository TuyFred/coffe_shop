<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String dbURL = "jdbc:mysql://localhost:3306/coffee";
    String dbUser = "root";
    String dbPassword = "";

    int totalProducts = 0;
    int totalOrders = 0;
    int totalUsers = 0;

    // Get total counts using a single connection
    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         Statement stmt = conn.createStatement()) {

        // Combined query to get all counts in one go
        String query = "SELECT "
                     + "(SELECT COUNT(*) FROM products) AS totalProducts, "
                     + "(SELECT COUNT(*) FROM orders) AS totalOrders, "
                     + "(SELECT COUNT(*) FROM users) AS totalUsers";
        
        try (ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                totalProducts = rs.getInt("totalProducts");
                totalOrders = rs.getInt("totalOrders");
                totalUsers = rs.getInt("totalUsers");
            }
        }

    } catch (SQLException e) {
        e.printStackTrace(); // Handle exception properly in production code
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Coffee Shop</title>
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
            <h2>Admin Options</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="card border-primary">
                        <div class="card-body text-center">
                            <i class="fas fa-coffee text-primary"></i>
                            <h5 class="card-title mt-3">Total Products</h5>
                            <p class="card-text"><span class='badge badge-primary'><%= totalProducts %></span></p>
                            <a href="manage-products.jsp" class="btn btn-primary">View Products</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-success">
                        <div class="card-body text-center">
                            <i class="fas fa-shopping-cart text-success"></i>
                            <h5 class="card-title mt-3">Total Orders</h5>
                            <p class="card-text"><span class='badge badge-success'><%= totalOrders %></span></p>
                            <a href="viewOrders.jsp" class="btn btn-success">View Orders</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-info">
                        <div class="card-body text-center">
                            <i class="fas fa-users text-info"></i>
                            <h5 class="card-title mt-3">Total Users</h5>
                            <p class="card-text"><span class='badge badge-info'><%= totalUsers %></span></p>
                            <a href="manage-users.jsp" class="btn btn-info">View Users</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
