package Repository;

import java.util.*;

import Model.AdminEvent;

public interface AdminEventRepo {
	public boolean isSaveData(AdminEvent model);
	public int showCountEvent();
	public List<AdminEvent> ViewData();
	public boolean isSaveStudentData(AdminEvent model);	
	public List<AdminEvent>ShowAllStudent();
	public boolean isDeleteEvent(int id);
}
