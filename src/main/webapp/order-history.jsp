<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*, java.math.BigDecimal" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
        }
        .order-history-container {
            margin: 50px auto;
            width: 80%;
        }
        table {
            background-color: #fff;
            width: 100%;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="order-history-container">
        <h1>Order History</h1>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>User ID</th>
                    <th>Order Date</th>
                    <th>Total Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Database connection
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        String dbUrl = "jdbc:mysql://localhost:3306/coffee";
                        String dbUser = "root";
                        String dbPassword = "";
                        conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                        stmt = conn.createStatement();

                        // Query to get all orders
                        String sql = "SELECT * FROM orders";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int orderId = rs.getInt("order_id");
                            int userId = rs.getInt("user_id");
                            Timestamp orderDate = rs.getTimestamp("order_date");
                            BigDecimal totalPrice = rs.getBigDecimal("total_price");
                            String status = rs.getString("status");

                            // Display orders in table rows
                            out.println("<tr>");
                            out.println("<td>" + orderId + "</td>");
                            out.println("<td>" + userId + "</td>");
                            out.println("<td>" + orderDate + "</td>");
                            out.println("<td>$" + totalPrice + "</td>");
                            out.println("<td>" + status + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
