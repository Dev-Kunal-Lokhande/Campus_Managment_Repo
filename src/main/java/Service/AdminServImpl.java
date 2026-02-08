package Service;
import Model.AdminRegister;
import Repository.Admin_regRepo;
import Repository.Admin_regRepoImpl;

public class AdminServImpl implements AdminServ{
	Admin_regRepo AdRepo = new Admin_regRepoImpl();
	@Override
	 public boolean isAddData(AdminRegister admin) {
		return AdRepo.isAddData(admin);
	}

}
