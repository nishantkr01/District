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
String uname = request.getParameter("Username");
Connection cn = DBConn.getConnect();
PreparedStatement ps = cn.prepareStatement("delete FROM user_registration WHERE username = (?)");
ps.setString(1, uname);
int i = ps.executeUpdate();
if(i==1)
{
	%>
	<h2><center><font color="Green">Deleted Successfull</font></center></h2>
    <jsp:include page="userProfile.jsp"></jsp:include>
	<%
}
%>
</body>
</html>