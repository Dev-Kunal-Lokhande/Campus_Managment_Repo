package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import Model.AdminEvent;
import Service.AdminEventServ;
import Service.AdminEventServImpl;
import Service.AdminServ;
import Service.AdminServImpl;

/**
 * Servlet implementation class AddStudent_Event
 */
@WebServlet("/AddStudent_Event")
public class AddStudent_Event extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminEventServ ser = new AdminEventServImpl();
		List<AdminEvent>listS=ser.ShowAllStudent();
		request.setAttribute("EventStudent", listS);
		
		RequestDispatcher re =request.getRequestDispatcher("AdminEvent.jsp");
		re.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	 PrintWriter out=response.getWriter();	 
	 response.setContentType("text/html");
	 String Name=request.getParameter("name");
	 String Email=request.getParameter("email");
	 String Course=request.getParameter("course");
	 String College_Name=request.getParameter("college_name");
	
	 AdminEvent model = new AdminEvent();
	 model.setName(Name);
	 model.setS_Email(Email);
	 model.setS_Course(Course);
	 model.setSCollege_name(College_Name);
	 
	 AdminEventServ Serv = new AdminEventServImpl();
     Serv.isSaveStudentData(model);
   
	 response.sendRedirect("AdminEvent_M");
	
	}

}
