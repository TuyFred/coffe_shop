<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String role = "customer"; // Default role

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Database connection setup
        Class.forName("com.mysql.cj.jdbc.Driver"); // Adjust if necessary
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee", "root", "");

        // SQL insert statement
        String sql = "INSERT INTO users (username, password, email, role, created_at) VALUES (?, ?, ?, ?, CURRENT_TIMESTAMP)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password); // Consider hashing the password
        pstmt.setString(3, email);
        pstmt.setString(4, role);

        int rowsInserted = pstmt.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<h3>Registration successful!</h3>");
            out.println("<p><a href='login.jsp'>Click here to login</a></p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error during registration: " + e.getMessage() + "</h3>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<h3>Error: Driver not found.</h3>");
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
