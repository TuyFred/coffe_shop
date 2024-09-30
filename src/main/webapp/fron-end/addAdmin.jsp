<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Admin - Admin Dashboard</title>
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
            <h2>Add New Admin</h2>
            <div class="card">
                <div class="card-body">
                    <form action="processAddAdmin.jsp" method="post">
                        <div class="form-group">
                            <label for="adminUsername">Username:</label>
                            <input type="text" class="form-control" id="adminUsername" name="adminUsername" required>
                        </div>
                        <div class="form-group">
                            <label for="adminEmail">Email:</label>
                            <input type="email" class="form-control" id="adminEmail" name="adminEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="adminPassword">Password:</label>
                            <input type="password" class="form-control" id="adminPassword" name="adminPassword" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Add Admin</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
