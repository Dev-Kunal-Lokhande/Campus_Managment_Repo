package Service;

import Model.AdminLogin;
import Repository.AdminLogRepo;
import Repository.AdminLogRepoImp;

public class AdminLogImpl implements AdminLog {
	AdminLogRepo logrepo = new AdminLogRepoImp();
	@Override
    public boolean isVerify(AdminLogin log) {
        return logrepo.isVerify(log);
    }
}
