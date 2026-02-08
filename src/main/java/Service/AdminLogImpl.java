package Service;

import Model.AdminLogin;
import Model.AdminRegister;
import Repository.AdminLogRepo;
import Repository.AdminLogRepoImp;

public class AdminLogImpl implements AdminLog {
	AdminLogRepo logrepo = new AdminLogRepoImp();
	@Override
    public AdminRegister isVerify(AdminLogin log) {
        return logrepo.isVerify(log);
    }
}
