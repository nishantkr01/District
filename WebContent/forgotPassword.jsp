<%@ page language="java" import="java.sql.*, adminLogin.db.DBConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/loginUser.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet"><!-- font-awesome-icons -->
<meta charset="ISO-8859-1">
<title>Forgot Password</title>
</head>
<body>

	<section class="w3l-form-36">
	<div class="form-36-mian section-gap">
		<div class="wrapper">
			<div class="form-inner-cont">
				<h3>Forgot Password?</h3>
				<form action="ForgotPassword" method="post" class="signin-form">
			
					<input type="hidden" name="tt" value="register">
					<div class="form-input">
						<span class="fa fa-envelope-o" aria-hidden="true"></span> <input
							type="text" name="username" placeholder="Enter Username" required />
					</div>
					<div class="form-input">
						<span class="fa fa-envelope-o" aria-hidden="true"></span> <input type="text" name="name"
							placeholder="Enter Your Name" required />
					</div>
					<div class="form-input">
						<span class="fa fa-key" aria-hidden="true"></span> <input type="text" name="address" placeholder="Address"
							required />
					</div>
						
					
					
							<div class="login-remember d-grid">
							
							<button class="btn theme-button">Retrieve Password</button>
							<a href="userLogin.jsp" class="btn theme-button">Login Now</a>
						</div>
						
						
							
						
					
						
				
					
				</form>
				</div>

			<!-- copyright -->
			<div class="copy-right">
				<p>© 2020 Active Deposit Form. All rights reserved | Design by Nishant, JTian <a href="http://javatechnocrat.com/"
						target="_blank">JT's Students</a></p>
			</div>
			<!-- //copyright -->
		</div>
	</div>
</section>
	

</body>
</html>