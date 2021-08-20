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
import javax.servlet.http.HttpSession;

import adminLogin.db.DBConn;


@WebServlet("/BirthCertificate")
public class BirthCertificate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession sessionUser = request.getSession();
		if(sessionUser!=null) 
		{
		String userid = (String) sessionUser.getAttribute("username");
		
		
		
		String name = request.getParameter("name");
		
		
		
		
		String place = request.getParameter("place");
		String time = request.getParameter("time");
		String date = request.getParameter("date");
		String hospitalname = request.getParameter("hospitalName");
		String birthType = request.getParameter("birthType");
		String gender = request.getParameter("gender");
		String fatherName = request.getParameter("fatherName");
		String motherName = request.getParameter("motherName");
		
		String Certificate = "Birth";
		PreparedStatement ps=null, ps1=null;
		try {
			Connection cn=DBConn.getConnect();
			 ps=cn.prepareStatement("insert into birthCertificate values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, place);
			ps.setString(3, time);
			ps.setString(4, date);
			ps.setString(5, hospitalname);
			ps.setString(6, birthType);
			ps.setString(7, gender);
			ps.setString(8, fatherName);
			ps.setString(9, motherName);
			ps.executeUpdate();
			ps.close();
			
			
			ps1 = cn.prepareStatement("INSERT INTO certificate(name, Certificate, username)"+ "VALUES (?, ?, ?)");
			ps1.setString(1, name);
			ps1.setString(2, Certificate);
			ps1.setString(3, userid);
			ps1.executeUpdate();
			ps1.close();
			
			
			out.println("<h5><center><font color='green'>Applied Successfully !! </font></center></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("userHomePage.jsp");
			rd.include(request, response);
			
		}
			
		catch (SQLException e) {
			e.printStackTrace();
			out.println("<h5><center><font color='green'>Went Wrong !! </font></center></h5></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("birthCertificate.jsp");
			rd.include(request, response);
			
		}
	}
		else
		{
				response.sendRedirect("UserLogin");
		}
	}
		
		
		
	

}
