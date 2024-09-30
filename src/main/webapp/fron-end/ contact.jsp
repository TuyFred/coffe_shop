<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Coffee Shop</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .container {
            flex-grow: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .form-container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }
        .contact-header {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
            color: #6f4e37;
        }
        .form-control {
            border-radius: 5px;
            margin-bottom: 15px;
        }
        .btn-custom {
            background-color: #6f4e37;
            color: white;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #563d2d;
        }
        .navbar-custom {
            background-color: #6f4e37;
        }
        .navbar-custom .navbar-brand, .navbar-custom .nav-link {
            color: white;
        }
        .contact-info {
            text-align: center;
            margin-top: 30px;
            color: #6f4e37;
        }
        .contact-info i {
            font-size: 20px;
        }
        .contact-info p {
            margin-top: 10px;
        }
        footer {
            background-color: #6f4e37;
            color: white;
            text-align: center;
            padding: 10px;
            margin-top: auto;
        }
        footer p {
            margin: 0;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><i class="fas fa-coffee"></i> Coffee Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp"><i class="fas fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp"><i class="fas fa-phone-alt"></i> Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Contact Form Section -->
    <div class="container">
        <div class="form-container">
            <h2 class="contact-header">Get in Touch</h2>
            <form action="submitContact.jsp" method="POST">
                <div class="mb-3">
                    <label for="name" class="form-label">Your Name</label>
                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Your Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                </div>
                <div class="mb-3">
                    <label for="subject" class="form-label">Subject</label>
                    <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
                </div>
                <div class="mb-3">
                    <label for="message" class="form-label">Message</label>
                    <textarea class="form-control" id="message" name="message" rows="4" placeholder="Type your message here..." required></textarea>
                </div>
                <button type="submit" class="btn btn-custom"><i class="fas fa-paper-plane"></i> Send Message</button>
            </form>
        </div>
    </div>

    <!-- Contact Information -->
    <div class="contact-info mt-4">
        <p><i class="fas fa-phone"></i> +123-456-7890</p>
        <p><i class="fas fa-envelope"></i> contact@coffeeshop.com</p>
        <p><i class="fas fa-map-marker-alt"></i> 123 Coffee Street, New York, USA</p>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Coffee Shop. All rights reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
