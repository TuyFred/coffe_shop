<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to Coffee Shop</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            animation: slideBackground 15s infinite linear;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        @keyframes slideBackground {
            0% { background-image: url('images/5.jpg'); }
            33% { background-image: url('images/6.jpg'); }
            66% { background-image: url('images/7.jpg'); }
            100% { background-image: url('images/5.jpg'); }
        }

        .welcome {
            text-align: center;
            padding: 100px 20px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #563d7c;
            font-family: 'Arial', sans-serif;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            background-color: #6f4e37; /* Coffee Brown */
        }

        .navbar-brand {
            font-size: 1.5rem;
            color: white;
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: white;
            margin-right: 15px;
        }

        .navbar-nav .nav-link:hover {
            color: #f4e1d2; /* Light Coffee Color */
        }

        .fa-coffee {
            margin-right: 5px;
        }

        footer {
            margin-top: auto;
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px 0;
            font-size: 0.9rem;
        }

        footer a {
            color: white;
            margin: 0 10px;
            font-size: 1.2rem;
        }

        footer a:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><i class="fa fa-coffee"></i> Coffee Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"><i class="fa fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="coffeeMenu.jsp"><i class="fa fa-list"></i> Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp"><i class="fa fa-info-circle"></i> About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"><i class="fa fa-envelope"></i> Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Welcome Section -->
    <div class="container welcome mt-5">
        <h1>Welcome to the Coffee Shop</h1>
        <p>Explore the finest coffee in town, crafted with love and passion. Indulge in the aroma and taste of our premium coffee collection.</p>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <p class="mt-2">© 2024 Coffee Shop. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
