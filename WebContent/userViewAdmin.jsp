<%@ page language="java" import="java.sql.*,adminLogin.db.DBConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User Page</title>
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
<center><font color="Blue" size="8">Hey! Admin This Is User View Page!!</font></center>
<% 
Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("select *  from user_registration");

ResultSet rs = ps.executeQuery();



int i=1;


%>


<center>
<font size="5">
<table border="5" width="100%">
<tr><th>Serial No.</th><th>Username</th><th>Name</th><th>Address</th><th>Gender</th><th>Delete</th></tr>
<%while(rs.next())
	{
	%>
	<tr color="black"><td><%=i++ %></td><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(4) %></td><td><%=rs.getString(5) %></td>
	
	<td><a href="deleteAdmin.jsp?Username=<%=rs.getString(3)%>">Delete Account</a></td>
	
	<%
	}
}
else
{
	RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
	rd.forward(request, response);
}
%>
</table>
<br><br><br>
	<pre><center><a href="logout.jsp">Logout</a>  <a href="adminHome.jsp">Admin Home Page</a></center>  </pre>
</font>
</center>

</body>
</html>