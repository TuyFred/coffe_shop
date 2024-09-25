<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Order</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
        }
        .order-container {
            margin: 50px auto;
            width: 50%;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .fa-user, .fa-dollar-sign {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="order-container">
        <h1><i class="fas fa-coffee"></i> Order Coffee</h1>
        <form action="processOrder.jsp" method="post">
            <div class="form-group">
                <label for="user_id"><i class="fas fa-user"></i> User ID</label>
                <input type="text" id="user_id" name="user_id" class="form-control" placeholder="Enter User ID" required>
            </div>

            <div class="form-group">
                <label for="total_price"><i class="fas fa-dollar-sign"></i> Total Price</label>
                <input type="text" id="total_price" name="total_price" class="form-control" placeholder="Enter Total Price" required>
            </div>

            <button type="submit" class="btn-submit"><i class="fas fa-shopping-cart"></i> Place Order</button>
        </form>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
