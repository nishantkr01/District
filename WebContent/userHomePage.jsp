<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style1.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet">
<title>User Home Page</title>
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
				<center><h2>Welcome Mr./Mrs. <%=userid %> to User Home Page</h2></center>
				<br><br>
				<center>
				
			
		
				<p><a href="applyCertificate.jsp" class="button">Apply For Certificate</a></p>
				<p><a href="viewNotice.jsp" class="button">View Notice</a></p>
				<p><a href="reportUser.jsp" class="button">Report</a></p>
				<p><a href="userProfile.jsp" class="button">Profile</a></p>
				<p><a href="logout.jsp" class="button">Logout</a></p>
				
				</center>
			

				
			
			</div>
			
			
		</div>
	</section>
	<div class="copy-right">
					<p>© 2020 Active Login Form. All rights reserved | Design by Nishant, Jtian<a href="https://www.youtube.com/channel/UCvOr0WEVBma18RctD8Wq9Sg"
							target="_blank">Team JTian</a></p>
				</div>
	
	<%
	
}
else
{
	response.sendRedirect("UserLogin");
}
%>


</body>
</html>