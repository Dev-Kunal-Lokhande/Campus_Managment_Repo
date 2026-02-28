package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;

@WebServlet("/Update_A_Student")
public class Update_A_Student extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.sendRedirect("StudentManage");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    String idStr = request.getParameter("id");

	    if (idStr == null || idStr.trim().equals("") || idStr.equals("null")) {
	        response.getWriter().println("Invalid ID received!");
	        return;
	    }

	    int Id = Integer.parseInt(idStr);

	    String name = request.getParameter("Name");
	    String Email = request.getParameter("Email");
	    String Course = request.getParameter("Course");
	    String College_name = request.getParameter("College_name");

	    Integer Admin_id = (Integer) request.getSession().getAttribute("id");

	    System.out.print("Admin_Id Sudent"+Admin_id);

	    if (Admin_id == null) {
	        response.getWriter().println("Session expired. Please login again.");
	        return;
	    }

	    AdminEvent model = new AdminEvent();
	    model.setId(Id);
	    model.setName(name);
	    model.setS_Email(Email);
	    model.setS_Course(Course);
	    model.setSCollege_name(College_name);
	    model.setAdminId(Admin_id);

	    AdminEventServ ser = new AdminEventServImpl();
	    boolean d = ser.isUpdateStudentA(model);

	    if (d) {
	        response.sendRedirect("StudentManage");
	    } else {
	        response.getWriter().println("Update Failed");
	    }
	}

}
