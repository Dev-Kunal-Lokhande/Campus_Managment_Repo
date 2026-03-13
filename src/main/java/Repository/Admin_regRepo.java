package Repository;

import Model.AdminRegister;

public interface Admin_regRepo {
	public boolean isAddData(AdminRegister admin);

	 public boolean isEmailExists(String email);
	 public AdminRegister getAdminByEmail(String email); //forgot pass admin
}
