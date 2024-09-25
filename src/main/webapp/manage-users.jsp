<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
class User {
    private int userId;
    private String username;
    private String email;
    private String role;
    private String createdAt;

    public User(int userId, String username, String email, String role, String createdAt) {
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.role = role;
        this.createdAt = createdAt;
    }

    public int getUserId() { return userId; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
    public String getRole() { return role; }
    public String getCreatedAt() { return createdAt; }
}

String dbURL = "jdbc:mysql://localhost:3306/coffee";
String dbUser = "root";
String dbPassword = "";

List<User> userList = new ArrayList<>();

try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM users")) {
    while (rs.next()) {
        int userId = rs.getInt("user_id");
        String username = rs.getString("username");
        String email = rs.getString("email");
        String role = rs.getString("role");
        String createdAt = rs.getString("created_at");
        userList.add(new User(userId, username, email, role, createdAt));
    }
} catch (SQLException e) {
    e.printStackTrace(); // Log the exception or handle it appropriately
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { height: 100vh; width: 250px; background-color: #343a40; position: fixed; padding-top: 20px; }
        .sidebar a { padding: 10px 15px; text-decoration: none; color: white; display: block; }
        .sidebar a:hover { background-color: #495057; }
        .content { margin-left: 260px; padding: 20px; }
        .navbar { background-color: #343a40; }
        .card { margin-top: 20px; }
    </style>
    <script>
        function searchUsers() {
            const input = document.getElementById('searchInput').value.toLowerCase();
            const tableRows = document.querySelectorAll('#userTable tbody tr');

            tableRows.forEach(row => {
                const username = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                row.style.display = username.includes(input) ? '' : 'none';
            });
        }

        function downloadUsers() {
            // Prepare data for download (this is just an example)
            const data = 'User ID,Username,Email,Role,Created At\n' + 
                Array.from(document.querySelectorAll('#userTable tbody tr')).map(row => {
                    return Array.from(row.querySelectorAll('td')).slice(0, 5).map(td => td.textContent).join(',');
                }).join('\n');

            const blob = new Blob([data], { type: 'text/csv' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'users.csv';
            a.click();
            URL.revokeObjectURL(url);
        }
    </script>
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
            <h2>Manage Users</h2>
            <div class="card">
                <div class="card-body">
                    <div class="form-group">
                        <input type="text" id="searchInput" onkeyup="searchUsers()" class="form-control" placeholder="Search by username...">
                    </div>
                    <button class="btn btn-primary mb-3" onclick="downloadUsers()">Download Users</button>
                    <table class="table table-striped" id="userTable">
                        <thead>
                            <tr>
                                <th>User ID</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            for (User user : userList) {
                            %>
                            <tr>
                                <td><%= user.getUserId() %></td>
                                <td><%= user.getUsername() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getRole() %></td>
                                <td><%= user.getCreatedAt() %></td>
                                <td>
                                    <a href="editUser.jsp?userId=<%= user.getUserId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                                    <a href="deleteUser.jsp?userId=<%= user.getUserId() %>" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> Delete</a>
                                </td>
                            </tr>
                            <%
                            }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
