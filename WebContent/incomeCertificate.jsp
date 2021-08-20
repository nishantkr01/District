<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/incomeCertificate.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Apply Income Certificate !!</title>
</head>
<body>
<% 
response.setHeader("Cache-Control", "no-catch, no-store, must-revalidate");
response.setHeader("Pragma","no-catch"); //http 1.0
response.setHeader("Expires","0"); //Proxies

HttpSession sessionUser = request.getSession();

if(sessionUser!=null)
{
	String userid = (String) sessionUser.getAttribute("username");

%>
<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
				<div class="form-inner-cont">
					<h3><%=userid %> Apply For Income Certificate !!</h3>
					<form action="IncomeCertificate" method="post" class="signin-form">
				

						<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input
								type="text" name="name" placeholder="Name" required />
						</div>
												<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input
								type="text" name="fatherName" placeholder="Father's Name/Mother's Name" required />
						</div>
												<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input
								type="text" name="dob" placeholder="Date Of Birth" required />
						</div>
							
								<label for="gender">Select Gender : </label> <select name="gender" id="gender">
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="others">Others</option>
							</select>
							
						
							<div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input type="text" name="occupation"
								placeholder="Occupation" required />
						    </div>
						    <div class="form-input">
							<span class="fa fa-envelope-o" aria-hidden="true"></span> <input type="text" name="income"
								placeholder="Annual Income" required />
						    </div>



						<div class="login-remember d-grid">
							<label class="check-remaind">
								<input type="radio" value="confirm">
								<span class="checkmark"></span>
								<p class="remember">Comfirm!!</p>
							</label>
							<button class="btn theme-button">Submit</button>
						</div>
						
					</form>
				
					<p class="signup"> <a href="logout.jsp" class="signuplink">Logout</a></p>
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
	<%
}
else
{
	response.sendRedirect("UserLogin");
}
	%>
</body>
</html>