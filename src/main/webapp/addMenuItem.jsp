<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Menu Item - Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 400px; /* Adjusted for a professional size */
        }
        h2 {
            color: #343a40;
            margin-bottom: 30px;
            text-align: center;
        }
        .btn-success {
            background-color: #28a745;
        }
        .input-group-text {
            background-color: #28a745;
            color: white;
            border: none;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #28a745; /* Link color */
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2><i class="fas fa-plus"></i> Add New Menu Item</h2>
		<form action="addItem.jsp" method="post">
			<div class="mb-3 input-group">
				<span class="input-group-text"><i class="fas fa-utensils"></i></span>
				<input type="text" class="form-control" id="itemName"
					name="itemName" placeholder="Item Name" required>
			</div>
			<div class="mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" id="description" name="description"
					rows="3" placeholder="Description" required></textarea>
			</div>
			<div class="mb-3 input-group">
				<span class="input-group-text"><i class="fas fa-dollar-sign"></i></span>
				<input type="number" class="form-control" id="price" name="price"
					placeholder="Price" required>
			</div>
			<button type="submit" class="btn btn-success w-100">
				<i class="fas fa-check"></i> Add Item
			</button>
		</form>
		<div class="back-link">
            <p><a href="admin-dashboard.jsp"><i class="fas fa-home"></i> Back to dashboard</a></p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
