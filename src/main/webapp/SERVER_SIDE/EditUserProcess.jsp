<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User Process - Coffee Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Edit User Process</h2>
        <%
            // Retrieve form data
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            // Assuming you have a database connection pool set up in your environment.
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Get database connection
                Context initContext = new InitialContext();
                DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/coffe"); // replace 'yourdb' with your actual database resource name
                conn = ds.getConnection();

                // SQL query to update user information
                String sql = "UPDATE users SET username=?, email=? WHERE user_id=?";
                pstmt = conn.prepareStatement(sql);

                // Assuming 'user_id' is stored in session after login
                int userId = (Integer) session.getAttribute("user_id");

                pstmt.setString(1, username);
                pstmt.setString(2, email);
                pstmt.setInt(3, userId);

                int rowsUpdated = pstmt.executeUpdate();

                if (rowsUpdated > 0) {
                    // Successful update
                    out.println("<div class='alert alert-success' role='alert'>User details updated successfully!</div>");
                    response.sendRedirect("profile.jsp"); // Redirect to profile page after success
                } else {
                    // Error handling if no rows were updated
                    out.println("<div class='alert alert-danger' role='alert'>Failed to update user details. Please try again.</div>");
                }
            } catch (Exception e) {
                // Error handling
                out.println("<div class='alert alert-danger' role='alert'>An error occurred: " + e.getMessage() + "</div>");
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
