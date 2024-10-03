<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String userId = request.getParameter("userId");
    String dbURL = "jdbc:mysql://localhost:3306/coffee";
    String dbUser = "root";
    String dbPassword = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL JDBC driver is loaded
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
        String sql = "DELETE FROM users WHERE user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, userId);
        int result = stmt.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('User deleted successfully!'); window.location.href='manage-users.jsp';</script>");
        } else {
            out.println("<script>alert('User deletion failed!'); window.location.href='manage-users.jsp';</script>");
        }
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred!'); window.location.href='manage-users.jsp';</script>");
    }
%>

