<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/loginUser.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet"><!-- font-awesome-icons -->
<title>User Login Page</title>
</head>
<body>

	<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
				<div class="form-inner-cont">
					<h3>User Login Page</h3>
					<form action="UserLogin" method="post" class="signin-form">
					<input type="hidden" name="tt" value="register">
						<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input type="text" name="user"
								placeholder="User Name" required />
						</div>
						<div class="form-input">
							<span class="fa fa-key" aria-hidden="true"></span> <input type="password" name="password" placeholder="Password"
								required />
						</div>
						<div class="login-remember d-grid">
							<label class="check-remaind">
								<input type="checkbox">
								<span class="checkmark"></span>
								<p class="remember">Remember me</p>
							</label>
							<button class="btn theme-button">Login</button>
						</div>
						<div class="new-signup">
							<a href="forgotPassword.jsp?fname=userLogin" class="signuplink">Forgot password?</a>
						</div>
						
						<div class="new-signup">
							<a href="userRegistration.jsp" class="signuplink">Create Account</a>
						</div>
						
					</form>
				
					<!-- <p class="signup">Don’t have an account? <a href="re.jsp" class="signuplink">Sign up</a></p> -->
					<p class="signup">Want to go Home Page?  <a href="index.jsp" class="signuplink">Home Page</a></p>
				</div>

				<!-- copyright -->
				<div class="copy-right">
					<p>© 2020 Active Login Form. All rights reserved | Design by Nishant, Jtian<a href="https://www.youtube.com/channel/UCvOr0WEVBma18RctD8Wq9Sg"
							target="_blank">Team JTian</a></p>
				</div>
				<!-- //copyright -->
			</div>
		</div>
	</section>

</body>
</html>