<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/coffee";
    String dbUser = "root";
    String dbPassword = "";

    // Retrieve form parameters
    String username = request.getParameter("adminUsername");
    String email = request.getParameter("adminEmail");
    String password = request.getParameter("adminPassword");
    String role = "admin";  // Set role as admin by default for new admin users

    try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword)) {
        // SQL query to insert a new user with role 'admin'
        String sql = "INSERT INTO users (username, email, password, role) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            // Set the values for username, email, password, and role
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, password);  // Note: Hash the password before storing it (not done here)
            pstmt.setString(4, role);      // Set the role as 'admin'
            
            // Execute the update
            pstmt.executeUpdate();
            
            // Show success alert and redirect to manage-users.jsp
            out.println("<script>alert('Admin added successfully!'); window.location='manage-users.jsp';</script>");
        }
    } catch (SQLException e) {
        // Handle SQL exception and show error message
        out.println("<script>alert('Error adding admin: " + e.getMessage() + "'); window.history.back();</script>");
    }
%>

