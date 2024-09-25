<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coffee Shop - Coffee Menu</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        h1 {
            margin-top: 20px;
            font-family: 'Arial', sans-serif;
            color: #563d7c;
        }
        .card {
            width: 100%; /* Full width */
            max-width: 150px; /* Set a maximum width */
            margin: auto; /* Center the card */
            border: none; /* Remove default border */
            border-radius: 8px; /* Rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow */
            transition: transform 0.2s; /* Smooth hover effect */
        }
        .card:hover {
            transform: scale(1.05); /* Scale on hover */
        }
        .card-img-top {
            height: 150px; /* Set fixed height for images */
            object-fit: cover; /* Cover the area while maintaining aspect ratio */
            border-radius: 8px 8px 0 0; /* Rounded corners for the top */
        }
        .card-title {
            font-weight: bold;
            color: #343a40;
        }
        .card-text {
            color: #6c757d;
        }
        .btn-primary {
            background-color: #563d7c;
            border-color: #563d7c;
            width: 100%; /* Full-width button */
        }
        footer {
            margin-top: 30px; /* Reduced margin */
            background-color: #007bff; /* Changed to blue */
            padding: 10px 0; /* Reduced padding */
            color: white;
            text-align: center;
            font-size: 0.9rem; /* Smaller font size */
        }
        footer a {
            color: white;
            margin: 0 10px; /* Reduced margin */
            font-size: 1.2rem; /* Adjusted icon size */
        }
        footer a:hover {
            color: #563d7c;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Coffee Shop</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i> Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Coffee Menu Section -->
    <div class="container mt-5" id="coffeeMenu">
        <h1 class="text-center">Our Coffee Menu</h1>

        <!-- Coffee Cards -->
        <div class="row mt-4">
            <div class="col-md-2">
                <div class="card">
                    <img src="images/espraso.png" class="card-img-top" alt="Espresso">
                    <div class="card-body">
                        <h5 class="card-title">Espresso</h5>
                        <p class="card-text">$2.50</p>
                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="card">
                    <img src="images/latte.jpeg" class="card-img-top" alt="Latte">
                    <div class="card-body">
                        <h5 class="card-title">Latte</h5>
                        <p class="card-text">$3.00</p>
                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="card">
                    <img src="images/cup.png" class="card-img-top" alt="Cappuccino">
                    <div class="card-body">
                        <h5 class="card-title">Cappuccino</h5>
                        <p class="card-text">$3.50</p>
                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="card">
                    <img src="images/mocha.png" class="card-img-top" alt="Mocha">
                    <div class="card-body">
                        <h5 class="card-title">Mocha</h5>
                        <p class="card-text">$4.00</p>
                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="card">
                    <img src="images/americano.jpeg" class="card-img-top" alt="Americano">
                    <div class="card-body">
                        <h5 class="card-title">Americano</h5>
                        <p class="card-text">$2.00</p>
                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Order Now</a>
                    </div>
                </div>
            </div>
            <div class="col-md-2">
                <div class="card">
                    <img src="images/rwanda.jpeg" class="card-img-top" alt="Rwandan Coffee">
                    <div class="card-body">
                        <h5 class="card-title">Rwanda Coffee</h5>
                        <p class="card-text">$3.50</p>
                        <a href="login.jsp" class="btn btn-primary"><i class="fas fa-shopping-cart"></i> Order Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer with social icons -->
    <footer>
        <div class="container">
            <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
            <p class="mt-2">© 2024 Coffee Shop. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
