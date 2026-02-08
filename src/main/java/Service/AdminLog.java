package Service;

import Model.AdminLogin;
import Model.AdminRegister;

public interface AdminLog {
	public AdminRegister isVerify(AdminLogin admin);
}
