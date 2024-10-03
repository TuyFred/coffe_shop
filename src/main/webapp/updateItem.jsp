<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String dbURL = "jdbc:mysql://localhost:3306/coffee";
String dbUser = "root";
String dbPassword = "";

int itemId = Integer.parseInt(request.getParameter("itemId"));
String itemName = request.getParameter("itemName");
double price = Double.parseDouble(request.getParameter("price"));
String description = request.getParameter("description");

try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
     PreparedStatement pstmt = conn.prepareStatement("UPDATE menu_items SET item_name = ?, price = ?, description = ? WHERE item_id = ?")) {
    pstmt.setString(1, itemName);
    pstmt.setDouble(2, price);
    pstmt.setString(3, description);
    pstmt.setInt(4, itemId);
    pstmt.executeUpdate();
    response.sendRedirect("manage-products.jsp?message=Item+updated+successfully");
} catch (SQLException e) {
    e.printStackTrace(); // Handle exception
    response.sendRedirect("manage-products.jsp?error=Error+updating+item");
}
%>
