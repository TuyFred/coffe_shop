<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String role = request.getParameter("role"); 

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Database connection setup
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/coffee", "root", "");

        // SQL query to check login credentials
        String sql = "SELECT role FROM users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, password); // Consider hashing the password for security

        rs = pstmt.executeQuery();

        if (rs.next()) {
            String userRole = rs.getString("role");

            // Store username in session
            session.setAttribute("username", username);

            // Redirect based on user role
            if ("admin".equals(userRole)) {
                response.sendRedirect("admin-dashboard.jsp"); // Redirect to admin dashboard
            } else {
                response.sendRedirect("customer-dashboard.jsp"); // Redirect to customer dashboard
            }
        } else {
            out.println("<h3>Invalid username or password!</h3>");
            out.println("<p><a href='login.jsp'>Try again</a></p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error during login: " + e.getMessage() + "</h3>");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<h3>Error: Driver not found.</h3>");
    } finally {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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
