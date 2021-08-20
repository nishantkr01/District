<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/userRegistration.css" type="text/css" media="all" />
	<link href="css/font-login.css" rel="stylesheet">
<title>User Registration</title>
</head>
<body>




	<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
				<div class="form-inner-cont">
					<h3>User Registration Page!!</h3>
					<form action="UserRegistration" method="post" class="signin-form">
				

						<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input
								type="text" name="username" placeholder="Enter Username" required />
						</div>
						<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input type="text" name="name"
								placeholder="Enter Your Name" required />
						</div>
						<div class="form-input">
							<span class="fa fa-key" aria-hidden="true"></span> <input type="password" name="password" placeholder="Password"
								required />
						</div>
							<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input type="text" name="address"
								placeholder="Enter Your Address" required />
						</div>
						
						
								<label for="gender">Select Gender : </label> <select name="gender" id="gender">
							<option value="Male">Male</option>
							<option value="Female">Female</option>
							<option value="others">Others</option>

						</select>



						<div class="login-remember d-grid">
							<label class="check-remaind">
								<input type="radio" value="confirm">
								<span class="checkmark"></span>
								<p class="remember">Comfirm!!</p>
							</label>
							<button class="btn theme-button">Sign Up</button>
						</div>
						
					</form>
				
					<p class="signup"> <a href="userLogin.jsp" class="signuplink">Already Have An Account Login!!</a></p>
				</div>

				<!-- copyright -->
				<div class="copy-right">
					<p>© 2020 Active Deposit Form. All rights reserved | Design by <a href="http://javatechnocrat.com/"
							target="_blank">JT's Students</a></p>
				</div>
				<!-- //copyright -->
			</div>
		</div>
	</section>



</body>
</html>