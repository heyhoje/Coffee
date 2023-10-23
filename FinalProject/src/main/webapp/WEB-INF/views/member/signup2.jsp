<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.8.1/css/all.css"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 페이지</title>

<style>
body{
position: fixed;

}
/* Login v4 */
.signup_v4 .social-area {
	text-align: center;
	padding-top: 14px;
}

.signup_v4 .social-area .title {
	font-size: 20px;
	text-transform: uppercase;
	font-weight: 600;
	display: inline-block;
	color: #007bff;
	position: relative;
}

.signup_v4 .social-area .text {
	font-size: 17px;
	font-weight: 400;
	color: #143250;
}

.signup_v4 .social-area .title::before {
	position: absolute;
	content: '';
	width: 40px;
	height: 1px;
	background: rgba(0, 0, 0, .2);
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	left: 100%;
	margin-left: 7px;
}

.signup_v4 .social-area .title::after {
	position: absolute;
	content: '';
	width: 40px;
	height: 1px;
	background: rgba(0, 0, 0, .2);
	top: 50%;
	-webkit-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	transform: translateY(-50%);
	right: 100%;
	margin-right: 7px;
}

.signup_v4 ul.social-links {
	padding: 0;
	margin: 0;
}

.signup_v4 .social-area .social-links li {
	display: inline-block;
}

.signup_v4 .social-area .social-links li a i {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	line-height: 50px;
	display: inline-block;
	color: #fff;
	margin: 0 5px;
	-webkit-box-shadow: 0 5px 10px rgb(0 0 0/ 15%);
	box-shadow: 0 5px 10px rgb(0 0 0/ 15%);
}

.signup_v4 .social-area .social-links li a i.fa-facebook-f {
	background: #0069f7;
}

.signup_v4 .social-area .social-links li a i.fa-google-plus-g {
	background: #d1062c;
}

.signup_v4 .nav-tabs .nav-link.active {
	background: #007bff;
}

.signup_v4 .nav-tabs .nav-link {
	background: #143250;
}

.signup_v4 .nav-tabs .nav-link {
	border: 0;
	margin: 0;
	padding: 10px 0;
	text-align: center;
	border-radius: 0;
	color: #fff;
}

.signup_v4 .nav-tabs li.nav-item {
	width: 50%;
}

.signup_v4 .card-body {
	padding: 0px;
}

.signup_v4 .card-body .tab-content {
	padding: 0 1.25rem 1.75em;
}
</style>
</head>
<body>
	<div class="card signup_v4 mb-30">
		<div class="card-body">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item" role="presentation"><a
					class="nav-link active" id="login-tab" data-toggle="tab"
					href="#login" role="tab" aria-controls="login" aria-selected="true">Login</a>
				</li>
				<li class="nav-item" role="presentation"><a class="nav-link"
					id="register-tab" data-toggle="tab" href="#register" role="tab"
					aria-controls="register" aria-selected="false">Register</a></li>
			</ul>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="login" role="tabpanel"
					aria-labelledby="login-tab">
					<h4 class="text-center mt-4 mb-4"
						style="text-transform: uppercase;">Login</h4>
					<form>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">Your Username</label> <input type="text"
									class="form-control" id="inputEmail4"
									placeholder="Enter your username" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">Your Password</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="Enter your password" required="">
							</div>
							<div class="form-group col-md-12">
								<div
									class="d-flex flex-wrap justify-content-between align-items-center">
									<div class="custom-checkbox d-block">
										<label class="custom-control custom-checkbox checkbox-lg">
											<input type="checkbox" class="custom-control-input"
											id="customCheck1">
											<div class="custom-control-label" for="customCheck1">Remember
												Password</div>
										</label>
									</div>
									<a href="#" target="_blank">Forgot Password?</a>
								</div>
							</div>
						</div>
						<div class="mt-2 mb-3">
							<button class="btn btn-primary full-width" type="submit">Login</button>
						</div>
					</form>
					<div class="social-area">
						<h3 class="title">Or</h3>
						<p class="text">Sign In with social media</p>
						<ul class="social-links">
							<li><a href="#"> <i class="fab fa-facebook-f"></i>
							</a></li>
							<li><a href="#"> <i class="fab fa-google-plus-g"></i>
							</a></li>
						</ul>
					</div>
				</div>
				<div class="tab-pane fade" id="register" role="tabpanel"
					aria-labelledby="register-tab">
					<h4 class="text-center mt-4 mb-4"
						style="text-transform: uppercase;">Register</h4>
					<form>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">Your Name</label> <input type="text"
									class="form-control" id="inputEmail4"
									placeholder="Enter your name" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">Your Username</label> <input type="text"
									class="form-control" id="inputPassword4"
									placeholder="Enter your username" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">Your Email Address</label> <input
									type="email" class="form-control" id="inputEmail4"
									placeholder="Enter your email address" required="">
							</div>
							<div class="form-group col-md-12">
								<label for="inputName">Your Password</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="Enter your password" required="">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-12">
								<label for="inputName">Your Confirm Password</label> <input
									type="password" class="form-control" id="inputPassword4"
									placeholder="Enter your confirm password" required="">
							</div>

						</div>
						<div class="form-group form-row mt-2">
							<label class="col-md-2 col-form-label user_group">I am a</label>
							<div class="col-md-10 pt-1">
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio1" value="option1">
									<label class="form-check-label" for="inlineRadio1">Customer</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
									<label class="form-check-label" for="inlineRadio2">Vendor</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input" type="radio"
										name="inlineRadioOptions" id="inlineRadio2" value="option2">
									<label class="form-check-label" for="inlineRadio2">Both</label>
								</div>
							</div>
						</div>
						<div class="form-group form-row">
							<div class="col-md-12">
								<label class="custom-control custom-checkbox checkbox-lg">
									<input type="checkbox" class="custom-control-input"
									id="customCheck1">
									<div class="custom-control-label" for="customCheck1">
										I agree with <a href="#" target="_blank">terms and
											conditions</a>
									</div>
								</label>
							</div>
						</div>
						<hr class="mt-3 mb-4">
						<div class="col-12">
							<div
								class="d-flex flex-wrap justify-content-between align-items-center">
								<div class="custom-checkbox d-block">
									<a href="<c:url value='/'/>"
										class="nav-link-inline font-size-sm">Already have an
										account? Login</a>
								</div>
								<button class="btn btn-primary mt-3 mt-sm-0" type="submit">Register</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function validateForm() {
			var userType = document
					.querySelector('input[name="userType"]:checked').value;
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
			alert('User Type: ' + userType + '\nFull Name: ' + fullName
					+ '\nEmail: ' + email + '\nPassword: ' + password
					+ '\nBusiness Number: ' + businessNumber);

			return false; // Prevent form submission for this example
		}

		// Show/hide the Business Number field when the user selects the "Business" option
		document.getElementById('businessRadio').addEventListener(
				'change',
				function() {
					var businessNumberDiv = document
							.getElementById('businessNumberDiv');
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