package Service;

import java.util.List;

import Model.AdminEvent;
import Repository.AdminEventRepo;
import Repository.AdminEventRepoImpl;

public class AdminEventServImpl  implements AdminEventServ{
   AdminEventRepo A_event= new AdminEventRepoImpl();
	@Override
	public boolean isSaveData(AdminEvent model) {
		
		return A_event.isSaveData(model);
		
		
	}
	@Override
	public int showCountEvent(int admin_id) {
		// TODO Auto-generated method stub
		return A_event.showCountEvent(admin_id);
	}
	@Override
	public List<AdminEvent> ViewData(int admin_id) {
		// TODO Auto-generated method stub
		return A_event.ViewData( admin_id);
	}
	//Student Data ...
	@Override
	public boolean isSaveStudentData(AdminEvent model) {
		// TODO Auto-generated method stub
		return A_event.isSaveStudentData(model);
	}
	@Override
	public List<AdminEvent> ShowAllStudent(int adminId) {
		// TODO Auto-generated method stub
		return A_event.ShowAllStudent(adminId);
	}
	@Override
	public boolean isDeleteEvent(int id) {
		// TODO Auto-generated method stub
		return A_event.isDeleteEvent(id);
	}
	@Override
	public int ShowStudentCount(int adminId) {

		return A_event.ShowStudentCount(adminId);
	}
	@Override
	public boolean isUpdateEvent(AdminEvent model){
		
		return A_event.isUpdateEvent( model);
	}

	@Override
	public boolean isdeleteASTudent(int id) {
		
		return A_event.isdeleteASTudent(id);
	}
	@Override
	public boolean isUpdateStudentA(AdminEvent model) {
		
		return A_event.isUpdateStudentA( model);
	}


 
}
