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


@WebServlet("/IncomeCertificate")
public class IncomeCertificate extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		HttpSession sessionUser = request.getSession();
		if(sessionUser!=null) 
		{
		String userid = (String) sessionUser.getAttribute("username");
		
		
		
		String name = request.getParameter("name");
		String fatherName = request.getParameter("fatherName");
		String dob = request.getParameter("dob");
		
		
		
		String gender = request.getParameter("gender");
		String occupation = request.getParameter("occupation");
		String income = request.getParameter("income");
		
		
		String Certificate = "Income";
		PreparedStatement ps=null, ps1=null;
		try {
			Connection cn=DBConn.getConnect();
			 ps=cn.prepareStatement("INSERT INTO income(username, name, dob, gender, occupation, income, fathername)"+ "VALUES (?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, userid);
			ps.setString(2, name);
			ps.setString(3, dob);
			ps.setString(4, gender);
			ps.setString(5, occupation);
			ps.setString(6, income);
			
			ps.setString(7, fatherName);
			
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
			out.println("<h5><center><font color='red'>Something Went Wrong !! Please Try Aga</font></center></h5>");
			RequestDispatcher rd = request.getRequestDispatcher("incomeCertificate.jsp");
			rd.include(request, response);
			
		}
	}
		else
		{
				response.sendRedirect("UserLogin");
		}
	}

}
