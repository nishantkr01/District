<%@ page language="java" import="java.sql.*, adminLogin.db.DBConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
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

<% 
Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("select *  from certificate");

ResultSet rs = ps.executeQuery();
int i=1;
%>


<center>
<font size="5">
<table border="5" width="100%">
<tr><th>Serial No.</th><th>User name</th><th>name</th><th>Certificate</th><th>Approve</th><th>Reject</th></tr>
<%while(rs.next())
	{
	String s1=rs.getString(3);
	String s2=rs.getString(1);
	
	%>
	<tr color="black"><td><%=i++ %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td>
	<td><a href="approve.jsp?userdata1=<%=s1%>&userdata2=<%=s2%>&userdata3=<%=rs.getString(2)%>">Approve</a> </td>
	<td><a href="reject.jsp?userdata1=<%=s1%>&userdata2=<%=s2%>&userdata3=<%=rs.getString(2)%>">Reject</a> </td>
	<!-- PDRS?param1="+lat+"?param2="+lon); -->
	
	

	
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