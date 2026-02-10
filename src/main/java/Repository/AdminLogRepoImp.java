package Repository;

import DBConfig.DbIntilizer;
import Model.AdminLogin;
import Model.AdminRegister;

public class AdminLogRepoImp extends DbIntilizer implements AdminLogRepo {

	@Override
	public AdminRegister isVerify(AdminLogin admin) {
		try {
			String sql = "select * from adminregister where email=? and password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, admin.getName());
			ps.setString(2, admin.getPassword());
			rs = ps.executeQuery();
			if(rs.next()){
			    AdminRegister admi = new AdminRegister();
			    admi.setAdmin_id(rs.getInt("admin_id"));   
	            admi.setName(rs.getString("name"));
	            admi.setEmail(rs.getString("email"));
	            admi.setContact(rs.getString("contact"));
	            admi.setPassword(rs.getString("password"));
			    return admi;
			}
			return null;

		} catch (Exception ex) {
			System.out.println("Error (AdminLog) = " + ex);
			return null;
		}
	}

}
