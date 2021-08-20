package adminLogin;

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

@WebServlet("/Approve")
public class Approve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String approve = request.getParameter("approve");
		
		HttpSession cUser = request.getSession();
		String cuname = (String) cUser.getAttribute("cuname");
		String cname = (String) cUser.getAttribute("cname");
		String ccertificate = (String) cUser.getAttribute("ccertificate");
		
		System.out.println("Name "+cuname);
		System.out.println("class "+cname);
		System.out.println("class "+ccertificate);
		
		try {
			Connection cn=DBConn.getConnect();
			PreparedStatement ps=cn.prepareStatement("insert into approve(approve, username) values(?,?) ");
			ps.setString(1,approve);
			ps.setNString(2, cuname);
			ps.executeUpdate();
			
			PreparedStatement ps1=cn.prepareStatement("DELETE FROM certificate WHERE username=? and name=? and certificate=?");
			ps1.setString(1, cuname);
			ps1.setString(2, cname);
			ps1.setString(3, ccertificate);
			ps1.executeUpdate();
			
				
				out.println("<h5><center><font color='green'>Approved Successfull</font></center></h5>");
				RequestDispatcher rd = request.getRequestDispatcher("certificateRequestAdmin.jsp");
				rd.include(request, response);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<h5><center><font color='red'>Something Went Wrong !! Please Try Aga</font></center></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("adminLogin.html");
			rd.include(request, response);
			
		}
		
	}

}
