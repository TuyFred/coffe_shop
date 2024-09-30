<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User - Coffee Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-image: url('images/background.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            color: #ffffff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background-color: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
            width: 400px;
        }
        h2 {
            color: #ffffff;
            margin-bottom: 30px;
            text-align: center;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.6);
        }
        .btn-primary {
            background-color: #FF78AC;
            border-color: #FF78AC;
        }
        .btn-primary:hover {
            background-color: #563d7c;
            border-color: #563d7c;
        }
        .input-group-text {
            background-color: #563d7c;
            border: none;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container form-container">
        <h2>Edit User Details</h2>
        <form action="EditUserProcess.jsp" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username" required value="<%= session.getAttribute("username") %>">
            </div>
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required value="<%= session.getAttribute("email") %>">
            </div>
            <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Save Changes</button>
        </form>
        <div class="text-center mt-3">
            <a href="admin-dashboard.jsp" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Profile</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
