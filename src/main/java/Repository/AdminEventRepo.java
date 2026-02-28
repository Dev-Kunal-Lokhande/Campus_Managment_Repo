package Repository;

import java.util.*;

import Model.AdminEvent;

public interface AdminEventRepo {
	public boolean isSaveData(AdminEvent model);

	public int showCountEvent(int admin_id);

	public List<AdminEvent> ViewData(int admin_id);

	public boolean isSaveStudentData(AdminEvent model);

	public List<AdminEvent> ShowAllStudent(int adminId);

	public boolean isDeleteEvent(int id);

	public int ShowStudentCount(int adminId);

	public boolean isUpdateEvent(AdminEvent model);

	public boolean isdeleteASTudent(int id);

	public boolean isUpdateStudentA(AdminEvent model);
}
