<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Apply Certificate</title>
<link rel="stylesheet" href="css/applyCertificate.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet">
</head>
<body>
<%
response.setHeader("Cache-Control", "no-catch, no-store, must-revalidate");
response.setHeader("Pragma","no-catch"); //http 1.0
response.setHeader("Expires","0"); //Proxies

HttpSession sessionUser = request.getSession();

if(sessionUser!=null)
{
	String userid = (String) session.getAttribute("username");
	

	%>
	
	
	<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
			<div class="bg-agile h2">
				<center><h2><%=userid %> please select The Certificate That You Want To Apply</h2></center>
				<br><br>
				<center>
				
			
		
				<p><a href="birthCertificate.jsp" class="button">Birth Certificate</a></p>
				<p><a href="deathCertificate.jsp" class="button">Death Certificate</a></p>
				<p><a href="incomeCertificate.jsp" class="button">Income Certificate</a></p>
				<p><a href="Logout" class="button">Logout</a></p>
				
				</center>
			

				
			
			</div>
			
			
		</div>
	</section>
	<%
}else{
	response.sendRedirect("userLogin.jsp");
}
	%>
</body>
</html>