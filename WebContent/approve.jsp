<%@ page language="java" import="java.sql.*,adminLogin.db.DBConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/reportUser.css" type="text/css" media="all" /><!-- Style-CSS -->
<link rel="stylesheet" href="css/loginAdmin.css" type="text/css" media="all" /><!-- Style-CSS -->
	<link href="css/font-login.css" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Approve</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-catch, no-store, must-revalidate");
response.setHeader("Pragma","no-catch"); //http 1.0
response.setHeader("Expires","0"); //Proxies



if(session!=null)
{
	String userid = (String) session.getAttribute("username");
	
	String userdata1 = request.getParameter("userdata1");
	String userdata2 = request.getParameter("userdata2");
	String userdata3 = request.getParameter("userdata3");
	System.out.println("Name "+userdata1);
	System.out.println("class "+userdata2);
	
	HttpSession cUser = request.getSession();
	cUser.setAttribute("cuname", userdata1);
	cUser.setAttribute("cname", userdata2);
	cUser.setAttribute("ccertificate", userdata3);
	
	%>
<center><font color="Blue" size="8">Hey! Admin This Is Approve Page</font></center>
<% 
Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("select *  from certificate where username=? and name=? and certificate=?");
ps.setString(1, userdata1);
ps.setString(2, userdata2);
ps.setString(3, userdata3);
ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>


<section class="w3l-form-36">
		<div class="form-36-mian section-gap">
			<div class="wrapper">
				<div class="form-inner-cont">
					<h3>Certificate Approval Page</h3>
					<form action="Approve" method="post" class="signin-form">
					
						<label for="story">Certificate Approved:</label>

						<textarea id="story"  name="approve" rows="15" cols="100">
						
						Dear <%=rs.getString(1) %> 
						Your <%=rs.getString(2) %> Certificate has been Approved
						 on the behalf of <%=rs.getString(3) %>
						 Thank You!!
						 Administrative</textarea>
						
						
						<div class="login-remember d-grid">
							
								
								<span class="checkmark"></span>
								
							</label>
							<button class="btn theme-button">Approve Certificare</button>
						</div>
					
					</form>
				
					<!-- <p class="signup">Don’t have an account? <a href="re.jsp" class="signuplink">Sign up</a></p> -->
					<p class="signup">Want to go Home Page?  <a href="index.jsp" class="signuplink">Home Page</a></p>
				</div>

				<!-- copyright -->
				<div class="copy-right">
					<p>© 2020 Active Login Form. All rights reserved | Design by <a href="http://javatechnocrat.com"
							target="_blank">Team JTian</a></p>
				</div>
				<!-- //copyright -->
			</div>
		</div>
	</section>


<%
}
	
}
else
{
	RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
	rd.forward(request, response);
}
%>

</body>
</html>