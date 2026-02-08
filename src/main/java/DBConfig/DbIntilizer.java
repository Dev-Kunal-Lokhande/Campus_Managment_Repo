package DBConfig;
import java.util.*;
import java.sql.*;
public class DbIntilizer{
	protected Connection con ;
	protected PreparedStatement ps;
	protected ResultSet rs ;
	public DbIntilizer() {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/UiEvent","root","Satara@123");
			if(con!= null) {
				System.out.println("connexterew");
			}
			else {
				System.out.println("bot connexterew");
			}

		}catch(Exception ex)
		{
			System.out.println("error is "+ex);
		}
	}
	
}