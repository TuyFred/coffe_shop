<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coffee Shop - Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensures footer stays at the bottom */
        }
        h1 {
            margin-top: 20px;
            font-family: 'Arial', sans-serif;
            color: #563d7c;
        }
        .navbar {
            background-color: #FF78AC; /* White smoke for navbar */
        }
        .navbar-brand, .nav-link {
            color: #000000; /* Dark text for better contrast */
        }
        .navbar-brand:hover, .nav-link:hover {
            color: #F2F0EA; /* Gold hover effect */
        }
        .card {
            margin: 15px;
            border: none;
            transition: transform 0.2s; /* Smooth hover effect */
            height: 400px; /* Set fixed height for cards */
            width: 300px; /* Set fixed width for cards */
        }
        .card img {
            height: 250px; /* Fixed height for images */
            object-fit: cover; /* Maintains aspect ratio */
        }
        .card-body {
            text-align: center; /* Center text in card */
        }
        .card:hover {
            transform: scale(1.05); /* Slightly enlarge on hover */
        }
        .row {
            justify-content: center; /* Center cards in the row */
        }
        footer {
            margin-top: auto; /* Pushes footer to the bottom */
            background-color: #007bff; /* Blue for footer */
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
            color: #ffcc00; /* Gold hover effect */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
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
                        <a class="nav-link" href="coffeeMenu.jsp"><i class="fas fa-coffee"></i> Coffee Menu</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Image Cards Section -->
    <div class="container mt-4 flex-grow-1">
        <div class="row">
            <div class="col-md-4 d-flex justify-content-center">
                <div class="card">
                    <img src="images/23.jpg" class="card-img-top" alt="Coffee Image 1">
                    <div class="card-body">
                        <h5 class="card-title">Coffee Image 1</h5>
                        <p class="card-text">Description of the coffee.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex justify-content-center">
                <div class="card">
                    <img src="images/13.jpg" class="card-img-top" alt="Coffee Image 2">
                    <div class="card-body">
                        <h5 class="card-title">Coffee Image 2</h5>
                        <p class="card-text">Description of the coffee.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 d-flex justify-content-center">
                <div class="card">
                    <img src="images/3.jpg" class="card-img-top" alt="Coffee Image 3">
                    <div class="card-body">
                        <h5 class="card-title">Coffee Image 3</h5>
                        <p class="card-text">Description of the coffee.</p>
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
