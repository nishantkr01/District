<%@ page language="java" import="java.sql.*,adminLogin.db.DBConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Notice</title>
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

<center><font color="Blue" size="8">Hey! User This Is User's Notice Page</font></center>
<% 
Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("select *  from approve where username=?");
ps.setString(1, userid);

ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>


<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
				<div class="form-inner-cont">
					<h3>Notice Page</h3>
					<form action="" method="post" class="signin-form">
					
						<label for="story">Certificate Report:</label>

						<textarea id="story"  name="approve" rows="15" cols="100">
						<%=rs.getString(2) %> 
						<%=rs.getString(3) %>
						
						Please You Copy and Make Print Hard Copy for client
						</textarea>
						
						
						
					
					</form>
				
					<!-- <p class="signup">Don’t have an account? <a href="re.jsp" class="signuplink">Sign up</a></p> -->
					<p class="signup">Want to go Home Page?  <a href="userHomePage.jsp" class="signuplink">Home Page</a></p>
				</div>

				<!-- copyright -->
				<div class="copy-right">
					<p>© 2020 Active Login Form. All rights reserved | Design by Nishant, JTian<a href="http://javatechnocrat.com"
							target="_blank">Team JTian</a></p>
				</div>
				<!-- //copyright -->
			</div>
		</div>
	</section>
<%
}
}
%>
</body>
</html>