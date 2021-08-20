package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminLogin.db.DBConn;


@WebServlet("/UserRegistration")
public class UserRegistration extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String gender = request.getParameter("gender");
		
		
		try {
			Connection cn=DBConn.getConnect();
			PreparedStatement ps=cn.prepareStatement("INSERT INTO user_registration(username, name, password, address, gender)"+ "VALUES (?, ?, ?, ?, ?)");
			ps.setString(1,username);
			ps.setString(2,name);
			ps.setString(3, password);
			ps.setString(4, address);
			ps.setString(5, gender);
			
			int i = ps.executeUpdate();
			if(i==1)
			{
				
				out.println("<h3><center><font color='green'>Registered Successfully</font></center></h3>");
				RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
				rd.include(request, response);
			}
			else
			{
				out.println("<h3><center><font color='red'>Login Failed</font></center></h3>");
				RequestDispatcher rd = request.getRequestDispatcher("adminLogin.html");
				rd.include(request, response);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<h5><center><font color='red'>Something Went Wrong !! Please Try Aga</font></center></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("userRegistration.jsp");
			rd.include(request, response);
			
		}
	}

}
