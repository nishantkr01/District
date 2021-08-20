<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

	
	<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet">
	
	
<meta charset="ISO-8859-1">
<title>Admin Home</title>
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
				<h2> Welcome To Admin Home Page !!</h2>
				<br><br>
				<center>
				
			
		
			
				<p><a href="certificateRequestAdmin.jsp" class="button">Certificate Request</a></p>
				<p><a href="adminReport.jsp" class="button">Report View</a></p>
				<p><a href="userViewAdmin.jsp" class="button">View User</a></p>
				<p><a href="viewAdmin.jsp" class="button">View Admin</a></p>
				
				</center>
			

				
			
			</div>
			<center><a href="logout">Logout</a></center>
			
		</div>
	</section>
<%
}
else{
	response.sendRedirect("adminLogin.jsp");
}
%>


</body>
</html>