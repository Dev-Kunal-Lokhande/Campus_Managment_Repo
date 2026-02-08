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
	public int showCountEvent() {
		// TODO Auto-generated method stub
		return A_event.showCountEvent();
	}
	@Override
	public List<AdminEvent> ViewData() {
		// TODO Auto-generated method stub
		return A_event.ViewData();
	}
	//Student Data ...
	@Override
	public boolean isSaveStudentData(AdminEvent model) {
		// TODO Auto-generated method stub
		return A_event.isSaveStudentData(model);
	}
	@Override
	public List<AdminEvent> ShowAllStudent() {
		// TODO Auto-generated method stub
		return A_event.ShowAllStudent();
	}
	

 
}
