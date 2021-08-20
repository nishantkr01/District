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
String username = request.getParameter("Username");
String report = request.getParameter("report");

PreparedStatement ps, ps1;
Connection cn = DBConn.getConnect();
 ps = cn.prepareStatement("delete FROM  user_registration WHERE username = (?)");
ps.setString(1, username);
int i = ps.executeUpdate();
if(i==1)
{
	%>
	<h2><center><font color="Green">Deleted Successfull</font></center></h2>
    <jsp:include page="userViewAdmin.jsp"></jsp:include>
	<%
}
ps.close();


ps1 = cn.prepareStatement("delete FROM  report WHERE serial_no = (?)");
ps1.setString(1, report);
int j = ps1.executeUpdate();
if(j==1)
{
	%>
	<h2><center><font color="Green">Action Taken</font></center></h2>
    <jsp:include page="adminReport.jsp"></jsp:include>
	<%
}
ps1.close();

%>
</body>
</html>