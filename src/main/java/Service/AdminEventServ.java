package Service;

import java.util.List;

import Model.AdminEvent;

public interface AdminEventServ {
	public boolean isSaveData(AdminEvent model);
	public int showCountEvent();
	public List<AdminEvent> ViewData();
	public boolean isSaveStudentData(AdminEvent model);
	public List<AdminEvent> ShowAllStudent();
}
