
<!DOCTYPE html>
<html lang="zxx">

<head>
	<title>Admin Login</title>
	<!-- Meta tags -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<!-- //Meta tags -->
	<link rel="stylesheet" href="css/loginAdmin.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet"><!-- font-awesome-icons -->
</head>

<body>

	<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
				<div class="form-inner-cont">
					<h3>Admin Login Page</h3>
					<form action="AdminLoginPage" method="post" class="signin-form">
					<input type="hidden" name="tt" value="adminFname">
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
							<a href="forgotPasswordAdmin.jsp" class="signuplink">Forgot password?</a>
						</div>
						<div class="new-signup">
							<a href="adminRegistration.jsp" class="signuplink">Create Your Account</a>
						</div>
					</form>
				
					<!-- <p class="signup">Don’t have an account? <a href="re.jsp" class="signuplink">Sign up</a></p> -->
					<p class="signup">Want to go Home Page?  <a href="index.jsp" class="signuplink">Home Page</a></p>
				</div>

				<!-- copyright -->
				<div class="copy-right">
					<p>© 2020 Active Login Form. All rights reserved | Design by Nishant, JTian <a href="http://javatechnocrat.com"
							target="_blank">Team JTian</a></p>
				</div>
				<!-- //copyright -->
			</div>
		</div>
	</section>
</body>

</html>