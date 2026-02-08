package Repository;

import DBConfig.DbIntilizer;
import Model.AdminLogin;

public class AdminLogRepoImp extends DbIntilizer implements AdminLogRepo {

	@Override
	public boolean isVerify(AdminLogin admin) {
		try {
			String sql = "select * from adminregister where email=? and password=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, admin.getName());
			ps.setString(2, admin.getPassword());
			rs = ps.executeQuery();
			if(rs.next()){
				return true;
			}else{
				return false;
			}
		} catch (Exception ex) {
			System.out.println("Error (AdminLog) = " + ex);
			return false;
		}
	}

}
