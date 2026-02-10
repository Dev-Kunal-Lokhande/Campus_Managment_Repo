package Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import Model.AdminRegister;
import DBConfig.*;

public class Admin_regRepoImpl extends DbIntilizer implements Admin_regRepo {
	
	@Override
	public boolean isAddData(AdminRegister admin) {
		try
		{
		String sql ="insert into adminregister values('0',?,?,?,?,NOW())";
		ps=con.prepareStatement(sql);
		ps.setString(1,admin.getName());
		ps.setString(2, admin.getEmail());
		ps.setString(3, admin.getContact());
		ps.setString(4, admin.getPassword());
		
		System.out.println(admin.getName());
		
		int value = ps.executeUpdate();
		return value>0;
		
		
		}catch(Exception ex)
		{
			System.out.println("Error is (Admin_regRepoImpl) = "+ex);
			return false;
		}
		// TODO Auto-generated method stub
		
	}

}
