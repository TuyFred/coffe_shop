<%@ page import="java.sql.*" %>
<%
    // Get form parameters
    String userId = request.getParameter("user_id");
    String totalPrice = request.getParameter("total_price");
    String status = "pending";  // Default status when creating the order

    // Initialize JDBC
    Connection conn = null;
    PreparedStatement ps = null;
    String message = "";

    try {
        // Load MySQL JDBC Driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection (Adjust your DB URL, username, and password)
        String dbUrl = "jdbc:mysql://localhost:3306/coffee";
        String dbUser = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

        // Prepare SQL Insert Query
        String sql = "INSERT INTO orders (user_id, total_price, status) VALUES (?, ?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setInt(1, Integer.parseInt(userId));
        ps.setBigDecimal(2, new java.math.BigDecimal(totalPrice));
        ps.setString(3, status);

        // Execute the query
        int rowsInserted = ps.executeUpdate();

        if (rowsInserted > 0) {
            message = "Order placed successfully!";
        } else {
            message = "Failed to place order.";
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "Error: " + e.getMessage();
    } finally {
        // Close resources
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }

    // Display message
    out.println("<h2>" + message + "</h2>");
    out.println("<a href='customer-dashboard.jsp'>back to custome-dashboard</a>");
%>
