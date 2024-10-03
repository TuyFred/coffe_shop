<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Coffee Shop</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            background: #f4f4f4;
            font-family: Arial, sans-serif;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar {
            background-color: #6f4e37;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white;
        }
        .navbar-nav .nav-link:hover {
            color: #f4e1d2;
        }
        .about-section {
            padding: 40px;
            background-color: #fff;
            margin: 20px auto;
            max-width: 800px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2, h3 {
            color: #563d7c;
        }
        p {
            font-size: 1rem;
            color: #333;
        }
        footer {
            margin-top: auto;
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px;
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
            <a class="navbar-brand" href="coffeMenu.jsp"><i class="fa fa-coffee"></i> CoffeeMenu</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp"><i class="fa fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="coffeMenu.jsp"><i class="fa fa-list"></i> Menu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="about.jsp"><i class="fa fa-info-circle"></i> About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"><i class="fa fa-envelope"></i> Contact</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- About Section -->
    <div class="container about-section">
        <h2>About Coffee Shop</h2>
        <p>We are passionate about creating the best coffee experience. Since 2010, our mission is to serve high-quality, ethically sourced coffee, fostering a welcoming environment for coffee lovers.</p>
        <h3>Our Mission</h3>
        <p>We strive to promote sustainability from sourcing to brewing, ensuring a positive impact on both people and the environment.</p>
        <h3>Our Vision</h3>
        <p>We aim to be recognized for exceptional service, innovative blends, and a strong commitment to sustainability.</p>
        <h3>Meet Our Team</h3>
        <p>Our team of baristas, roasters, and coffee experts is dedicated to making every cup of coffee perfect.</p>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <a href="https://youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
            <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook-f"></i></a>
            <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <p>© 2024 Coffee Shop. All Rights Reserved.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
