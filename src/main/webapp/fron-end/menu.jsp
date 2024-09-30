<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coffee Shop Menu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .menu-section {
            margin-top: 50px;
        }
        .menu-section h2 {
            text-align: center;
            margin-bottom: 40px;
            color: #6c757d;
        }
        .menu-item {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .menu-item:hover {
            transform: translateY(-5px);
        }
        .menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }
        .menu-item h3 {
            margin-top: 15px;
        }
        .menu-item p {
            margin: 5px 0;
            color: #6c757d;
        }
        .menu-item span.price {
            font-size: 1.25rem;
            font-weight: bold;
        }
        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <!-- Coffee Menu Section -->
    <div class="container menu-section">
        <h2>Our Coffee Menu</h2>
        <div class="row">
            <!-- Coffee Item 1 -->
            <div class="col-md-4">
                <div class="menu-item">
                    <img src="https://via.placeholder.com/300x200" alt="Espresso">
                    <h3>Espresso</h3>
                    <p>A shot of rich, dark coffee with an intense flavor.</p>
                    <span class="price">$3.00</span>
                </div>
            </div>

            <!-- Coffee Item 2 -->
            <div class="col-md-4">
                <div class="menu-item">
                    <img src="https://via.placeholder.com/300x200" alt="Cappuccino">
                    <h3>Cappuccino</h3>
                    <p>A perfect blend of espresso, steamed milk, and foam.</p>
                    <span class="price">$4.50</span>
                </div>
            </div>

            <!-- Coffee Item 3 -->
            <div class="col-md-4">
                <div class="menu-item">
                    <img src="https://via.placeholder.com/300x200" alt="Latte">
                    <h3>Latte</h3>
                    <p>A creamy mix of espresso and steamed milk, topped with foam.</p>
                    <span class="price">$4.00</span>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <!-- Coffee Item 4 -->
            <div class="col-md-4">
                <div class="menu-item">
                    <img src="https://via.placeholder.com/300x200" alt="Mocha">
                    <h3>Mocha</h3>
                    <p>Espresso combined with chocolate syrup and steamed milk.</p>
                    <span class="price">$4.75</span>
                </div>
            </div>

            <!-- Coffee Item 5 -->
            <div class="col-md-4">
                <div class="menu-item">
                    <img src="https://via.placeholder.com/300x200" alt="Americano">
                    <h3>Americano</h3>
                    <p>Espresso with hot water for a smooth, rich taste.</p>
                    <span class="price">$3.25</span>
                </div>
            </div>

            <!-- Coffee Item 6 -->
            <div class="col-md-4">
                <div class="menu-item">
                    <img src="https://via.placeholder.com/300x200" alt="Iced Coffee">
                    <h3>Iced Coffee</h3>
                    <p>Chilled coffee served over ice for a refreshing drink.</p>
                    <span class="price">$3.50</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <p>&copy; 2024 Coffee-Shop. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
            <a href="https://www.linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
            <a href="https://www.youtube.com" target="_blank"><i class="fab fa-youtube"></i></a>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
