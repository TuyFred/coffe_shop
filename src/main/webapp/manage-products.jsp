<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
class Item {
    private int itemId;
    private String itemName;
    private double price;
    private String description;
    private String createdAt;

    public Item(int itemId, String itemName, double price, String description, String createdAt) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.price = price;
        this.description = description;
        this.createdAt = createdAt;
    }

    public int getItemId() { return itemId; }
    public String getItemName() { return itemName; }
    public double getPrice() { return price; }
    public String getDescription() { return description; }
    public String getCreatedAt() { return createdAt; }
}

String dbURL = "jdbc:mysql://localhost:3306/coffee";
String dbUser = "root";
String dbPassword = "";

List<Item> itemList = new ArrayList<>();

try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
     Statement stmt = conn.createStatement();
     ResultSet rs = stmt.executeQuery("SELECT * FROM menu_items")) {
    while (rs.next()) {
        int itemId = rs.getInt("item_id");
        String itemName = rs.getString("item_name");
        double price = rs.getDouble("price");
        String description = rs.getString("description");
        String createdAt = rs.getString("created_at");
        itemList.add(new Item(itemId, itemName, price, description, createdAt));
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
    <title>Manage Items - Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body { background-color: #f8f9fa; }
        .sidebar { height: 100vh; width: 250px; background-color: #343a40; position: fixed; padding-top: 20px; }
        .sidebar a { padding: 10px 15px; text-decoration: none; color: white; display: block; }
        .sidebar a:hover { background-color: #495057; }
        .content { margin-left: 260px; padding: 20px; }
        .card { margin-top: 20px; }
        .btn { margin: 5px; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Coffee Shop Admin Dashboard</a>
    </nav>

    <div class="sidebar">
        <a href="admin-dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="manage-products.jsp"><i class="fas fa-coffee"></i> Manage Items</a>
        <a href="viewOrders.jsp"><i class="fas fa-shopping-cart"></i> Manage Orders</a>
        <a href="manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="reports.jsp"><i class="fas fa-file-alt"></i> Reports</a>
        <a href="settings.jsp"><i class="fas fa-cogs"></i> Settings</a>
        <a href="logout.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

    <div class="content">
        <div class="container">
            <h2>Manage Items</h2>
            <div class="card">
                <div class="card-body">
                    <a href="addMenuItem.jsp" class="btn btn-primary"><i class="fas fa-plus"></i> Add New Item</a>
                    <button onclick="downloadItems()" class="btn btn-success mt-3"><i class="fas fa-download"></i> Download Items</button>
                    <input type="text" id="searchInput" placeholder="Search for items..." class="form-control mb-3" onkeyup="filterItems()">
                    <table class="table table-striped" id="itemTable">
                        <thead>
                            <tr>
                                <th>Item ID</th>
                                <th>Item Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            for (Item item : itemList) {
                            %>
                            <tr>
                                <td><%= item.getItemId() %></td>
                                <td><%= item.getItemName() %></td>
                                <td><%= item.getPrice() %></td>
                                <td><%= item.getDescription() %></td>
                                <td><%= item.getCreatedAt() %></td>
                                <td>
                                    <a href="editItem.jsp?itemId=<%= item.getItemId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                                    <a href="deleteItem.jsp?itemId=<%= item.getItemId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this item?');"><i class="fas fa-trash-alt"></i> Delete</a>
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

    <script>
        function filterItems() {
            let input = document.getElementById("searchInput");
            let filter = input.value.toLowerCase();
            let table = document.getElementById("itemTable");
            let tr = table.getElementsByTagName("tr");

            for (let i = 1; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName("td");
                let found = false;
                for (let j = 1; j < td.length - 1; j++) { // Skip the actions column
                    if (td[j] && td[j].innerText.toLowerCase().includes(filter)) {
                        found = true;
                        break;
                    }
                }
                tr[i].style.display = found ? "" : "none";
            }
        }

        function downloadItems() {
            // You can implement the download functionality here (e.g., generate a CSV file)
            alert("Download functionality is not implemented yet!");
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
