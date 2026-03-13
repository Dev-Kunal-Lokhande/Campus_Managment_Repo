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
	@Override
	public boolean isEmailExists(String email) {
		return AdRepo.isEmailExists(email);
	}
	@Override
	public AdminRegister getAdminByEmail(String email) {
		return AdRepo.getAdminByEmail(email);
	}

}
