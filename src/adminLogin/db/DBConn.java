package adminLogin.db;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	
		static Connection cn;
		public static Connection getConnect() {
			try {
				if(cn==null)
				{
				Class.forName("com.mysql.jdbc.Driver");
				cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/district","root","root");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		return cn;
		

	}
}


