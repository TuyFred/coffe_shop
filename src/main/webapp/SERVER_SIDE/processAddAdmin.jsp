<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String dbURL = "jdbc:mysql://localhost:3306/coffee";
String dbUser = "root";
String dbPassword = "";

String username = request.getParameter("adminUsername");
String email = request.getParameter("adminEmail");
String password = request.getParameter("adminPassword");

try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
    String sql = "INSERT INTO admins (username, email, password) VALUES (?, ?, ?)";
    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, password); // You should hash the password before storing it
        pstmt.executeUpdate();
        out.println("<script>alert('Admin added successfully!'); window.location='manage-users.jsp';</script>");
    }
} catch (SQLException e) {
    out.println("<script>alert('Error adding admin: " + e.getMessage() + "'); window.history.back();</script>");
}
%>
