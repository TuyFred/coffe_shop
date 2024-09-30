<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
String dbURL = "jdbc:mysql://localhost:3306/coffee";
String dbUser = "root";
String dbPassword = "";

int itemId = Integer.parseInt(request.getParameter("itemId"));
String itemName = "";
double price = 0.0;
String description = "";

try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
     PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM menu_items WHERE item_id = ?")) {
    pstmt.setInt(1, itemId);
    ResultSet rs = pstmt.executeQuery();
    
    if (rs.next()) {
        itemName = rs.getString("item_name");
        price = rs.getDouble("price");
        description = rs.getString("description");
    }
} catch (SQLException e) {
    e.printStackTrace(); // Handle exception
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit Item</h2>
        <form action="updateItem.jsp" method="post">
            <input type="hidden" name="itemId" value="<%= itemId %>">
            <div class="form-group">
                <label for="itemName">Item Name</label>
                <input type="text" class="form-control" id="itemName" name="itemName" value="<%= itemName %>" required>
            </div>
            <div class="form-group">
                <label for="price">Price</label>
                <input type="number" step="0.01" class="form-control" id="price" name="price" value="<%= price %>" required>
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3" required><%= description %></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Update Item</button>
            <a href="manage-items.jsp" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
