<%@ page language="java" import="java.sql.*,adminLogin.db.DBConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-catch, no-store, must-revalidate");
response.setHeader("Pragma","no-catch"); //http 1.0
response.setHeader("Expires","0"); //Proxies



if(session!=null)
{
	String userid = (String) session.getAttribute("username");
	
	%>
<%

Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("select *  from adminLogin where username=(?)");
ps.setString(1, userid);
ResultSet rs = ps.executeQuery();
String male="",female="";
if(rs.next())
{
	if(rs.getString(5).equalsIgnoreCase("male"))
	{
		male="checked";
	}else{
		female="checked";
	}
%>
<center><h2><font color="blue">Edit Your Profile</font></h2>
<font size="5">
	<form action="AdminEdit" method="post">
	<pre>
	Your UserName      : <input type="text" name="username"  readonly placeholder="Enter username" value="<%=rs.getString(1) %>"><br><br>
	Edit Your Password     : <input type="text" name="password" placeholder="Enter Password" value="<%=rs.getString(2) %>"><br><br>
	Edit Your Name     : <input type="text" name="name" placeholder="Enter Name" value="<%=rs.getString(3) %>"><br><br>
	Edit Your Address  : <input type="text" name="address" placeholder="Enter Address" value="<%=rs.getString(4) %>"><br><br>
	Select Your Gender : <input type="radio" name="gender"  value="Male"<%=male %>> Male <input type="radio" name="gender"  value="Female" <%=female %>>Female
					     
	<br><br>
	<input type="submit" value="Edit">
	<br><br><br><br>
	<a href="adminHome.jsp">Back To Home Page</a>
	<a href="logout.jsp">Logout</a>
	
	</pre>
	</form>
</font>
</center>
<% 
}
}
else
{
	response.sendRedirect("adminLogin.jsp");
}
%>
</body>
</html>