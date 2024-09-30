<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log the user out
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logging Out</title>
    <meta http-equiv="refresh" content="2;url=login.jsp"> <!-- Redirect to login.jsp after 2 seconds -->
    <script>
        // Prevent back button navigation after logout
        history.pushState(null, null, location.href);
        window.onpopstate = function() {
            history.go(1);
        };
    </script>
</head>
<body>
    <h2>Logging you out...</h2>
    <p>You will be redirected to the login page shortly.</p>
</body>
</html>
