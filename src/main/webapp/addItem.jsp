<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String itemName = request.getParameter("itemName");
String description = request.getParameter("description");
String price = request.getParameter("price");

// Ensure that none of the parameters are null or empty
if (itemName == null || itemName.trim().isEmpty() ||
    description == null || description.trim().isEmpty() ||
    price == null || price.trim().isEmpty()) {
    
    out.println("<script>alert('All fields are required.'); window.location='manage-products.jsp';</script>");
} else {
    String dbURL = "jdbc:mysql://localhost:3306/coffee";
    String dbUser = "root";
    String dbPassword = "";

    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
        String sql = "INSERT INTO menu_items (item_name, description, price, created_at) VALUES (?, ?, ?, NOW())";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, itemName);
        stmt.setString(2, description);

        // Parse the price to double
        try {
            stmt.setDouble(3, Double.parseDouble(price));
        } catch (NumberFormatException e) {
            out.println("<script>alert('Invalid price format.'); window.location='manage-products.jsp';</script>");
            return; // Exit the block if price parsing fails
        }

        int rowsInserted = stmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<script>alert('Item added successfully!'); window.location='manage-products.jsp';</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('Error occurred while adding item.'); window.location='manage-products.jsp';</script>");
    }
}
%>

