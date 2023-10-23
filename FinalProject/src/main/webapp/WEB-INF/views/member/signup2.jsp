<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup Template</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   
    <style>
        .signup-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
        }
    </style>
</head>
<body>
 <div id="signupContainer">
        <h2>Business Signup Form</h2>
        <form id="signupForm" onsubmit="return validateForm();" method="post">
            <div>
                <label for="userType">Select user type:</label><br>
                <input type="radio" name="userType" value="member" id="memberRadio" required> Member
                <input type="radio" name="userType" value="business" id="businessRadio" required> Business
            </div>
            <div>
                <label for="fullName">Full Name:</label>
                <input type="text" name="fullName" id="fullName" required>
            </div>
            <div>
                <label for="email">Email:</label>
                <input type="email" name="email" id="email" required>
            </div>
            <div>
                <label for="id">Id:</label>
                <input type="id" name="id" id="id" required>
            </div>
            <div>
                <label for="password">Password:</label>
                <input type="password" name="password" id="password" required>
            </div>
            <div>
                <label for="password2">Password check:</label>
                <input type="password2" name="password2" id="password2" required>
            </div>
            <div id="businessNumberDiv">
                <label for="businessNumber">Business Number:</label>
                <input type="text" name="businessNumber" id="businessNumber">
            </div>
            <div>
                <button type="submit">Sign Up</button>
            </div>
        </form>
    </div>

    <script>
        function validateForm() {
            var userType = document.querySelector('input[name="userType"]:checked').value;
            var fullName = document.getElementById('fullName').value;
            var email = document.getElementById('email').value;
            var password = document.getElementById('password').value;
            var businessNumber = document.getElementById('businessNumber').value;

            // You can implement more advanced validation here

            if (userType === 'business' && businessNumber.trim() === '') {
                alert('Please enter a Business Number.');
                return false;
            }

            // For now, just display the user's input
            alert('User Type: ' + userType + '\nFull Name: ' + fullName + '\nEmail: ' + email + '\nPassword: ' + password + '\nBusiness Number: ' + businessNumber);

            return false; // Prevent form submission for this example
        }

        // Show/hide the Business Number field when the user selects the "Business" option
        document.getElementById('businessRadio').addEventListener('change', function() {
            var businessNumberDiv = document.getElementById('businessNumberDiv');
            if (this.checked) {
                businessNumberDiv.style.display = 'block';
            } else {
                businessNumberDiv.style.display = 'none';
            }
        });

        // Initially hide the Business Number field
        document.getElementById('businessNumberDiv').style.display = 'none';
    </script>
</body>
</html>