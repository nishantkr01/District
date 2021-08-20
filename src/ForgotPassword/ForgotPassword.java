package ForgotPassword;

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

import adminLogin.db.DBConn;


@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Connection cn = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String username = request.getParameter("username");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		
		String page=request.getParameter("tt");
		
		if(page.equals("register"))
		{
			 cn = DBConn.getConnect();
			 try {
				PreparedStatement ps = cn.prepareStatement("select * from user_registration where username=? and name=? and address=?");
				ps.setString(1, username);
				ps.setString(2, name);
				ps.setString(3, address);
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					String un = rs.getString(3);
					
					
					out.println("<center><h2><font size='5' color='green'>Your Password is : "+un+"</font></h2></center>");
					RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
					rd.include(request, response);
				}
				else {
					out.println("<center><h2><font size='4' color='red'>Please write your details Correctly and Your details is same as the time of Registration</font></h2></center>");
					RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
					rd.include(request, response);
				}
				ps.close();
			} catch (SQLException e) {
				
				out.println("<center><h2><font size='4' color='red'>Please write your details Correctly and Your details is same as the time of Registration</font></h2></center>");
				RequestDispatcher rd = request.getRequestDispatcher("forgotPassword.jsp");
				rd.include(request, response);
				e.printStackTrace();
			}
		}
		
		if(page.contentEquals("adminPassword"))
		{
			cn = DBConn.getConnect();
			 try {
				PreparedStatement ps = cn.prepareStatement("select * from adminlogin where username=? and name=? and address=?");
				ps.setString(1, username);
				ps.setString(2, name);
				ps.setString(3, address);
				ResultSet rs = ps.executeQuery();
				
				if(rs.next()) {
					String un = rs.getString(2);
					System.out.println("cnshh "+un);
					
					out.println("<center><h2><font size='5' color='green'>Your Password is : "+un+"</font></h2></center>");
					RequestDispatcher rd = request.getRequestDispatcher("forgotPasswordAdmin.jsp");
					rd.include(request, response);
				}
				else {
					out.println("<center><h2><font size='4' color='red'>Please write your details Correctly and Your details is same as the time of Registration</font></h2></center>");
					RequestDispatcher rd = request.getRequestDispatcher("forgotPasswordAdmin.jsp");
					rd.include(request, response);
				}
				ps.close();
			} catch (SQLException e) {
				
				out.println("<center><h2><font size='4' color='red'>Please write your details Correctly and Your details is same as the time of Registration</font></h2></center>");
				RequestDispatcher rd = request.getRequestDispatcher("forgotPasswordAdmin.jsp");
				rd.include(request, response);
				e.printStackTrace();
			}
		}
		}
		
		
		
		
	

}
