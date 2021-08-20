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
<center><font color="Blue" size="8">Hey! This Is Admin Profile Page!!</font></center>
<% 
Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("select *  from adminlogin where username=?");
ps.setString(1, userid);
ResultSet rs = ps.executeQuery();
int i=1;
%>


<center>
<font size="5">
<table border="5" width="100%">
<tr><th>Serial No.</th><th>Username</th><th>Name</th><th>Address</th><th>Gender</th><th>Edit</th><th>Delete</th></tr>
<%while(rs.next())
	{
	%>
	<tr color="black"><td><%=i++ %></td><td><%=rs.getString(1) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td>
	
	<td><a href="adminEdit.jsp?Username=<%=rs.getString(1)%>">Edit Account</a></td>
	<td><a href="deleteAdmin.jsp?Username=<%=rs.getString(1)%>">Delete Account</a></td>
	
	<%
	}
}
else
{
	response.sendRedirect("adminLogin.jsp");
}
%>
</table>
<br><br><br>
	<pre><center><a href="logout.jsp">Logout</a>  <a href="adminHome.jsp">Admin Home Page</a></center>  </pre>
</font>
</center>



</body>
</html>