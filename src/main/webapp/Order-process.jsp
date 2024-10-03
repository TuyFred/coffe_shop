<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
<head>
    <title>Order Summary</title>
</head>
<body>
    <h2>Order Summary</h2>

    <%
        // Get selected items
        String[] selectedItemIds = request.getParameterValues("item_ids");

        if (selectedItemIds == null || selectedItemIds.length == 0) {
            out.println("No items selected.");
        } else {
            Connection conn = null;
            PreparedStatement pstmt = null;
            Statement stmt = null;
            double totalPrice = 0;

            try {
                // Database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password");

                // Calculate total price of selected items
                stmt = conn.createStatement();
                String itemQuery = "SELECT item_id, price FROM menu_items WHERE item_id IN (";
                for (int i = 0; i < selectedItemIds.length; i++) {
                    itemQuery += selectedItemIds[i];
                    if (i < selectedItemIds.length - 1) {
                        itemQuery += ",";
                    }
                }
                itemQuery += ")";
                ResultSet rs = stmt.executeQuery(itemQuery);

                while (rs.next()) {
                    totalPrice += rs.getDouble("price");
                }

                // Insert order into database (assuming a logged-in user)
                int userId = 1; // Assuming user is logged in, get user_id from session
                String orderQuery = "INSERT INTO orders (user_id, order_date, total_price, status) VALUES (?, NOW(), ?, 'pending')";
                pstmt = conn.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
                pstmt.setInt(1, userId);
                pstmt.setDouble(2, totalPrice);
                pstmt.executeUpdate();

                // Get generated order ID
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                int orderId = 0;
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }

                // Insert order items (optional, depending on your design)
                for (String itemId : selectedItemIds) {
                    String orderItemQuery = "INSERT INTO order_items (order_id, item_id) VALUES (?, ?)";
                    pstmt = conn.prepareStatement(orderItemQuery);
                    pstmt.setInt(1, orderId);
                    pstmt.setInt(2, Integer.parseInt(itemId));
                    pstmt.executeUpdate();
                }

                out.println("<p>Order placed successfully! Total Price: " + totalPrice + "</p>");
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) stmt.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        }
    %>
</body>
</html>
