<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { height: 100vh; width: 250px; background-color: #343a40; position: fixed; padding-top: 20px; }
        .sidebar a { padding: 10px 15px; text-decoration: none; color: white; display: block; }
        .sidebar a:hover { background-color: #495057; }
        .content { margin-left: 260px; padding: 20px; }
        .card { margin-top: 20px; }
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
            <h2>Reports</h2>
            <div class="card">
                <div class="card-body">
                    <p>This section can display various reports related to sales, user activity, etc.</p>
                    <ul>
                        <li><a href="sales-report.jsp">Sales Report</a></li>
                        <li><a href="user-activity-report.jsp">User Activity Report</a></li>
                        <li><a href="product-report.jsp">Product Report</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
