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


@WebServlet("/Reject")
public class Reject extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String reject = request.getParameter("approve");
		System.out.println("name1 "+reject);
		HttpSession cUser = request.getSession();
		String cuname = (String) cUser.getAttribute("cuname");
		String cname = (String) cUser.getAttribute("cname");
		String ccertificate = (String) cUser.getAttribute("ccertificate");
		
		
		
		try {
			Connection cn=DBConn.getConnect();
			
			
			PreparedStatement ps1=cn.prepareStatement("DELETE FROM certificate WHERE username=? and name=? and certificate=?");
			ps1.setString(1, cuname);
			ps1.setString(2, cname);
			ps1.setString(3, ccertificate);
			ps1.executeUpdate();
			ps1.close();
			
			PreparedStatement ps=cn.prepareStatement("insert into approve(reject, username) values(?,?) ");
			ps.setString(1, reject);
			ps.setNString(2, cuname);
			int i=ps.executeUpdate();
			ps.close();
			if(i==1) {
				
				out.println("<h5><center><font color='green'>Reject Successfull</font></center></h5>");
				RequestDispatcher rd = request.getRequestDispatcher("certificateRequestAdmin.jsp");
				rd.include(request, response);
			}else {
				response.sendRedirect("adminHome.jsp");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("<h5><center><font color='red'>Something Went Wrong !! Please Try Aga</font></center></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("adminLogin.html");
			rd.include(request, response);
			
		}
		
	}

}
