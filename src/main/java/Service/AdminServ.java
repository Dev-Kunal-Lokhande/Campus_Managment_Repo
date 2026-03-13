package Service;

import Model.AdminRegister;

public interface AdminServ {
 public boolean isAddData(AdminRegister admin);
 public boolean isEmailExists(String email);
 public AdminRegister getAdminByEmail(String email);
}
