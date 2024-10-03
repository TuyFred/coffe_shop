<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String userId = request.getParameter("userId");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String role = request.getParameter("role");

    String dbURL = "jdbc:mysql://localhost:3306/coffee";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL JDBC driver is loaded
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String sql = "UPDATE users SET username = ?, email = ?, role = ? WHERE user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        stmt.setString(2, email);
        stmt.setString(3, role);
        stmt.setString(4, userId);
        int result = stmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('User updated successfully!'); window.location.href='manage-users.jsp';</script>");
        } else {
            out.println("<script>alert('User update failed!'); window.location.href='manage-users.jsp';</script>");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred!'); window.location.href='manage-users.jsp';</script>");
    }
%>
