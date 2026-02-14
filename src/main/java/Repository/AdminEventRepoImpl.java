package Repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import DBConfig.DbIntilizer;
import Model.AdminEvent;

public class AdminEventRepoImpl extends DbIntilizer implements AdminEventRepo {
	List<AdminEvent> list;

	@Override
	public boolean isSaveData(AdminEvent model) {
		try {
			String sql = "INSERT INTO adminevent_m (name, EventDate, Location, admin_id) VALUES (?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, model.getName());
			ps.setString(2, model.getEDate());
			ps.setString(3, model.getLocation());
			ps.setInt(4, model.getAdminId());
			System.out.println("Name = " + model.getName());
			System.out.println("Date = " + model.getEDate());
			System.out.println("Location = " + model.getLocation());
			System.out.println("Admin id ="+ model.getAdminId());

			int value = ps.executeUpdate();
			return value > 0? true:false;

		} catch (Exception e) {
			System.out.println("Error (AdminEventRepoImpl) isSavedata = " + e);
			return false;
		}
	}

	@Override
	public int showCountEvent(int admin_id) {
		try {
			String sql = "select count(*) from adminevent_m where admin_id=?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1, admin_id);
			rs = ps.executeQuery();
			if (rs.next()) {
//				System.out.print(rs.getInt(1));
				return rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("Error showcountEvent (AdminEventRepoImpl) = " + e);
			return 0;
		}
		return 0;
	}

	@Override
	public List<AdminEvent> ViewData(int admin_id) {

		List<AdminEvent> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM adminevent_m where admin_id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, admin_id);
			rs = ps.executeQuery();

			while (rs.next()) {
				AdminEvent a = new AdminEvent();

				a.setId(rs.getInt("E_Id"));
				a.setName(rs.getString("name"));
				a.setEDate(rs.getString("EventDate"));
				a.setLocation(rs.getString("Location"));

				list.add(a);
			}

		} catch (Exception e) {
			System.out.println("Error ViewData = " + e);
			return null;
		}

		return list;
	}

	// ******************************* Student data *****************************
	@Override
	public boolean isSaveStudentData(AdminEvent model) {
		try {
			String sql = "INSERT INTO adminStudent_m (Name, Email, Course, College_Name, admin_id) VALUES (?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, model.getName());
			ps.setString(2, model.getS_Email());
			ps.setString(3, model.getSCollege_name());
			ps.setString(4, model.getS_Course());
			ps.setInt(5, model.getAdminId());
			int val = ps.executeUpdate();
			return val > 0  ? true:false;

		} catch (Exception e) {
			System.out.println("Error (isSaveStudentData) = " + e);
			return false;
		}

	}

	@Override
	public List<AdminEvent> ShowAllStudent(int adminId) {
		list = new ArrayList<AdminEvent>();
		try {

			String sql = "select * from adminStudent_m where admin_id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, adminId);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminEvent model = new AdminEvent();
				model.setId(rs.getInt("S_Id"));
				model.setName(rs.getString("Name"));
				model.setS_Email(rs.getString("Email"));
				model.setS_Course(rs.getString("Course"));
				model.setSCollege_name(rs.getString("College_Name"));
				list.add(model);

			}

		} catch (Exception e) {
			System.out.println("Error (ShowAllStudent) = " + e);
			return null;
		}
		return list;

	}

	@Override
	public boolean isDeleteEvent(int id) {
		try {
			String sql = "delete from adminevent_m where  E_Id =?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			int value = ps.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception e) {
			System.out.println("Error (IsDeleteEvent) = " + e);
			return false;
		}

	}

	@Override
	public int ShowStudentCount(int adminId) {
		try {
			String sql ="select count(*)from adminstudent_m where admin_id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, adminId);
			rs = ps.executeQuery();
			if (rs.next()) {
//				System.out.print(rs.getInt(1));
				return rs.getInt(1);
			}
			
		}catch (Exception e) {
			System.out.println("Error (AdminEventrepoImpl) ShowStudentCount ="+e);
			return 0;
		}
		return 0;
	}

	@Override
	public boolean isUpdateEvent(AdminEvent model) {

	    boolean flag = false;

	    try {
	        String sql = "UPDATE adminevent_m SET name=?, EventDate=?, Location=?, admin_id=? WHERE E_Id=?";
	        ps = con.prepareStatement(sql);

	        ps.setString(1, model.getName());
	        ps.setString(2, model.getEDate());
	        ps.setString(3, model.getLocation());
	        ps.setInt(4, model.getAdminId());
	        ps.setInt(5, model.getId());

	        int val = ps.executeUpdate();

	        if(val > 0){
	            flag = true;
	        }

	    } catch(Exception e){
	        System.out.println(e);
	    }

	    return flag;
	}
	
}
