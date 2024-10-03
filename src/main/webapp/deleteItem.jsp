<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String dbURL = "jdbc:mysql://localhost:3306/coffee";
String dbUser = "root";
String dbPassword = "";

int itemId = Integer.parseInt(request.getParameter("itemId"));

try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
     PreparedStatement pstmt = conn.prepareStatement("DELETE FROM menu_items WHERE item_id = ?")) {
    pstmt.setInt(1, itemId);
    pstmt.executeUpdate();
    response.sendRedirect("admin-dashboard.jsp?message=Item+deleted+successfully");
} catch (SQLException e) {
    e.printStackTrace(); // Handle exception
    response.sendRedirect("admin-dashboard.jsp?error=Error+deleting+item");
}
%>


