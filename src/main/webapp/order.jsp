<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<html>
<head>
    <title>Create Order</title>
</head>
<body>
    <h2>Select Items to Order</h2>

    <form action="processOrder.jsp" method="post">
        <table border="1">
            <tr>
                <th>Select</th>
                <th>Item Name</th>
                <th>Description</th>
                <th>Price</th>
            </tr>
            <%
                // Database connection
                Connection conn = null;
                Statement stmt = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password");
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM menu_items";
                    ResultSet rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        int itemId = rs.getInt("item_id");
                        String itemName = rs.getString("item_name");
                        String description = rs.getString("description");
                        double price = rs.getDouble("price");
            %>
            <tr>
                <td><input type="checkbox" name="item_ids" value="<%= itemId %>"></td>
                <td><%= itemName %></td>
                <td><%= description %></td>
                <td><%= price %></td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
        <input type="submit" value="Place Order">
    </form>
</body>
</html>
