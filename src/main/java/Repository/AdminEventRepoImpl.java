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
			String sql = "insert into adminevent_m (name,EventDate,Location)" + " values(?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, model.getName());
			ps.setString(2, model.getEDate());
			ps.setString(3, model.getLocation());
			System.out.println("Name = " + model.getName());
			System.out.println("Date = " + model.getEDate());
			System.out.println("Location = " + model.getLocation());

			int value = ps.executeUpdate();
			return value > 0;

		} catch (Exception e) {
			System.out.println("Error (AdminEventRepoImpl) = " + e);
			return false;
		}
	}

	@Override
	public int showCountEvent() {
		try {
			String sql = "select count(*) from adminevent_m";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				System.out.print(rs.getInt(1));
				return rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("Error showcountEvent (AdminEventRepoImpl) = " + e);
			return 0;
		}
		return 0;
	}

	@Override
	public List<AdminEvent> ViewData() {

		List<AdminEvent> list = new ArrayList<>();

		try {
			String sql = "SELECT * FROM adminevent_m";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				AdminEvent a = new AdminEvent();

				a.setId(rs.getInt("id"));
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
			String sql = "insert into adminStudent_m (name,email,course,collage_name)" + "values(?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, model.getName());
			ps.setString(2, model.getS_Email());
			ps.setString(3, model.getSCollege_name());
			ps.setString(4, model.getS_Course());
			System.out.print(model.getName());
			int val = ps.executeUpdate();
			return val > 0;

		} catch (Exception e) {
			System.out.println("Error (isSaveStudentData) = " + e);
			return false;
		}

	}

	@Override
	public List<AdminEvent> ShowAllStudent() {
		list = new ArrayList<AdminEvent>();
		try {

			String sql = "select * from adminStudent_m";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				AdminEvent model = new AdminEvent();
				model.setId(rs.getInt("id"));
				model.setName(rs.getString("name"));
				model.setS_Email(rs.getString("email"));
				model.setS_Course(rs.getString("course"));
				model.setSCollege_name(rs.getString("collage_name"));
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
			String sql = "delete from adminevent_m where Id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			int value = ps.executeUpdate();
			return value > 0 ? true : false;
		} catch (Exception e) {
			System.out.print("Error (IsDeleteEvent) = " + e);
			return false;
		}

	}

}
