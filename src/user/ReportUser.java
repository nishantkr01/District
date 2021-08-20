package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminLogin.db.DBConn;


@WebServlet("/ReportUser")
public class ReportUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String report = request.getParameter("report");
		
		
		try {
			Connection cn=DBConn.getConnect();
			PreparedStatement ps=cn.prepareStatement("INSERT INTO report(report)"+ "VALUES (?)");
	
			ps.setString(1, report);
		
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				
				out.println("<h3><center><font size='7' color='green'>Successfully Reported Your Complain!!</font></center></h3>");
				RequestDispatcher rd = request.getRequestDispatcher("userHomePage.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("<h3><center><font size='7' color='red'>Login Failed</font></center></h3>");
				RequestDispatcher rd = request.getRequestDispatcher("userHomePage.jsp");
				rd.include(request, response);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<h5><center><font color='red'>Something Went Wrong !! Please Try Aga</font></center></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("userHomePage.jsp");
			rd.include(request, response);
			
		}
		
	}

}
