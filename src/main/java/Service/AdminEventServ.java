package Service;

import java.util.List;

import Model.AdminEvent;

public interface AdminEventServ {
	public boolean isSaveData(AdminEvent model);
	public int showCountEvent(int admin_id);
	public List<AdminEvent> ViewData(int admin_id);
	public boolean isSaveStudentData(AdminEvent model);
	public List<AdminEvent> ShowAllStudent(int adminId);
	public int ShowStudentCount(int adminId);
	public boolean isDeleteEvent(int id);
    public boolean isUpdateEvent(AdminEvent model) ;
//    public AdminEvent getUpdateEvent(int id);
}
