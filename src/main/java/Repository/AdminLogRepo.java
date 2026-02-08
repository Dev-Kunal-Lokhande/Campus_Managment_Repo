package Repository;

import Model.AdminLogin;
import Model.AdminRegister;

public interface AdminLogRepo {
	public AdminRegister isVerify(AdminLogin admin);
}
