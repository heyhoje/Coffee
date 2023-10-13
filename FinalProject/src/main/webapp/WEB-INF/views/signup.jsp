<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h1>Sign Up</h1>
    <form method="post" action="signup.jsp">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Sign Up">
    </form>
    
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // You should add logic here to save user information to a database
        
        // For this example, we'll store user data in a list
        ArrayList<String> users = (ArrayList<String>) application.getAttribute("users");
        if (users == null) {
            users = new ArrayList<String>();
            application.setAttribute("users", users);
        }
        users.add(username);

    %>
    <h1>Sign Up Successful</h1>
    <p>Thank you for signing up, <%= username %>!</p>
    <p><a href="index.jsp">Login</a></p>
</body>
</html>
