<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Prevent caching of this page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0); // Proxies
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard - Coffee Shop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            margin: 0;
            font-family: Arial, sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }
        h1, h2 {
            color: #343a40;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            flex: 1;
            margin-top: 20px;
        }
        .feature {
            padding: 20px;
            background-color: #28a745;
            color: white;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .feature:hover {
            transform: translateY(-5px);
        }
        footer {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px 0;
            margin-top: auto;
        }
        .social-icons a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
        }
    </style>
    <script>
        const translations = {
            en: {
                welcome: "Welcome, ",
                options: "Your Options",
                coffeeMenu: "Coffee Menu",
                coffeeMenuDesc: "Explore our range of coffee and beverages.",
                viewMenu: "View Menu",
                orderingSystem: "Ordering System",
                orderDesc: "Place your orders and view your order history.",
                placeOrder: "Place Order",
                viewOrderHistory: "View Order History",
                logout: "Logout",
                footer: "© 2024 Coffee-Shop. All rights reserved."
            },
            fr: {
                welcome: "Bienvenue, ",
                options: "Vos Options",
                coffeeMenu: "Menu de Café",
                coffeeMenuDesc: "Explorez notre gamme de café et de boissons.",
                viewMenu: "Voir le Menu",
                orderingSystem: "Système de Commande",
                orderDesc: "Passez vos commandes et consultez votre historique de commandes.",
                placeOrder: "Passer Commande",
                viewOrderHistory: "Voir l'Historique des Commandes",
                logout: "Déconnexion",
                footer: "© 2024 Coffee-Shop. Tous droits réservés."
            },
            rw: {
                welcome: "Karibu, ",
                options: "Amahitamo Yawe",
                coffeeMenu: "Urutonde rwa Kawa",
                coffeeMenuDesc: "Sobanukirwa ibinyobwa byacu bya kawa.",
                viewMenu: "Reba Urutonde",
                orderingSystem: "Sisitemu yo Gusaba",
                orderDesc: "Shyiramo ibisabwa n'ubusabe bw'amasaha yawe.",
                placeOrder: "Gusaba Ibisabwa",
                viewOrderHistory: "Reba Ubutumwa bw'amasaha",
                logout: "Gusohoka",
                footer: "© 2024 Coffee-Shop. Uburenganzira bwose burabitswe."
            }
        };

        function changeLanguage() {
            const selectedLanguage = document.getElementById("languageSelect").value;
            document.getElementById("welcomeMessage").innerText = translations[selectedLanguage].welcome + "<%= username %>!";
            document.getElementById("optionsHeader").innerText = translations[selectedLanguage].options;
            document.getElementById("coffeeMenuHeader").innerText = translations[selectedLanguage].coffeeMenu;
            document.getElementById("coffeeMenuDesc").innerText = translations[selectedLanguage].coffeeMenuDesc;
            document.getElementById("viewMenuButton").innerText = translations[selectedLanguage].viewMenu;
            document.getElementById("orderingSystemHeader").innerText = translations[selectedLanguage].orderingSystem;
            document.getElementById("orderDesc").innerText = translations[selectedLanguage].orderDesc;
            document.getElementById("placeOrderButton").innerText = translations[selectedLanguage].placeOrder;
            document.getElementById("viewOrderHistoryButton").innerText = translations[selectedLanguage].viewOrderHistory;
            document.getElementById("logoutButton").innerText = translations[selectedLanguage].logout;
            document.getElementById("footerText").innerText = translations[selectedLanguage].footer;

            localStorage.setItem("selectedLanguage", selectedLanguage);
        }

        window.onload = function() {
            const savedLanguage = localStorage.getItem("selectedLanguage") || "en";
            document.getElementById("languageSelect").value = savedLanguage;
            changeLanguage();
        };
    </script>
</head>
<body>
    <div class="container mt-5">
        <h1 id="welcomeMessage">Welcome, <%= username %>!</h1>
        
        <div class="d-flex justify-content-end mb-3">
            <label for="languageSelect" class="form-label me-2" style="font-size: 0.9rem;">Choose Language:</label>
            <select id="languageSelect" class="form-select form-select-sm" style="width: auto;" onchange="changeLanguage()">
                <option value="en">English</option>
                <option value="fr">Français</option>
                <option value="rw">Kinyarwanda</option>
            </select>
        </div>

        <h2 id="optionsHeader">Your Options</h2>

        <div class="grid-container">
            <div class="feature">
                <h3 id="coffeeMenuHeader">Coffee Menu</h3>
                <p id="coffeeMenuDesc">Explore our range of coffee and beverages.</p>
                <a href="menu.jsp" id="viewMenuButton" class="btn btn-light">View Menu</a>
            </div>

            <div class="feature">
                <h3 id="orderingSystemHeader">Ordering System</h3>
                <p id="orderDesc">Place your orders and view your order history.</p>
                <a href="order.jsp" id="placeOrderButton" class="btn btn-light">Place Order</a>
                <a href="order-history.jsp" id="viewOrderHistoryButton" class="btn btn-secondary">View Order History</a>
            </div>
        </div>

        <div class="text-center mt-4">
            <button onclick="window.location.href='logout.jsp'" id="logoutButton" class="btn btn-danger">Logout</button>
        </div>
    </div>

    <footer>
        <p id="footerText">&copy; 2024 Coffee-Shop. All rights reserved.</p>
        <div class="social-icons">
            <a href="https://www.facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
            <a href="https://www.instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            <a href="https://www.twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
        </div>
    </footer>
</body>
</html>
